package com.Sora.XPHelper;

import android.app.job.JobParameters;
import android.app.job.JobService;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import java.io.IOException;
import java.util.concurrent.FutureTask;
import org.json.JSONException;

public final class ReleaseCheckJob extends JobService {
    private JobParameters running;
    private FutureTask<Void> task;

    @Override public boolean onStartJob(JobParameters parameters) {
        SharedPreferences prefs = ReleaseUpdates.preferences(this);
        if (!prefs.getBoolean(ReleaseUpdates.AUTO, false)) return false;
        running = parameters;
        Handler handler = new Handler(Looper.getMainLooper());
        task = new FutureTask<>(() -> {
            ReleaseUpdates.Release release = null;
            String error = "";
            try {
                release = ReleaseUpdates.latest();
                if (release != null && prefs.getBoolean(ReleaseUpdates.AUTO, false)) {
                    String current = getPackageManager().getPackageInfo(getPackageName(), 0).versionName;
                    if (ReleaseUpdates.isNewer(release.tag, current)) ReleaseDownloads.enqueue(this, release);
                }
            } catch (IOException | JSONException failure) {
                Log.w("PengyouAssistant", "Scheduled release check failed", failure);
                error = failure.getMessage();
            } catch (android.content.pm.PackageManager.NameNotFoundException impossible) {
                Log.w("PengyouAssistant", "Installed package unavailable", impossible);
            }
            ReleaseUpdates.Release result = release;
            String downloadError = error;
            handler.post(() -> {
                if (running != parameters) return;
                running = null;
                task = null;
                if (result != null && prefs.getBoolean(ReleaseUpdates.AUTO, false)) {
                    if (!downloadError.isEmpty()) prefs.edit().putString(ReleaseDownloads.ERROR, downloadError).apply();
                    ReleaseUpdates.saveResult(prefs, result);
                }
                jobFinished(parameters, false);
            });
            return null;
        });
        new Thread(task, "release-check").start();
        return true;
    }

    @Override public boolean onStopJob(JobParameters parameters) {
        if (running == parameters) {
            running = null;
            if (task != null) task.cancel(true);
            task = null;
        }
        return ReleaseUpdates.preferences(this).getBoolean(ReleaseUpdates.AUTO, false);
    }
}
