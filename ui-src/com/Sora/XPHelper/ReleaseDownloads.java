package com.Sora.XPHelper;

import android.app.DownloadManager;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.database.Cursor;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.security.MessageDigest;
import java.util.Arrays;
import java.util.Locale;

/** Durable public-Download transfers; no automatic or silent installation. */
final class ReleaseDownloads {
    static final String ID = "download_id", TAG = "download_tag", PATH = "download_path";
    static final String READY = "download_ready", ERROR = "download_error";
    private static final String DIGEST = "download_digest", SIZE = "download_size";
    private static final long MAX_APK = 256L * 1024 * 1024;

    static final class State {
        final long id, done, total;
        final int status;
        State(long id, int status, long done, long total) {
            this.id = id; this.status = status; this.done = done; this.total = total;
        }
        boolean active() { return status == DownloadManager.STATUS_PENDING || status == DownloadManager.STATUS_RUNNING
                || status == DownloadManager.STATUS_PAUSED; }
    }

    private ReleaseDownloads() {}

    static void forgetInstalled(Context context) {
        SharedPreferences prefs = ReleaseUpdates.preferences(context);
        String tag = prefs.getString(TAG, "");
        try {
            String current = context.getPackageManager().getPackageInfo(context.getPackageName(), 0).versionName;
            if (!tag.isEmpty() && !ReleaseUpdates.isNewer(tag, current)) {
                // Keep the public APK; only reset the completed updater's bookkeeping.
                prefs.edit().remove(ID).remove(TAG).remove(PATH).remove(READY).remove(ERROR).remove(DIGEST).remove(SIZE).apply();
            }
        } catch (PackageManager.NameNotFoundException ignored) {}
    }

