package com.Sora.XPHelper;

import android.app.job.JobInfo;
import android.app.job.JobScheduler;
import android.content.ComponentName;
import android.content.Context;
import android.content.SharedPreferences;
import android.net.Uri;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.TimeUnit;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.net.ssl.HttpsURLConnection;

final class ReleaseUpdates {
    static final String REPO = "https://github.com/Kasugano-Soras/XPHelper";
    static final String RELEASES = REPO + "/releases";
    static final String AUTO = "auto";
    static final String CHECKED_AT = "checked_at";
    static final String TAG = "tag";
    static final String ANNOUNCED = "announced";
    static final int JOB_ID = 12901;
    private static final String API =
            "https://api.github.com/repos/Kasugano-Soras/XPHelper/releases?per_page=100";
    private static final long INTERVAL = TimeUnit.DAYS.toMillis(30);
    private static final int MAX_RESPONSE_BYTES = 4 * 1024 * 1024;
    private static final Pattern VERSION = Pattern.compile(
            "[vV]?([0-9]{1,9}(?:\\.[0-9]{1,9}){0,3})(?:\\+[A-Za-z0-9.-]+)?");

    private ReleaseUpdates() {}

    static final class Release {
        final String tag, url, digest;
        final long size;
        Release(String tag, String url, String digest, long size) {
            this.tag = tag; this.url = url; this.digest = digest; this.size = size;
        }
    }

    static SharedPreferences preferences(Context context) {
        return context.getSharedPreferences("release_updates", Context.MODE_PRIVATE);
    }

    static boolean setAutomatic(Context context, boolean enabled) {
        JobScheduler scheduler = context.getSystemService(JobScheduler.class);
        SharedPreferences prefs = preferences(context);
        if (!enabled) {
            prefs.edit().putBoolean(AUTO, false).apply();
            scheduler.cancel(JOB_ID);
            return true;
        }
        prefs.edit().putBoolean(AUTO, true).apply();
        if (ensureScheduled(context)) return true;
        prefs.edit().putBoolean(AUTO, false).apply();
        return false;
    }

    static boolean ensureScheduled(Context context) {
        JobScheduler scheduler = context.getSystemService(JobScheduler.class);
        for (JobInfo job : scheduler.getAllPendingJobs()) {
            if (job.getId() == JOB_ID) {
                if (job.getService().getClassName().equals(ReleaseCheckJob.class.getName())) return true;
                scheduler.cancel(JOB_ID);
            }
        }
        try {
            JobInfo.Builder job = new JobInfo.Builder(JOB_ID,
                    new ComponentName(context, ReleaseCheckJob.class))
                    .setPersisted(true)
                    .setRequiredNetworkType(JobInfo.NETWORK_TYPE_ANY);
            if (android.os.Build.VERSION.SDK_INT >= 24) job.setPeriodic(INTERVAL, TimeUnit.DAYS.toMillis(2));
            else job.setPeriodic(INTERVAL);
            return scheduler.schedule(job.build()) == JobScheduler.RESULT_SUCCESS;
        } catch (RuntimeException unavailable) {
            return false;
        }
    }

    static Release latest() throws IOException, JSONException {
        HttpsURLConnection connection = (HttpsURLConnection) new URL(API).openConnection();
        try {
            connection.setConnectTimeout(8000);
            connection.setReadTimeout(8000);
            connection.setInstanceFollowRedirects(false);
            connection.setRequestProperty("Accept", "application/vnd.github+json");
            connection.setRequestProperty("X-GitHub-Api-Version", "2022-11-28");
            connection.setRequestProperty("User-Agent", "PengyouAssistant");
            int status = connection.getResponseCode();
            if (status != 200) throw new IOException("HTTP " + status);
            try (InputStream input = connection.getInputStream();
                 ByteArrayOutputStream bytes = new ByteArrayOutputStream()) {
                byte[] buffer = new byte[8192];
                int read;
                while ((read = input.read(buffer)) != -1) {
                    if (bytes.size() + read > MAX_RESPONSE_BYTES) throw new IOException("Release response too large");
                    bytes.write(buffer, 0, read);
                }
                return newestStable(new JSONArray(new String(bytes.toByteArray(), StandardCharsets.UTF_8)));
            }
        } finally {
            connection.disconnect();
        }
    }

    static String newestStableTag(JSONArray releases) throws JSONException {
        return newestStable(releases).tag;
    }

    static Release newestStable(JSONArray releases) throws JSONException {
        Release latest = new Release("", "", "", 0);
        for (int index = 0; index < releases.length(); index++) {
            JSONObject release = releases.getJSONObject(index);
            if (release.optBoolean("draft") || release.optBoolean("prerelease")) continue;
            String tag = release.optString("tag_name");
            if (versionParts(tag) == null) continue;
            if (!latest.tag.isEmpty() && !isNewer(tag, latest.tag)) continue;
            String url = "", digest = "";
            long size = 0;
            int best = -1;
            JSONArray assets = release.optJSONArray("assets");
            if (assets != null) for (int i = 0; i < assets.length(); i++) {
                JSONObject asset = assets.getJSONObject(i);
                String name = asset.optString("name").toLowerCase(java.util.Locale.ROOT);
                String link = asset.optString("browser_download_url");
                if (!name.endsWith(".apk") || !link.startsWith(REPO + "/releases/download/")
                        || !"uploaded".equals(asset.optString("state", "uploaded"))) continue;
                int rank = (name.contains("universal") ? 4 : 0) + (name.contains("release") ? 2 : 0)
                        + (name.contains("apkhelper") ? 1 : 0);
                if (rank <= best) continue;
                best = rank; url = link; digest = asset.isNull("digest") ? "" : asset.optString("digest");
                size = asset.optLong("size");
            }
            latest = new Release(tag, url, digest, size);
        }
        return latest;
    }

    static boolean isNewer(String candidate, String installed) {
        int[] next = versionParts(candidate);
        int[] current = versionParts(installed);
        if (next == null || current == null) return false;
        for (int index = 0; index < next.length; index++) {
            if (next[index] != current[index]) return next[index] > current[index];
        }
        return false;
    }

    private static int[] versionParts(String tag) {
        Matcher match = VERSION.matcher(tag);
        if (!match.matches()) return null;
        String[] components = match.group(1).split("\\.");
        int[] numbers = new int[4];
        for (int index = 0; index < components.length; index++) {
            numbers[index] = Integer.parseInt(components[index]);
        }
        return numbers;
    }

    static String releasePage(String tag) {
        return versionParts(tag) == null ? RELEASES : RELEASES + "/tag/" + Uri.encode(tag);
    }

    static void saveResult(SharedPreferences prefs, Release release) {
        prefs.edit().putString(TAG, release.tag).putLong(CHECKED_AT, System.currentTimeMillis()).apply();
    }
}