    static synchronized void enqueue(Context context, ReleaseUpdates.Release release) throws IOException {
        if (release.url.isEmpty()) throw new IOException("该发行版尚未提供 APK 安装包");
        if (release.size <= 0 || release.size > MAX_APK) throw new IOException("发行版 APK 大小无效");
        SharedPreferences prefs = ReleaseUpdates.preferences(context);
        State old = state(context);
        boolean same = release.tag.equals(prefs.getString(TAG, ""));
        if (same && (old.active() || readyFile(context) != null
                || (old.status == DownloadManager.STATUS_SUCCESSFUL && prefs.getString(ERROR, "").isEmpty()))) return;
        // One update transfer at a time. Remove only a superseded unfinished transfer owned by this app.
        DownloadManager manager = context.getSystemService(DownloadManager.class);
        if (manager == null) throw new IOException("系统下载服务不可用");
        if (old.active()) manager.remove(old.id);
        String fileName = "Pengyou-Assistant-" + release.tag.replaceAll("[^A-Za-z0-9._-]", "_")
                + "-" + System.currentTimeMillis() + ".apk";
        try {
            DownloadManager.Request request = new DownloadManager.Request(Uri.parse(release.url))
                    .setTitle("鹏友助手 " + release.tag)
                    .setDescription("下载完成后返回鹏友助手确认安装")
                    .setMimeType("application/vnd.android.package-archive")
                    .setNotificationVisibility(DownloadManager.Request.VISIBILITY_VISIBLE_NOTIFY_COMPLETED)
                    .setDestinationInExternalPublicDir(Environment.DIRECTORY_DOWNLOADS, fileName);
            long id = manager.enqueue(request);
            File file = new File(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS), fileName);
            // Commit the job identity before a scheduled check reports completion.
            if (!prefs.edit().putLong(ID, id).putString(TAG, release.tag).putString(PATH, file.getAbsolutePath())
                    .putString(DIGEST, release.digest).putLong(SIZE, release.size)
                    .putBoolean(READY, false).remove(ERROR).commit()) {
                manager.remove(id);
                throw new IOException("无法保存下载任务，请重试");
            }
        } catch (RuntimeException failure) {
            throw new IOException("无法启动下载，请检查系统下载服务和存储空间", failure);
        }
    }

    static State state(Context context) {
        long id = ReleaseUpdates.preferences(context).getLong(ID, -1);
        if (id < 0) return new State(id, 0, 0, 0);
        DownloadManager manager = context.getSystemService(DownloadManager.class);
        if (manager == null) return new State(id, DownloadManager.STATUS_FAILED, 0, 0);
        try (Cursor cursor = manager.query(new DownloadManager.Query().setFilterById(id))) {
            if (cursor != null && cursor.moveToFirst()) return new State(id,
                    cursor.getInt(cursor.getColumnIndexOrThrow(DownloadManager.COLUMN_STATUS)),
                    cursor.getLong(cursor.getColumnIndexOrThrow(DownloadManager.COLUMN_BYTES_DOWNLOADED_SO_FAR)),
                    cursor.getLong(cursor.getColumnIndexOrThrow(DownloadManager.COLUMN_TOTAL_SIZE_BYTES)));
        } catch (RuntimeException ignored) {}
        return new State(id, DownloadManager.STATUS_FAILED, 0, 0);
    }

    static File readyFile(Context context) {
        SharedPreferences prefs = ReleaseUpdates.preferences(context);
        if (!prefs.getBoolean(READY, false)) return null;
        try {
            File file = destination(prefs);
            return file.isFile() && file.length() == prefs.getLong(SIZE, -1) ? file : null;
        } catch (IOException invalid) { return null; }
    }

    private static File destination(SharedPreferences prefs) throws IOException {
        File file = new File(prefs.getString(PATH, "")).getCanonicalFile();
        File downloads = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS).getCanonicalFile();
        if (!downloads.equals(file.getParentFile())
                || !(file.getName().startsWith("Pengyou-Assistant-") || file.getName().startsWith("XP-ApkHelper-")))
            throw new IOException("下载路径无效");
        return file;
    }

    static void validateCompleted(Context context, long id) throws IOException {
        SharedPreferences prefs = ReleaseUpdates.preferences(context);
        if (prefs.getLong(ID, -1) != id) return;
        prefs.edit().putBoolean(READY, false).commit();
        DownloadManager manager = context.getSystemService(DownloadManager.class);
        Uri uri = manager == null ? null : manager.getUriForDownloadedFile(id);
        if (uri == null) throw new IOException("下载文件不可用，请重新下载");
        File cache = File.createTempFile("release-verify-", ".apk", context.getCacheDir());
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            long size = 0;
            try (InputStream input = context.getContentResolver().openInputStream(uri);
                 FileOutputStream output = new FileOutputStream(cache)) {
                if (input == null) throw new IOException("无法读取已下载的安装包");
                byte[] buffer = new byte[32768];
                int count;
                while ((count = input.read(buffer)) != -1) {
                    if (Thread.currentThread().isInterrupted()) throw new java.io.InterruptedIOException();
                    size += count;
                    if (size > MAX_APK) throw new IOException("安装包超出大小限制");
                    output.write(buffer, 0, count); digest.update(buffer, 0, count);
                }
            }
            if (size != prefs.getLong(SIZE, -1)) throw new IOException("下载文件不完整，请重试");
            String expected = prefs.getString(DIGEST, "");
            if (!expected.isEmpty() && !expected.equalsIgnoreCase("sha256:" + hex(digest.digest())))
                throw new IOException("安装包 SHA-256 校验失败");
            validateArchive(context, cache, prefs.getString(TAG, ""));
            File file = destination(prefs);
            if (!file.isFile() || file.length() != size) throw new IOException("下载目录中的安装包已移走，请重新下载");
            if (prefs.getLong(ID, -1) == id) prefs.edit().putBoolean(READY, true).remove(ERROR).commit();
        } catch (java.security.NoSuchAlgorithmException impossible) {
            throw new IOException(impossible);
        } finally {
            cache.delete();
        }
    }

    static void validateArchive(Context context, File file, String tag) throws IOException {
        PackageManager pm = context.getPackageManager();
        int flags = Build.VERSION.SDK_INT >= 28 ? PackageManager.GET_SIGNING_CERTIFICATES : PackageManager.GET_SIGNATURES;
        PackageInfo candidate = pm.getPackageArchiveInfo(file.getAbsolutePath(), flags);
        try {
            PackageInfo installed = pm.getPackageInfo(context.getPackageName(), flags);
            if (candidate == null || !installed.packageName.equals(candidate.packageName))
                throw new IOException("安装包不是本应用，已停止安装");
            long next = Build.VERSION.SDK_INT >= 28 ? candidate.getLongVersionCode() : candidate.versionCode;
            long current = Build.VERSION.SDK_INT >= 28 ? installed.getLongVersionCode() : installed.versionCode;
            if (next <= current || !ReleaseUpdates.isNewer(candidate.versionName, installed.versionName)
                    || ReleaseUpdates.isNewer(tag, candidate.versionName) || ReleaseUpdates.isNewer(candidate.versionName, tag))
                throw new IOException("安装包版本与发行版不符或不是新版");
            Signature[] oldSigners = signers(installed), newSigners = signers(candidate);
            if (oldSigners == null || newSigners == null || oldSigners.length == 0 || !Arrays.equals(oldSigners, newSigners))
                throw new IOException("安装包签名与当前应用不符，无法覆盖升级");
        } catch (PackageManager.NameNotFoundException missing) {
            throw new IOException("无法读取当前应用信息", missing);
        }
    }

    private static Signature[] signers(PackageInfo info) {
        return Build.VERSION.SDK_INT >= 28 ? info.signingInfo == null ? null : info.signingInfo.getApkContentsSigners()
                : info.signatures;
    }

    private static String hex(byte[] bytes) {
        StringBuilder value = new StringBuilder();
        for (byte b : bytes) value.append(String.format(Locale.ROOT, "%02x", b & 255));
        return value.toString();
    }
}
