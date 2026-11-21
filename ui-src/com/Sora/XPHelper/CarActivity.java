package com.Sora.XPHelper;

import android.Manifest;
import android.app.Activity;
import android.app.ActivityManager;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageInfo;
import android.content.pm.ResolveInfo;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Environment;
import android.os.Handler;
import android.os.Looper;
import android.provider.Settings;
import android.text.TextUtils;
import android.text.Layout;
import android.view.ContextThemeWrapper;
import android.view.Gravity;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.widget.ImageView;
import android.widget.HorizontalScrollView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import java.io.File;
import java.io.IOException;
import java.net.Inet4Address;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Enumeration;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import org.json.JSONException;

/**
 * Native, resource-light car UI. The original ADB client, upload server and
 * provider remain in classes.dex; this UI is compiled separately to classes2.dex.
 */
public final class CarActivity extends Activity implements HttpUploadServer.Listener {
    private SharedPreferences prefs;
    private SharedPreferences releasePrefs;
    private final ExecutorService worker = Executors.newSingleThreadExecutor();
    private final ExecutorService systemWorker = Executors.newSingleThreadExecutor();
    private final ExecutorService releaseWorker = Executors.newSingleThreadExecutor();
    private final List<Apk> apks = new ArrayList<>();
    private LinearLayout root, content, fileList;
    private TextView fileCount, fileStatus, transferStatus, debugStatusView, debugLogView;
    private TextView releaseStatus, checkReleaseButton, releasesButton;
    private boolean checkingRelease, foreground, validatingDownload;
    private final Handler releaseHandler = new Handler(Looper.getMainLooper());
    private final Runnable downloadPoll = new Runnable() {
        @Override public void run() {
            if (!foreground || destroyed) return;
            pollReleaseDownload();
            releaseHandler.postDelayed(this, 1200);
        }
    };
    private String checkError = "";
    private HttpUploadServer server;
    private String address = "", uploadStatus = "等待上传";
    private String scanStatus = "正在读取下载目录…";
    private String adbStatus = "尚未检测 ADB 连接";
    private Page page = Page.FILES;
    private ScrollView pageScroll;
    private int connectedPort, scanToken;
    private boolean dark, scanning, adbBusy, otaKnown, otaChecked, otaBlocked, destroyed, uploadPermissionNeeded;
    private boolean storageGrantBusy, debugBusy, awaitingInstaller, exiting;
    private String storageNote = "", installerRoute = "";
    private final StringBuilder debugLog = new StringBuilder();
    private static final int STORAGE_REQUEST = 40, INSTALL_REQUEST = 41;
    private float scale = 1f;
    private int bg, panel, selected, text, muted, line, accent, accentSoft;
    private static final String PROJECT_URL = ReleaseUpdates.REPO;
    private static final float SUBTITLE_SIZE = 18, FEATURE_SIZE = 23;
    private static final String DEBUG_WARNING = "该功能部分操作存在风险，使用者需自行承担所有风险和责任，"
            + "作者不对因使用本功能而导致的任何损失或损害负责。";

    private enum Page {
        FILES("安装包管理", "管理下载目录中的 APK 文件", 0),
        TRANSFER("文件传输", "手机与车机连接同一 Wi-Fi，即可上传安装包", 1),
        DEBUG("调试工具", "车机调试、系统更新与执行日志", 5),
        TOOLS("设置", "显示外观、软件更新与 ADB 连接", 2),
        ABOUT("关于", "版本信息与开源项目", 7);

        final String title, subtitle;
        final int icon;

        Page(String title, String subtitle, int icon) {
            this.title = title;
            this.subtitle = subtitle;
            this.icon = icon;
        }
    }

    private final SharedPreferences.OnSharedPreferenceChangeListener releaseListener = (prefs, key) -> {
        if (destroyed) return;
        if (ReleaseUpdates.CHECKED_AT.equals(key)) checkError = "";
        refreshReleaseViews();
        if (!checkingRelease && foreground) pollReleaseDownload();
    };

    private static final class Apk {
        final File file;
        final String name;
        final long size, modified;
        String version = "";
        Drawable icon;
        Apk(File f) { file = f; name = f.getName(); size = f.length(); modified = f.lastModified(); }
    }

    @Override public void onCreate(Bundle state) {
        prefs = getSharedPreferences("car_ui", MODE_PRIVATE);
        releasePrefs = ReleaseUpdates.preferences(this);
        ReleaseDownloads.forgetInstalled(this);
        dark = isDark();
        setTheme(getResources().getIdentifier(dark ? "CarThemeNight" : "CarTheme", "style", getPackageName()));
        super.onCreate(state);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        if (state != null) {
            String savedPage = state.getString("page_name");
            if (savedPage != null) page = Page.valueOf(savedPage);
            else {
                // Restore tabs saved by older versions after removing the appearance tab.
                Page[] oldPages = {Page.FILES, Page.TRANSFER, Page.TOOLS, Page.TOOLS, Page.DEBUG, Page.ABOUT};
                int savedIndex = state.getInt("page", 0);
                if (savedIndex >= 0 && savedIndex < oldPages.length) page = oldPages[savedIndex];
            }
        }
        releasePrefs.registerOnSharedPreferenceChangeListener(releaseListener);
        if (releasePrefs.getBoolean(ReleaseUpdates.AUTO, false)) ReleaseUpdates.ensureScheduled(this);
        build();
        scan();
    }

    @Override protected void onSaveInstanceState(Bundle out) {
        out.putString("page_name", page.name());
        super.onSaveInstanceState(out);
    }

    private boolean isDark() {
        int mode = prefs.getInt("appearance", 0);
        return mode == 2 || (mode == 0 && (getResources().getConfiguration().uiMode
                & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES);
    }
    private boolean carRom() {
        return Build.MANUFACTURER.toLowerCase(Locale.ROOT).contains("xiaopeng")
                || Build.BRAND.toLowerCase(Locale.ROOT).contains("xpeng");
    }
    private float transferSp(float value) { return value * (carRom() ? 1.5f : Math.max(1f, scale)); }
    private TextView transferLabel(String value, float size, int color) {
        TextView v = label(value, size, color); v.setTextSize(transferSp(size)); return v;
    }
    private TextView transferButton(String value, View.OnClickListener click) {
        TextView v = button(value, false, click); v.setTextSize(transferSp(18)); return v;
    }

    private TextView featureTitle(String value) {
        TextView view = title(value, FEATURE_SIZE);
        view.setTextSize(transferSp(FEATURE_SIZE));
        return view;
    }

    private TextView featureDetail(String value) {
        return transferLabel(value, SUBTITLE_SIZE, muted);
    }

    private TextView featureButton(String value, boolean primary, View.OnClickListener click) {
        TextView view = button(value, primary, click);
        view.setTextSize(transferSp(19));
        view.setSingleLine(false);
        view.setPadding(u(17), u(9), u(17), u(9));
        return view;
    }

    private void palette() {
        dark = isDark();
        bg = Color.parseColor(dark ? "#15161A" : "#F4F5F7");
        panel = Color.parseColor(dark ? "#202226" : "#FFFFFF");
        selected = Color.parseColor(dark ? "#454953" : "#E0E3E8");
        text = Color.parseColor(dark ? "#CBCED5" : "#30343B");
        muted = Color.parseColor(dark ? "#8C9099" : "#7A818C");
        line = Color.parseColor(dark ? "#2D3036" : "#E3E6EB");
        accent = Color.parseColor(dark ? "#0BC69B" : "#009B78");
        accentSoft = Color.parseColor(dark ? "#16382F" : "#E1F3ED");
    }

    private int u(float value) { return Math.round(value * scale * getResources().getDisplayMetrics().density); }
    private float sp(float value) { return value * scale; }
    private LinearLayout vertical() {
        LinearLayout box = new LinearLayout(this); box.setOrientation(LinearLayout.VERTICAL); return box;
    }
    private LinearLayout horizontal() {
        LinearLayout box = new LinearLayout(this);
        box.setOrientation(LinearLayout.HORIZONTAL); box.setGravity(Gravity.CENTER_VERTICAL); return box;
    }
    private LinearLayout.LayoutParams lp(int w, int h) { return new LinearLayout.LayoutParams(w, h); }
    private void gap(LinearLayout box, float h) { box.addView(new View(this), lp(1, u(h))); }
    private void space(LinearLayout box, float w) { box.addView(new View(this), lp(u(w), 1)); }
    private void weight(LinearLayout box) { box.addView(new View(this), new LinearLayout.LayoutParams(0, 1, 1)); }
    private TextView label(String value, float size, int color) {
        TextView v = new TextView(this);
        v.setText(value); v.setTextColor(color); v.setTextSize(sp(size));
        v.setFontFeatureSettings("kern"); v.setIncludeFontPadding(false);
        v.setTypeface(Typeface.create("sans-serif", Typeface.NORMAL));
        return v;
    }
    private TextView title(String value, float size) {
        TextView v = label(value, size, text);
        v.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL)); return v;
    }
    private GradientDrawable shape(int color, float radius, boolean border) {
        GradientDrawable d = new GradientDrawable();
        d.setColor(color); d.setCornerRadius(u(radius));
        if (border) d.setStroke(Math.max(1, u(0.7f)), line);
        return d;
    }
    private Drawable touch(int color, float radius) {
        return new RippleDrawable(ColorStateList.valueOf(dark ? 0x24FFFFFF : 0x16000000),
                shape(color, radius, false), shape(Color.WHITE, radius, false));
    }
    private TextView button(String value, boolean primary, View.OnClickListener action) {
        TextView v = label(value, 18, primary ? (dark ? 0xff202226 : Color.WHITE) : text);
        v.setGravity(Gravity.CENTER); v.setSingleLine(true);
        v.setPadding(u(25), 0, u(25), 0); v.setMinHeight(u(62));
        v.setBackground(touch(primary ? (dark ? 0xffd1d4db : 0xff454953)
                : (dark ? 0xff2b2d33 : 0xffe8eaee), 18));
        v.setOnClickListener(action); v.setFocusable(true); return v;
    }
    private LinearLayout card() {
        LinearLayout v = vertical();
        v.setPadding(u(26), u(24), u(26), u(24));
        v.setBackground(shape(panel, 17, false));
        return v;
    }

    private void build() {
        palette();
        Configuration c = getResources().getConfiguration();
        boolean narrow = c.screenWidthDp < 780;
        scale = Math.max(.82f, Math.min(1.5f, Math.min(c.screenWidthDp / 1280f, c.screenHeightDp / 690f)));
        if (narrow) scale = Math.max(.82f, Math.min(1.08f, c.screenWidthDp / 600f));
        Window window = getWindow();
        window.clearFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS
                | WindowManager.LayoutParams.FLAG_TRANSLUCENT_NAVIGATION);
        window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
        window.setStatusBarColor(bg); window.setNavigationBarColor(bg);
        getWindow().getDecorView().setSystemUiVisibility(dark ? 0 : View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR
                | (Build.VERSION.SDK_INT >= 26 ? View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR : 0));
        root = new LinearLayout(this);
        root.setOrientation(narrow ? LinearLayout.VERTICAL : LinearLayout.HORIZONTAL);
        root.setBackgroundColor(bg);
        if (Build.VERSION.SDK_INT >= 29) root.setForceDarkAllowed(false);
        setContentView(root);
        if (narrow) buildTopNav(); else buildSidebar();
        content = vertical();
        content.setPadding(u(narrow ? 24 : 42), u(narrow ? 24 : 40), u(narrow ? 24 : 44), u(20));
        root.addView(content, narrow ? new LinearLayout.LayoutParams(-1, 0, 1)
                : new LinearLayout.LayoutParams(0, -1, 1));
        fileList = null; transferStatus = null;
        debugStatusView = null; debugLogView = null;
        releaseStatus = null; checkReleaseButton = null; releasesButton = null;
        renderPage();
    }

    private void rebuildPage() {
        int y = pageScroll == null ? 0 : pageScroll.getScrollY();
        build();
        ScrollView scroll = pageScroll;
        scroll.post(() -> scroll.scrollTo(0, y));
    }

    private void buildSidebar() {
        LinearLayout side = vertical();
        side.setPadding(u(26), u(28), u(20), u(16));
        root.addView(side, lp(u(234), -1));
        LinearLayout brand = horizontal();
        brand.addView(logoView(), lp(u(36), u(36))); space(brand, 12);
        brand.addView(title("鹏友助手", 25)); side.addView(brand);
        gap(side, 26);
        for (Page target : Page.values()) {
            LinearLayout item = horizontal();
            item.setPadding(u(20), 0, u(16), 0);
            item.setBackground(touch(page == target ? panel : bg, 15));
            item.addView(new Icon(target.icon, page == target ? text : muted), lp(u(25), u(25)));
            space(item, 16); item.addView(label(target.title, 21, page == target ? text : muted));
            item.setContentDescription(target.title); item.setFocusable(true);
            item.setOnClickListener(v -> navigate(target));
            side.addView(item, lp(-1, u(62))); gap(side, 6);
        }
        side.addView(new View(this), new LinearLayout.LayoutParams(1, 0, 1));
        LinearLayout quit = horizontal(); quit.setPadding(u(16), 0, u(12), 0);
        quit.setBackground(touch(panel, 12));
        quit.addView(new Icon(6, muted), lp(u(22), u(22))); space(quit, 12);
        quit.addView(label("完全退出", 21, text));
        quit.setContentDescription("完全退出程序"); quit.setFocusable(true);
        quit.setOnClickListener(v -> exitApp());
        side.addView(quit, lp(-1, Math.max(u(50), Math.round(48 * getResources().getDisplayMetrics().density))));
        View divider = new View(this); divider.setBackgroundColor(line);
        root.addView(divider, lp(Math.max(1, u(.6f)), -1));
    }

    private void buildTopNav() {
        LinearLayout heading = horizontal(); heading.setPadding(u(22), u(10), u(22), 0);
        heading.addView(logoView(), lp(u(31), u(31))); space(heading, 10);
        heading.addView(title("鹏友助手", 23)); weight(heading);
        heading.addView(button("完全退出", false, v -> exitApp()), lp(-2, u(50)));
        root.addView(heading);
        HorizontalScrollView strip = new HorizontalScrollView(this);
        strip.setHorizontalScrollBarEnabled(false);
        LinearLayout nav = horizontal(); nav.setPadding(u(15), u(12), u(15), u(4));
        for (Page target : Page.values()) {
            TextView t = label(target.title, 17, target == page ? text : muted);
            t.setGravity(Gravity.CENTER); t.setBackground(touch(target == page ? panel : bg, 12));
            t.setOnClickListener(v -> navigate(target));
            t.setPadding(u(18), 0, u(18), 0); t.setMinWidth(u(118));
            t.setContentDescription(target.title);
            nav.addView(t, lp(-2, u(53)));
        }
        strip.addView(nav); root.addView(strip, lp(-1, -2));
    }

    private void navigate(Page target) {
        if (page == target) return;
        if (page == Page.TRANSFER) stopServer();
        page = target;
        if (page == Page.TRANSFER) startServer();
        build();
    }

    private void renderPage() {
        LinearLayout header = horizontal();
        LinearLayout words = vertical();
        words.addView(title(page.title, 31)); gap(words, 12);
        words.addView(featureDetail(page.subtitle));
        header.addView(words, new LinearLayout.LayoutParams(0, -2, 1));
        if (page == Page.FILES) {
            space(header, 16);
            header.addView(featureButton("刷新列表", false, v -> scan()), lp(-2, -2));
        }
        content.addView(header); gap(content, 32);
        ScrollView scroll = new ScrollView(this);
        pageScroll = scroll;
        scroll.setFillViewport(false); scroll.setClipToPadding(false);
        scroll.setVerticalScrollBarEnabled(false);
        content.addView(scroll, new LinearLayout.LayoutParams(-1, 0, 1));
        LinearLayout body = vertical(); scroll.addView(body, new ScrollView.LayoutParams(-1, -2));
        switch (page) {
            case FILES: filesPage(body); break;
            case TRANSFER: transferPage(body); break;
            case DEBUG: debugPage(body); break;
            case TOOLS: toolsPage(body); break;
            case ABOUT: aboutPage(body); break;
        }
    }

    private boolean storageGranted() {
        return Build.VERSION.SDK_INT >= 30 ? Environment.isExternalStorageManager()
                : Build.VERSION.SDK_INT < 23 || checkSelfPermission(Manifest.permission.READ_EXTERNAL_STORAGE)
                == android.content.pm.PackageManager.PERMISSION_GRANTED;
    }

    private void requestStorage() {
        if (storageGranted()) { storageNote = "文件权限已生效"; build(); return; }
        if (storageGrantBusy || destroyed) return;
        if (Build.VERSION.SDK_INT >= 30 && carRom()) { grantStorageViaAdb(); return; }
        try {
            if (Build.VERSION.SDK_INT >= 30) {
                Intent own = new Intent(Settings.ACTION_MANAGE_APP_ALL_FILES_ACCESS_PERMISSION,
                        Uri.parse("package:" + getPackageName()));
                Intent all = new Intent(Settings.ACTION_MANAGE_ALL_FILES_ACCESS_PERMISSION);
                Intent target = realSettings(own) ? own : realSettings(all) ? all : null;
                if (target == null) { grantStorageViaAdb(); return; }
                startActivityForResult(target, STORAGE_REQUEST);
            } else requestPermissions(new String[]{Manifest.permission.READ_EXTERNAL_STORAGE,
                    Manifest.permission.WRITE_EXTERNAL_STORAGE}, 20);
        } catch (Exception e) {
            if (Build.VERSION.SDK_INT >= 30) grantStorageViaAdb();
            else message("系统没有提供文件权限入口");
        }
    }

    private boolean realSettings(Intent intent) {
        ResolveInfo resolved = getPackageManager().resolveActivity(intent, 0);
        if (resolved == null || resolved.activityInfo == null) return false;
        String name = resolved.activityInfo.name;
        return !name.contains("NotFoundActivity") && !name.contains("SkipIntentActivity");
    }

    private void grantStorageViaAdb() {
        if (storageGrantBusy || destroyed) return;
        storageGrantBusy = true; storageNote = "正在通过已授权的 ADB 申请文件权限…"; build();
        worker.execute(() -> {
            String result = shell("appops set --uid " + quote(getPackageName())
                    + " MANAGE_EXTERNAL_STORAGE allow; appops get --uid " + quote(getPackageName())
                    + " MANAGE_EXTERNAL_STORAGE");
            runOnUiThread(() -> {
                if (destroyed) return;
                storageGrantBusy = false;
                boolean granted = storageGranted();
                storageNote = granted ? "文件权限已生效" : "未能获得文件权限，请先确认 ADB 连接和授权";
                if (page == Page.TRANSFER) { stopServer(); startServer(); }
                build(); scan();
                if (!granted) dialog("文件授权未完成", result == null
                        ? "车机没有标准权限页面，ADB 当前也未连接。可先从侧栏「调试工具」检查调试开关，再重试授权。"
                        : "命令已返回，但系统仍未授予完整文件权限。\n请检测 ADB 连接后重试。\n\n"
                                + result.substring(0, Math.min(700, result.length())), null);
            });
        });
    }

    private void filesPage(LinearLayout body) {
        LinearLayout directory = horizontal();
        directory.addView(featureTitle("下载目录")); space(directory, 14);
        TextView path = featureDetail("/sdcard/Download");
        path.setSingleLine(true); path.setEllipsize(TextUtils.TruncateAt.MIDDLE);
        directory.addView(path, new LinearLayout.LayoutParams(0, -2, 1));
        fileCount = featureDetail(apks.size() + " 个安装包"); directory.addView(fileCount);
        body.addView(directory); gap(body, 20);
        {
            boolean granted = storageGranted();
            LinearLayout permission = card();
            LinearLayout row = horizontal();
            LinearLayout copy = vertical();
            copy.addView(featureTitle(granted ? "下载目录已授权" : "允许访问下载目录")); gap(copy, 9);
            String detail = granted ? "可直接读取和管理安装包。" : storageNote.isEmpty()
                    ? "授权后可直接管理文件；未授权时仍可尝试 ADB 代读。" : storageNote;
            copy.addView(transferLabel(detail, SUBTITLE_SIZE, granted ? accent : muted));
            row.addView(copy, new LinearLayout.LayoutParams(0, -2, 1)); space(row, 20);
            TextView grant = featureButton(granted ? "已授权" : storageGrantBusy ? "授权中…" : "授权访问", false,
                    v -> requestStorage());
            grant.setContentDescription(granted ? "下载目录权限已授权" : "授权下载目录");
            grant.setEnabled(!granted && !storageGrantBusy);
            if (granted) { grant.setTextColor(accent); grant.setBackground(shape(accentSoft, 12, false)); }
            row.addView(grant, lp(-2, -2));
            permission.addView(row); body.addView(permission); gap(body, 16);
        }
        fileStatus = featureDetail(scanStatus);
        body.addView(fileStatus); gap(body, 16);
        fileList = vertical(); body.addView(fileList);
        fillFiles();
    }

    private void fillFiles() {
        if (fileList == null || page != Page.FILES) return;
        fileList.removeAllViews(); fileCount.setText(apks.size() + " 个安装包"); fileStatus.setText(scanStatus);
        if (apks.isEmpty()) {
            LinearLayout empty = card(); empty.setGravity(Gravity.CENTER);
            empty.setPadding(u(24), u(44), u(24), u(42));
            Icon icon = new Icon(0, muted); empty.addView(icon, lp(u(62), u(62))); gap(empty, 25);
            empty.addView(featureTitle(scanning ? "正在查找安装包" : "暂无安装包")); gap(empty, 14);
            TextView hint = featureDetail("将 APK 放入下载目录，或通过文件传输上传");
            hint.setGravity(Gravity.CENTER); empty.addView(hint); gap(empty, 28);
            empty.addView(featureButton("去传文件", true, v -> navigate(Page.TRANSFER)), lp(-2, -2));
            fileList.addView(empty, lp(-1, -2)); return;
        }
        for (Apk apk : apks) {
            LinearLayout row = horizontal(); row.setPadding(u(24), u(22), u(24), u(22));
            row.setBackground(shape(panel, 17, false));
            if (apk.icon == null) {
                LinearLayout tile = horizontal(); tile.setGravity(Gravity.CENTER);
                tile.setBackground(shape(accentSoft, 14, false));
                tile.addView(new Icon(0, accent), lp(u(33), u(33)));
                row.addView(tile, lp(u(64), u(64)));
            } else {
                ImageView image = new ImageView(this); image.setImageDrawable(apk.icon);
                image.setScaleType(ImageView.ScaleType.FIT_CENTER);
                row.addView(image, lp(u(64), u(64)));
            }
            space(row, 22); LinearLayout info = vertical();
            TextView name = featureTitle(apk.name); name.setSingleLine(true);
            name.setEllipsize(TextUtils.TruncateAt.MIDDLE); info.addView(name); gap(info, 13);
            String detail = apk.size > 0 ? formatSize(apk.size) : "APK 安装包";
            if (!apk.version.isEmpty()) detail += "   ·   版本 " + apk.version;
            info.addView(featureDetail(detail));
            row.addView(info, new LinearLayout.LayoutParams(0, -2, 1)); space(row, 24);
            TextView install = featureButton("安装", true, v -> install(apk));
            install.setContentDescription("安装 " + apk.name);
            row.addView(install, lp(-2, -2)); space(row, 12);
            TextView delete = featureButton("删除", false, v -> confirmDelete(apk));
            delete.setTextColor(muted); delete.setContentDescription("删除 " + apk.name);
            row.addView(delete, lp(-2, -2));
            fileList.addView(row, lp(-1, -2)); gap(fileList, 14);
        }
    }

    private static String formatSize(long n) {
        return n >= 1048576 ? String.format(Locale.ROOT, "%.1f MB", n / 1048576.0)
                : String.format(Locale.ROOT, "%.0f KB", n / 1024.0);
    }

    private void scan() {
        if (scanning || destroyed) return;
        scanning = true; scanStatus = "正在读取下载目录…"; fillFiles();
        final int token = ++scanToken;
        worker.execute(() -> {
            LinkedHashMap<String, Apk> found = new LinkedHashMap<>();
            for (String path : new String[]{"/sdcard/Download", "/storage/emulated/0/Download", "/sdcard"}) {
                File[] files = new File(path).listFiles();
                if (files == null) continue;
                for (File f : files) {
                    if (!f.isFile() || !f.getName().toLowerCase(Locale.ROOT).endsWith(".apk")) continue;
                    try { found.put(f.getCanonicalPath(), new Apk(f)); } catch (Exception ignored) {}
                }
            }
            boolean viaAdb = false;
            // Scoped storage may expose only this app's uploads. Always supplement
            // that partial list via the repaired ADB client when all-files access is absent.
            if (!storageGranted()) {
                String result = shell("ls -1 /sdcard/Download; echo __APKHELPER_LIST_OK__");
                if (result != null && result.contains("__APKHELPER_LIST_OK__")) {
                    viaAdb = true;
                    for (String name : result.split("\\r?\\n")) {
                        name = name.trim();
                        if (name.toLowerCase(Locale.ROOT).endsWith(".apk") && !name.contains("/")) {
                            File f = new File("/sdcard/Download", name);
                            String key;
                            try { key = f.getCanonicalPath(); }
                            catch (Exception ignored) { key = f.getAbsolutePath(); }
                            if (!found.containsKey(key)) found.put(key, new Apk(f));
                        }
                    }
                }
            }
            List<Apk> result = new ArrayList<>(found.values());
            Collections.sort(result, (a, b) -> a.modified == b.modified
                    ? a.name.compareToIgnoreCase(b.name) : Long.compare(b.modified, a.modified));
            for (Apk a : result) {
                try {
                    PackageInfo p = getPackageManager().getPackageArchiveInfo(a.file.getAbsolutePath(), 0);
                    if (p != null) {
                        a.version = p.versionName == null ? "" : p.versionName;
                        if (p.applicationInfo != null) {
                            p.applicationInfo.sourceDir = a.file.getAbsolutePath();
                            p.applicationInfo.publicSourceDir = a.file.getAbsolutePath();
                            a.icon = p.applicationInfo.loadIcon(getPackageManager());
                        }
                    }
                } catch (Exception ignored) {}
            }
            final boolean adb = viaAdb;
            runOnUiThread(() -> {
                if (destroyed || token != scanToken) return;
                scanning = false; apks.clear(); apks.addAll(result);
                scanStatus = adb ? "已通过 ADB 读取下载目录" : storageGranted()
                        ? "已读取下载目录，安装时将调用系统安装器"
                        : "可先开启文件权限；ADB 未就绪时不会自动反复重试";
                fillFiles();
            });
        });
    }

    private String shell(String command) {
        if (connectedPort != 0) {
            String out = AdbShell.exec(command, connectedPort);
            if (out != null && !out.startsWith("ERR")) return out;
        }
        for (int port : new int[]{5050, 5555}) {
            if (port == connectedPort) continue;
            String out = AdbShell.exec(command, port);
            if (out != null && !out.startsWith("ERR")) { connectedPort = port; return out; }
        }
        connectedPort = 0;
        return null;
    }

    private static String quote(String s) { return "'" + s.replace("'", "'\\''") + "'"; }

    private void install(Apk apk) {
        if (adbBusy) { message("正在处理上一项操作，请稍候"); return; }
        Uri contentUri = new Uri.Builder().scheme("content").authority(getPackageName() + ".files")
                .path(apk.file.getAbsolutePath()).build();
        // Use an Activity result and no NEW_TASK when this app is an allowed installer.
        // The privileged shell route below also explicitly targets our existing task.
        boolean directAllowed = Build.VERSION.SDK_INT < 26 || getPackageManager().canRequestPackageInstalls();
        if (directAllowed && apk.file.canRead()) {
            Intent intent = new Intent(Intent.ACTION_VIEW).setPackage("com.android.packageinstaller")
                    .setDataAndType(contentUri, "application/vnd.android.package-archive")
                    .addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
                    .putExtra(Intent.EXTRA_RETURN_RESULT, true);
            intent.setClipData(ClipData.newRawUri("安装包", contentUri));
            try {
                awaitingInstaller = true; installerRoute = "应用内任务";
                startActivityForResult(intent, INSTALL_REQUEST);
                scanStatus = "已在当前任务打开系统安装器"; fillFiles(); return;
            } catch (Exception denied) { awaitingInstaller = false; }
        }
        final int installerTask = getTaskId();
        adbBusy = true; scanStatus = "正在打开系统安装器…"; fillFiles();
        awaitingInstaller = true;
        worker.execute(() -> {
            // XPeng's installer accepts the shell file URI. Stock Android 12
            // applies scoped storage to that installer, so grant a provider URI.
            boolean carRom = carRom();
            String uri = carRom ? Uri.fromFile(apk.file).toString() : contentUri.toString();
            String tail = (carRom ? " -n com.android.packageinstaller/.PackageInstallerActivity"
                            : " -p com.android.packageinstaller")
                    + " -a android.intent.action.VIEW -d " + quote(uri)
                    + " -t application/vnd.android.package-archive"
                    + (carRom ? "" : " --grant-read-uri-permission") + " --user 0";
            String result = shell("am start --task " + installerTask + tail);
            boolean sameTask = true;
            if (result != null && (result.contains("Unknown option: --task")
                    || result.contains("Unknown option --task"))) {
                sameTask = false;
                result = shell("am start" + tail);
            }
            boolean ok = result != null && !result.contains("Error") && !result.contains("Exception")
                    && (result.contains("Starting:") || result.contains("brought to the front"));
            final String response = result;
            final boolean keptTask = sameTask;
            runOnUiThread(() -> {
                adbBusy = false;
                if (destroyed) return;
                if (!ok) awaitingInstaller = false;
                installerRoute = keptTask ? "ADB 同任务" : "兼容入口";
                scanStatus = ok ? keptTask ? "已在当前任务打开系统安装器，完成后可返回鹏友助手"
                        : "系统使用兼容安装入口，完成后请返回鹏友助手" : "调用失败，请检查 ADB 授权与安装器状态";
                fillFiles();
                if (!ok) dialog("未能打开系统安装器", response == null
                        ? "请确认车机 ADB 已开启并允许此应用连接，再点击安装。" : response, null);
            });
        });
    }

    private AlertDialog.Builder dialogBuilder() {
        return new AlertDialog.Builder(new ContextThemeWrapper(this,
                dark ? android.R.style.Theme_Material_Dialog_Alert : android.R.style.Theme_Material_Light_Dialog_Alert));
    }
    private void dialog(String title, String description, Runnable yes) {
        showCarDialog(title, description, yes == null ? "知道了" : "确认", yes,
                yes == null ? null : "取消");
    }

    private void confirmDebug(String actionName, String details, Runnable action) {
        showCarDialog(actionName, details.isEmpty() ? DEBUG_WARNING : details + "\n" + DEBUG_WARNING,
                "我已了解并进入", action, "不同意");
    }

    private void showCarDialog(String actionName, String description, String positive, Runnable action, String negative) {
        Dialog dialog = new Dialog(this);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
        dialog.setCanceledOnTouchOutside(false);
        LinearLayout box = vertical();
        box.setBackground(shape(panel, 24, false));
        box.setPadding(u(36), u(32), u(36), u(32));
        TextView heading = featureTitle(actionName);
        heading.setGravity(Gravity.CENTER);
        box.addView(heading, lp(-1, -2));
        gap(box, 24);

        TextView warning = featureDetail(description);
        warning.setLineSpacing(u(8), 1);
        box.addView(warning, lp(-1, -2));
        gap(box, 28);
        LinearLayout actions = horizontal();
        TextView enter = featureButton(positive, true, view -> {
            dialog.dismiss();
            if (action != null) action.run();
        });
        enter.setMinHeight(u(66));
        actions.addView(enter, new LinearLayout.LayoutParams(0, -2, 1));
        if (negative != null) {
            TextView cancel = featureButton(negative, false, view -> dialog.dismiss());
            cancel.setMinHeight(u(66));
            space(actions, 22);
            actions.addView(cancel, new LinearLayout.LayoutParams(0, -2, 1));
        }
        box.addView(actions, lp(-1, -2));

        ScrollView frame = new ScrollView(this);
        frame.setVerticalScrollBarEnabled(false);
        frame.addView(box);
        dialog.setContentView(frame);
        Window window = dialog.getWindow();
        window.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
        window.addFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);
        window.setDimAmount(.58f);
        dialog.show();
        int width = Math.min(u(690), root.getWidth() - u(32));
        window.setLayout(width, WindowManager.LayoutParams.WRAP_CONTENT);
    }

    private void confirmDelete(Apk apk) {
        dialog("删除安装包", "确定删除「" + apk.name + "」？\n此操作不会卸载已经安装的应用。", () -> {
            if (adbBusy) { message("请等待当前操作完成"); return; }
            adbBusy = true;
            worker.execute(() -> {
                boolean deleted = apk.file.delete();
                if (!deleted) {
                    String out = shell("rm -f -- " + quote(apk.file.getAbsolutePath()) + "; test ! -e "
                            + quote(apk.file.getAbsolutePath()) + " && echo __APKHELPER_DELETED__");
                    deleted = out != null && out.contains("__APKHELPER_DELETED__");
                }
                final boolean ok = deleted;
                runOnUiThread(() -> {
                    adbBusy = false; if (destroyed) return;
                    message(ok ? "安装包已删除" : "删除失败，请检查文件权限或 ADB 连接");
                    scan();
                });
            });
        });
    }

    private String localIp() {
        String fallback = "";
        try {
            Enumeration<NetworkInterface> interfaces = NetworkInterface.getNetworkInterfaces();
            while (interfaces.hasMoreElements()) {
                NetworkInterface n = interfaces.nextElement();
                String name = n.getName().toLowerCase(Locale.ROOT);
                if (!n.isUp() || n.isLoopback() || name.startsWith("rmnet") || name.startsWith("tun")
                        || name.startsWith("dummy") || name.startsWith("vgate")) continue;
                Enumeration<InetAddress> addresses = n.getInetAddresses();
                while (addresses.hasMoreElements()) {
                    InetAddress a = addresses.nextElement();
                    if (!(a instanceof Inet4Address) || a.isLoopbackAddress() || a.isLinkLocalAddress()) continue;
                    if (name.startsWith("wlan") || name.startsWith("wifi")) return a.getHostAddress();
                    if (a.isSiteLocalAddress()) fallback = a.getHostAddress();
                }
            }
        } catch (Exception ignored) {}
        return fallback;
    }
    private void startServer() {
        if (server != null) return;
        uploadPermissionNeeded = false;
        File downloads = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS);
        if (!downloads.isDirectory() && !downloads.mkdirs()) { uploadStatus = "下载目录无法写入，请检查文件权限"; return; }
        // Some car ROMs expose no all-files settings page but allow Download writes.
        // Test the actual APK write path instead of hiding a working upload feature.
        if (!storageGranted()) {
            File probe = null;
            try { probe = File.createTempFile(".apkhelper-write-", ".apk", downloads); }
            catch (Exception denied) {
                uploadPermissionNeeded = true; uploadStatus = "请先允许访问下载目录"; return;
            } finally { if (probe != null) probe.delete(); }
        }
        for (int p = 8080; p < 8085; p++) {
            HttpUploadServer candidate = null;
            try {
                candidate = new HttpUploadServer(downloads, p, this); candidate.start(); server = candidate;
                String ip = localIp();
                address = ip.isEmpty() ? "" : "http://" + ip + ":" + server.getPort() + "/";
                uploadStatus = ip.isEmpty() ? "未检测到局域网，请连接 Wi-Fi 后重试" : "等待上传";
                return;
            } catch (Exception ignored) { if (candidate != null) candidate.stop(); }
        }
        uploadStatus = "传输服务启动失败，端口可能被占用";
    }
    private void stopServer() {
        if (server != null) { server.stop(); server = null; } address = "";
    }
    private Bitmap qr(String value) {
        try {
            BitMatrix m = new QRCodeWriter().encode(value, BarcodeFormat.QR_CODE, 520, 520);
            int w = m.getWidth(), h = m.getHeight(); int[] pixels = new int[w * h];
            for (int y = 0; y < h; y++) for (int x = 0; x < w; x++)
                pixels[y * w + x] = m.get(x, y) ? 0xff111318 : Color.WHITE;
            Bitmap b = Bitmap.createBitmap(w, h, Bitmap.Config.ARGB_8888);
            b.setPixels(pixels, 0, w, 0, 0, w, h); return b;
        } catch (Exception ignored) { return null; }
    }
    private void transferPage(LinearLayout body) {
        Configuration configuration = getResources().getConfiguration();
        boolean narrow = configuration.screenWidthDp < 780;
        float textFactor = carRom() ? 1.5f : Math.max(1f, scale);
        float width = configuration.screenWidthDp - (narrow ? 48 : 320) * scale;
        // Keep car text at the car's native baseline rather than shrinking it
        // along with the panel. At larger system fonts, stack the columns.
        boolean columns = width >= (342 + 26) * scale
                + 360 * textFactor * Math.max(1f, configuration.fontScale);
        float qrEdge = Math.min(276, Math.max(216,
                (configuration.screenHeightDp / scale - 260) * .65f));
        LinearLayout layout = new LinearLayout(this);
        layout.setOrientation(columns ? LinearLayout.HORIZONTAL : LinearLayout.VERTICAL);
        layout.setGravity(Gravity.TOP); body.addView(layout, lp(-1, -2));
        LinearLayout qrCard = card(); qrCard.setGravity(Gravity.CENTER);
        if (columns) layout.addView(qrCard, lp(u(342), -2)); else layout.addView(qrCard, lp(-1, -2));
        TextView scanLabel = transferLabel("手机扫码上传", 24, text);
        qrCard.addView(scanLabel); gap(qrCard, 22);
        Bitmap bitmap = address.isEmpty() ? null : qr(address);
        if (bitmap != null) {
            ImageView image = new ImageView(this); image.setImageBitmap(bitmap);
            image.setBackground(shape(Color.WHITE, 12, false)); image.setPadding(u(8), u(8), u(8), u(8));
            image.setContentDescription("文件上传地址二维码");
            qrCard.addView(image, lp(u(qrEdge), u(qrEdge)));
        } else {
            LinearLayout placeholder = vertical(); placeholder.setGravity(Gravity.CENTER);
            placeholder.setBackground(shape(bg, 12, false));
            placeholder.addView(new Icon(1, muted), lp(u(58), u(58))); gap(placeholder, 20);
            TextView t = transferLabel("连接 Wi-Fi 后生成二维码", 17, muted); t.setGravity(Gravity.CENTER);
            placeholder.addView(t); qrCard.addView(placeholder, lp(u(qrEdge), u(qrEdge)));
        }
        gap(qrCard, 20);
        TextView caption = transferLabel("上传后自动保存到下载目录", 17, muted);
        caption.setGravity(Gravity.CENTER); qrCard.addView(caption);
        LinearLayout info = vertical();
        if (columns) { space(layout, 26); layout.addView(info, new LinearLayout.LayoutParams(0, -2, 1)); }
        else { gap(layout, 22); layout.addView(info, lp(-1, -2)); }
        LinearLayout connection = card();
        LinearLayout statusRow = horizontal();
        View dot = new View(this); dot.setBackground(shape(address.isEmpty() ? muted : accent, 5, false));
        statusRow.addView(dot, lp(u(9), u(9))); space(statusRow, 10);
        statusRow.addView(transferLabel(address.isEmpty() ? "等待连接" : "传输服务已启动", 20, address.isEmpty() ? muted : accent));
        connection.addView(statusRow); gap(connection, 22);
        TextView url = transferLabel(address.isEmpty() ? "连接与车机相同的 Wi-Fi" : address, 24, text);
        url.setTextIsSelectable(true); url.setBreakStrategy(Layout.BREAK_STRATEGY_HIGH_QUALITY);
        connection.addView(url); gap(connection, 12);
        connection.addView(transferLabel("也可在手机或电脑浏览器中输入此地址", 17, muted)); gap(connection, 23);
        LinearLayout buttons = horizontal();
        if (!address.isEmpty()) {
            buttons.addView(transferButton("复制地址", v -> {
                ((ClipboardManager) getSystemService(CLIPBOARD_SERVICE)).setPrimaryClip(ClipData.newPlainText("上传地址", address));
                message("地址已复制");
            }), lp(-2, u(50))); space(buttons, 12);
        }
        buttons.addView(transferButton(uploadPermissionNeeded ? "允许文件访问" : "重新连接", v -> {
            if (uploadPermissionNeeded) requestStorage();
            else { stopServer(); startServer(); build(); }
        }), lp(-2, u(50))); connection.addView(buttons); info.addView(connection);
        gap(info, 25);
        info.addView(transferLabel("使用方法", 24, text)); gap(info, 20);
        step(info, "1", "手机与车机连接同一 Wi-Fi 或热点");
        step(info, "2", "扫码打开网页，选择 APK 上传");
        step(info, "3", "返回「安装包管理」，点击安装");
        gap(info, 12);
        transferStatus = transferLabel(uploadStatus, 19, accent);
        transferStatus.setMaxLines(3); info.addView(transferStatus);
        gap(body, 24);
        body.addView(transferLabel("仅在此页面开启局域网传输服务，离开页面后自动关闭。", 17, muted));
    }
    private void step(LinearLayout parent, String number, String copy) {
        LinearLayout row = horizontal(); row.setGravity(Gravity.TOP);
        TextView n = transferLabel(number, 16, muted); n.setGravity(Gravity.CENTER);
        int size = Math.max(u(32), Math.round(getResources().getDisplayMetrics().scaledDensity * transferSp(16) * 1.6f));
        n.setBackground(shape(panel, 20, false)); row.addView(n, lp(size, size)); space(row, 13);
        TextView description = transferLabel(copy, 22, text); description.setLineSpacing(u(5), 1.08f);
        row.addView(description, new LinearLayout.LayoutParams(0, -2, 1));
        parent.addView(row); gap(parent, 18);
    }

    @Override public void onLog(String value) {
        // HTTP logs may contain request details. Keep only useful service state on screen.
    }
    @Override public void onUploaded(String name) {
        runOnUiThread(() -> {
            if (destroyed) return;
            uploadStatus = "已收到 " + new File(name).getName();
            if (transferStatus != null) transferStatus.setText(uploadStatus);
            scan();
        });
    }

    private void debugPage(LinearLayout body) {
        boolean supported = XpengBridge.available(this);
        LinearLayout state = card();
        LinearLayout heading = horizontal();
        heading.addView(featureTitle("车机调试状态"), new LinearLayout.LayoutParams(0, -2, 1));
        space(heading, 12);
        TextView refresh = featureButton(adbBusy ? "刷新中…" : "刷新状态", false, v -> checkAdb());
        refresh.setEnabled(!adbBusy);
        heading.addView(refresh, lp(-2, -2));
        state.addView(heading); gap(state, 21);
        debugStatusView = transferLabel(XpengBridge.status(this) + "\nOTA 状态       " + otaStatus(), 18, text);
        debugStatusView.setLineSpacing(u(11), 1); state.addView(debugStatusView);
        if (!supported) {
            gap(state, 18);
            state.addView(featureDetail("此设备未安装小鹏 devtools，系统入口暂不可用。"));
        }
        body.addView(state); gap(body, 22);
        String[] names = {"调试模式", "检查模式", "大屏诊断"};
        String[] notes = {"打开车机系统调试与ADB设置", "打开系统检查模式页面", "打开车机售后诊断页面"};
        for (int i = 0; i < names.length; i++) {
            final int target = i;
            LinearLayout row = horizontal(); row.setPadding(u(25), u(20), u(25), u(20));
            row.setBackground(shape(panel, 15, false));
            LinearLayout copy = vertical(); copy.addView(featureTitle(names[i])); gap(copy, 11);
            copy.addView(featureDetail(notes[i]));
            row.addView(copy, new LinearLayout.LayoutParams(0, -2, 1)); space(row, 20);
            Icon open = new Icon(8, muted);
            open.setContentDescription("打开 " + names[i]);
            row.addView(open, lp(u(30), u(30)));
            row.setContentDescription("打开 " + names[i]);
            row.setFocusable(true);
            row.setEnabled(supported && !debugBusy);
            if (!row.isEnabled()) row.setAlpha(.45f);
            row.setOnClickListener(v -> confirmDebug(names[target], target == 0
                            ? "请勿关闭调试总开关，否则可能中断当前 ADB 连接。" : "",
                            () -> launchDebug(target)));
            body.addView(row); gap(body, 13);
        }
        systemUpdateSection(body);
        gap(body, 24);
        LinearLayout logs = card(); LinearLayout logHeading = horizontal();
        logHeading.addView(featureTitle("执行日志"), new LinearLayout.LayoutParams(0, -2, 1));
        space(logHeading, 12);
        logHeading.addView(featureButton("清空日志", false, v -> {
            debugLog.setLength(0);
            if (debugLogView != null) debugLogView.setText("暂无执行记录");
        }), lp(-2, -2));
        logs.addView(logHeading); gap(logs, 18);
        ScrollView history = new ScrollView(this); history.setNestedScrollingEnabled(true);
        debugLogView = featureDetail(debugLog.length() == 0 ? "暂无执行记录" : debugLog.toString());
        debugLogView.setLineSpacing(u(5), 1); debugLogView.setTextIsSelectable(true);
        history.addView(debugLogView); logs.addView(history, lp(-1, u(190))); body.addView(logs);
    }

    private void appendDebug(String value) {
        String now = new SimpleDateFormat("HH:mm:ss", Locale.ROOT).format(new Date());
        debugLog.append(now).append("  ").append(value).append('\n');
        if (debugLog.length() > 8000) debugLog.delete(0, debugLog.length() - 8000);
        if (debugLogView != null) debugLogView.setText(debugLog.toString());
    }

    private void launchDebug(int target) {
        if (debugBusy || destroyed) return;
        String[] names = {"调试模式", "检查模式", "大屏诊断"};
        debugBusy = true; appendDebug("正在打开" + names[target]); rebuildPage();
        // XUI must stay usable even if the ADB worker is waiting for authorization.
        systemWorker.execute(() -> {
            XpengBridge.Result result = XpengBridge.launch(getApplicationContext(), target);
            if (!result.ok && carRom()) {
                Intent intent = XpengBridge.intent(target);
                String command = target == 2
                        ? "am start -a com.xiaopeng.devtools.aftersales -p com.xiaopeng.devtools --ei screenId 0"
                        : "am start -n " + quote(intent.getComponent().flattenToString()) + " --ei screenId 0";
                String response = shell(command);
                if (response != null && response.contains("Starting:")
                        && !response.contains("Error") && !response.contains("Exception")) {
                    result = new XpengBridge.Result(true, "ADB", result.trace + "\nADB 已请求打开系统页面");
                } else if (response != null) {
                    result = new XpengBridge.Result(false, "不可用", result.trace + "\nADB：" + response);
                }
            }
            final XpengBridge.Result completed = result;
            runOnUiThread(() -> {
                if (destroyed) return;
                debugBusy = false;
                appendDebug(names[target] + " · " + completed.route + "\n" + completed.trace);
                if (page == Page.DEBUG) rebuildPage();
                if (!completed.ok) message("系统入口未能打开，请查看执行日志");
            });
        });
    }

    private void toolsPage(LinearLayout body) {
        appearanceSection(body);
        gap(body, 24);
        releaseSection(body);
        gap(body, 24);
        LinearLayout adb = card();
        LinearLayout row = horizontal(); LinearLayout words = vertical();
        words.addView(featureTitle("ADB 连接")); gap(words, 11);
        words.addView(featureDetail(adbStatus));
        row.addView(words, new LinearLayout.LayoutParams(0, -2, 1)); space(row, 20);
        TextView detect = featureButton(adbBusy ? "检测中…" : "检测连接", false, v -> checkAdb());
        detect.setEnabled(!adbBusy);
        row.addView(detect, lp(-2, -2));
        adb.addView(row); gap(adb, 22);
        adb.addView(featureDetail("首次连接时，请在车机授权窗口中允许此应用。"));
        body.addView(adb);
    }

    private Switch settingSwitch(String description, boolean checked) {
        Switch toggle = new CarSwitch();
        toggle.setShowText(false);
        toggle.setChecked(checked);
        toggle.setContentDescription(description);
        return toggle;
    }

    private void systemUpdateSection(LinearLayout body) {
        LinearLayout ota = card(); LinearLayout otaRow = horizontal();
        LinearLayout description = vertical(); description.addView(featureTitle("屏蔽系统更新")); gap(description, 13);
        TextView detail = featureDetail(otaKnown ? (otaBlocked ? "已屏蔽，可关闭开关恢复系统更新" : "当前允许车机检查和下载 OTA 更新")
                : (otaChecked ? "此设备未检测到小鹏 OTA 服务" : "点击顶部「刷新状态」读取 OTA 状态"));
        detail.setLineSpacing(u(4), 1); description.addView(detail);
        otaRow.addView(description, new LinearLayout.LayoutParams(0, -2, 1)); space(otaRow, 20);
        Switch otaSwitch = settingSwitch("屏蔽系统更新", otaBlocked);
        otaSwitch.setEnabled(otaKnown && !adbBusy);
        otaSwitch.setOnCheckedChangeListener((view, checked) -> {
            if (checked == otaBlocked) return;
            view.setChecked(otaBlocked);
            confirmDebug(checked ? "屏蔽系统更新?" : "恢复系统更新?",
                    checked ? "车机将不再检查、下载或提示OTA更新。可随时在此恢复。"
                            : "恢复后，车机可正常检查和下载 OTA 更新。", () -> setOta(checked));
        });
        otaRow.addView(otaSwitch); ota.addView(otaRow); body.addView(ota);
    }

    private void checkAdb() {
        if (adbBusy) return; adbBusy = true; adbStatus = "正在检测连接…"; rebuildPage();
        worker.execute(() -> {
            String result = shell("pm list packages --user 0 com.xiaopeng.ota; echo __OTA_DISABLED__; "
                    + "pm list packages --user 0 -d com.xiaopeng.ota; echo __APKHELPER_ADB_OK__");
            boolean ok = result != null && result.contains("__APKHELPER_ADB_OK__");
            String[] parts = result == null ? new String[0] : result.split("__OTA_DISABLED__", -1);
            boolean hasOta = ok && parts.length == 2 && parts[0].matches("(?s).*\\bpackage:com\\.xiaopeng\\.ota[\\r\\n].*");
            boolean blocked = hasOta && parts[1].matches("(?s).*\\bpackage:com\\.xiaopeng\\.ota[\\r\\n].*");
            runOnUiThread(() -> {
                if (destroyed) return;
                adbBusy = false; otaKnown = hasOta; otaChecked = ok; otaBlocked = blocked;
                adbStatus = ok ? "已连接 · 本机端口 " + connectedPort + (hasOta ? "" : " · 此设备无小鹏 OTA 服务")
                        : "连接未就绪，请检查 ADB 开关和授权";
                appendDebug(ok ? "已刷新调试状态 · OTA " + otaStatus() : "状态刷新失败，请检查 ADB 授权");
                if (page == Page.DEBUG || page == Page.TOOLS) rebuildPage();
            });
        });
    }

    private String otaStatus() {
        if (adbBusy) return "正在读取…";
        if (!otaChecked) return "待刷新";
        return otaKnown ? otaBlocked ? "已屏蔽" : "正常" : "未找到 OTA 服务";
    }
    private void setOta(boolean blocked) {
        if (adbBusy) return; adbBusy = true; rebuildPage();
        worker.execute(() -> {
            String out = shell(blocked ? "pm disable-user --user 0 com.xiaopeng.ota" : "pm enable com.xiaopeng.ota");
            boolean ok = out != null && out.contains(blocked ? "disabled-user" : "enabled")
                    && !out.toLowerCase(Locale.ROOT).contains("exception");
            runOnUiThread(() -> {
                if (destroyed) return; adbBusy = false;
                if (ok) otaBlocked = blocked;
                message(ok ? (blocked ? "已屏蔽系统更新" : "已恢复系统更新") : "操作失败，请重新检测连接");
                if (page == Page.DEBUG) rebuildPage();
            });
        });
    }

    private void appearanceSection(LinearLayout body) {
        LinearLayout modes = card();
        modes.addView(featureTitle("显示外观")); gap(modes, 18);
        LinearLayout choices = horizontal();
        int choice = prefs.getInt("appearance", 0);
        String[] names = {"跟随系统", "白天模式", "黑夜模式"};
        for (int i = 0; i < names.length; i++) {
            final int mode = i;
            LinearLayout item = vertical(); item.setGravity(Gravity.CENTER);
            item.setPadding(u(12), u(22), u(12), u(20));
            item.setBackground(touch(i == choice ? selected : bg, 18));
            item.addView(new ModePreview(i), lp(u(104), u(66))); gap(item, 20);
            LinearLayout name = horizontal(); name.setGravity(Gravity.CENTER);
            name.addView(transferLabel(names[i], 19, text));
            if (choice == i) { space(name, 8); name.addView(new Icon(4, accent), lp(u(19), u(19))); }
            item.addView(name);
            item.setContentDescription(names[i]); item.setFocusable(true); item.setSelected(i == choice);
            item.setOnClickListener(v -> {
                if (prefs.getInt("appearance", 0) == mode) return;
                prefs.edit().putInt("appearance", mode).apply();
                recreate();
            });
            choices.addView(item, new LinearLayout.LayoutParams(0, -2, 1));
            if (i != 2) space(choices, 15);
        }
        modes.addView(choices); body.addView(modes);
    }

    private void releaseSection(LinearLayout body) {
        LinearLayout updates = card();
        LinearLayout row = horizontal();
        LinearLayout copy = vertical();
        copy.addView(featureTitle("软件更新"));
        gap(copy, 8);
        copy.addView(featureDetail("当前版本 " + versionName()));
        row.addView(copy, new LinearLayout.LayoutParams(0, -2, 1));
        space(row, 14);
        checkReleaseButton = featureButton("检查更新", true, v -> {
            if (ReleaseDownloads.readyFile(this) != null) promptInstallUpdate(true);
            else checkRelease();
        });
        row.addView(checkReleaseButton, lp(-2, -2));
        updates.addView(row);
        gap(updates, 15);
        releaseStatus = featureDetail("");
        updates.addView(releaseStatus);
        gap(updates, 6);
        releasesButton = featureButton("GitHub 发行版", false, v -> openReleasePage());
        updates.addView(releasesButton, lp(-2, -2));
        gap(updates, 12);
        View divider = new View(this);
        divider.setBackgroundColor(line);
        updates.addView(divider, lp(-1, Math.max(1, u(1))));
        gap(updates, 14);
        LinearLayout autoRow = horizontal();
        LinearLayout autoCopy = vertical();
        autoCopy.addView(featureTitle("自动检查更新"));
        gap(autoCopy, 7);
        autoCopy.addView(featureDetail("每 30 天联网检查一次"));
        autoRow.addView(autoCopy, new LinearLayout.LayoutParams(0, -2, 1));
        space(autoRow, 14);
        Switch automatic = settingSwitch("自动检查更新", releasePrefs.getBoolean(ReleaseUpdates.AUTO, false));
        automatic.setOnCheckedChangeListener((view, checked) -> {
            if (!ReleaseUpdates.setAutomatic(this, checked)) {
                view.setOnCheckedChangeListener(null);
                view.setChecked(false);
                rebuildPage();
                message("暂时无法启用自动检查");
            }
        });
        autoRow.addView(automatic, lp(-2, -2));
        updates.addView(autoRow);
        body.addView(updates);
        refreshReleaseViews();
    }

    private String cachedRelease() {
        return releasePrefs.getString(ReleaseUpdates.TAG, "");
    }

    private void refreshReleaseViews() {
        if (releaseStatus == null) return;
        ReleaseDownloads.State download = ReleaseDownloads.state(this);
        boolean ready = ReleaseDownloads.readyFile(this) != null;
        checkReleaseButton.setText(checkingRelease ? "检查中…" : validatingDownload ? "校验中…"
                : download.active() ? "下载中…" : ready ? "安装更新" : "检查更新");
        checkReleaseButton.setEnabled(!checkingRelease && !validatingDownload && !download.active());
        String tag = cachedRelease();
        boolean newer = ReleaseUpdates.isNewer(tag, versionName());
        releasesButton.setText(newer ? "查看新版 " + tag : "GitHub 发行版");
        long checked = releasePrefs.getLong(ReleaseUpdates.CHECKED_AT, 0);
        String status;
        if (checkingRelease) status = "正在查询 GitHub 发行版…";
        else if (validatingDownload) status = "下载完成，正在校验安装包…";
        else if (download.active()) status = download.status == android.app.DownloadManager.STATUS_PAUSED
                ? "下载已暂停，系统将在网络恢复后继续"
                : "正在下载 " + releasePrefs.getString(ReleaseDownloads.TAG, "") + " 到下载目录"
                + (download.total > 0 ? " · " + Math.min(100, download.done * 100 / download.total) + "%" : "…");
        else if (ready && newer) status = "新版 " + tag + " 已保存到下载目录，点击「安装更新」继续";
        else if (!checkError.isEmpty()) status = checkError;
        else if (!releasePrefs.getString(ReleaseDownloads.ERROR, "").isEmpty())
            status = releasePrefs.getString(ReleaseDownloads.ERROR, "") + "，点击「检查更新」重试";
        else if (download.status == android.app.DownloadManager.STATUS_FAILED)
            status = "下载失败或文件已删除，点击「检查更新」重试";
        else if (checked == 0) status = "尚未检查更新";
        else if (tag.isEmpty()) status = "仓库暂无正式发行版";
        else status = newer ? "发现新版本 " + tag : "未发现新版 · GitHub " + tag;
        if (checked != 0 && !checkingRelease) {
            status += "\n上次成功检查 " + new SimpleDateFormat("yyyy-MM-dd HH:mm", Locale.getDefault())
                    .format(new Date(checked));
        }
        releaseStatus.setText(status);
        releaseStatus.setTextColor(newer && checkError.isEmpty() && !checkingRelease ? accent : muted);
    }

    private void checkRelease() {
        if (checkingRelease || destroyed) return;
        checkingRelease = true;
        checkError = "";
        refreshReleaseViews();
        releaseWorker.execute(() -> {
            ReleaseUpdates.Release release = null;
            String error = "";
            try {
                release = ReleaseUpdates.latest();
                if (ReleaseUpdates.isNewer(release.tag, versionName())) ReleaseDownloads.enqueue(this, release);
            } catch (IOException | JSONException failure) {
                android.util.Log.w("PengyouAssistant", "Manual release check failed", failure);
                error = release == null ? "检查失败，请确认车机可访问 GitHub 后重试" : failure.getMessage();
            }
            ReleaseUpdates.Release result = release;
            String failureMessage = error;
            runOnUiThread(() -> {
                if (destroyed) return;
                if (result != null) ReleaseUpdates.saveResult(releasePrefs, result);
                checkError = failureMessage;
                checkingRelease = false;
                refreshReleaseViews();
                pollReleaseDownload();
            });
        });
    }

    private void announceRelease() {
        promptInstallUpdate(false);
    }

    private void pollReleaseDownload() {
        if (destroyed || checkingRelease || validatingDownload || !foreground) return;
        ReleaseDownloads.State state = ReleaseDownloads.state(this);
        if (state.status == android.app.DownloadManager.STATUS_SUCCESSFUL
                && ReleaseDownloads.readyFile(this) == null
                && releasePrefs.getString(ReleaseDownloads.ERROR, "").isEmpty()) {
            validatingDownload = true;
            refreshReleaseViews();
            releaseWorker.execute(() -> {
                String error = "";
                try { ReleaseDownloads.validateCompleted(this, state.id); }
                catch (IOException | RuntimeException failure) {
                    error = failure.getMessage() == null ? "安装包校验失败" : failure.getMessage();
                }
                String failureMessage = error;
                runOnUiThread(() -> {
                    validatingDownload = false;
                    if (destroyed || releasePrefs.getLong(ReleaseDownloads.ID, -1) != state.id) return;
                    if (!failureMessage.isEmpty()) releasePrefs.edit()
                            .putString(ReleaseDownloads.ERROR, failureMessage).putBoolean(ReleaseDownloads.READY, false).apply();
                    refreshReleaseViews();
                    if (failureMessage.isEmpty()) announceRelease();
                });
            });
        } else {
            refreshReleaseViews();
            announceRelease();
        }
    }

    private void promptInstallUpdate(boolean manual) {
        if (!foreground || checkingRelease || validatingDownload || destroyed) return;
        File file = ReleaseDownloads.readyFile(this);
        String tag = releasePrefs.getString(ReleaseDownloads.TAG, "");
        String announcement = tag + "#" + releasePrefs.getLong(ReleaseDownloads.ID, -1);
        if (file == null || !ReleaseUpdates.isNewer(tag, versionName())
                || (!manual && announcement.equals(releasePrefs.getString(ReleaseUpdates.ANNOUNCED, "")))) return;
        releasePrefs.edit().putString(ReleaseUpdates.ANNOUNCED, announcement).apply();
        showCarDialog("新版 " + tag + " 已下载", "安装包已保存到下载目录：\n" + file.getName()
                + "\n包名、版本和签名校验通过。是否现在安装？", "立即安装", () -> {
            validatingDownload = true; refreshReleaseViews();
            releaseWorker.execute(() -> {
                String error = "";
                try { ReleaseDownloads.validateCompleted(this, releasePrefs.getLong(ReleaseDownloads.ID, -1)); }
                catch (IOException | RuntimeException failure) { error = "安装包已变更或无法验证，请重新下载"; }
                String failureMessage = error;
                runOnUiThread(() -> {
                    validatingDownload = false;
                    if (destroyed) return;
                    if (failureMessage.isEmpty()) install(new Apk(file));
                    else {
                        releasePrefs.edit().putBoolean(ReleaseDownloads.READY, false)
                                .putString(ReleaseDownloads.ERROR, failureMessage).apply();
                        dialog("无法安装更新", failureMessage, null);
                    }
                    refreshReleaseViews();
                });
            });
        }, "稍后安装");
    }

    private void openReleasePage() {
        String tag = cachedRelease();
        String url = ReleaseUpdates.isNewer(tag, versionName())
                ? ReleaseUpdates.releasePage(tag) : ReleaseUpdates.RELEASES;
        try {
            startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(url)));
        } catch (RuntimeException unavailable) {
            ((ClipboardManager) getSystemService(CLIPBOARD_SERVICE))
                    .setPrimaryClip(ClipData.newPlainText("鹏友助手发行版", url));
            message("发行版地址已复制");
        }
    }

    private String versionName() {
        try { return getPackageManager().getPackageInfo(getPackageName(), 0).versionName; }
        catch (Exception ignored) { return "2.0"; }
    }

    private void copyProject() {
        ClipboardManager clipboard = (ClipboardManager) getSystemService(CLIPBOARD_SERVICE);
        clipboard.setPrimaryClip(ClipData.newPlainText("鹏友助手开源项目", PROJECT_URL));
        message("项目地址已复制");
    }

    private ImageView logoView() {
        ImageView logo = new ImageView(this);
        logo.setImageResource(getResources().getIdentifier("about_logo", "drawable", getPackageName()));
        logo.setScaleType(ImageView.ScaleType.FIT_CENTER);
        return logo;
    }

    private void aboutPage(LinearLayout body) {
        LinearLayout about = card();
        about.setGravity(Gravity.CENTER_HORIZONTAL);
        about.setPadding(u(30), u(34), u(30), u(32));
        ImageView logo = logoView();
        logo.setContentDescription("鹏友助手 Logo");
        about.addView(logo, lp(u(124), u(124))); gap(about, 21);
        TextView name = title("鹏友助手", 29); name.setGravity(Gravity.CENTER);
        about.addView(name, lp(-1, -2)); gap(about, 12);
        TextView version = featureDetail("版本 " + versionName()); version.setGravity(Gravity.CENTER);
        about.addView(version, lp(-1, -2)); gap(about, 27);
        TextView projectLabel = featureDetail("项目地址"); projectLabel.setGravity(Gravity.CENTER);
        about.addView(projectLabel, lp(-1, -2)); gap(about, 10);
        TextView project = transferLabel(PROJECT_URL, SUBTITLE_SIZE, accent);
        project.setGravity(Gravity.CENTER); project.setLineSpacing(u(5), 1);
        project.setPadding(0, u(8), 0, u(8));
        project.setContentDescription("打开开源项目地址");
        project.setFocusable(true);
        project.setOnClickListener(v -> {
            try { startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(PROJECT_URL))); }
            catch (RuntimeException unavailable) { copyProject(); }
        });
        about.addView(project, lp(-1, -2)); gap(about, 19);
        Bitmap projectCode = qr(PROJECT_URL);
        if (projectCode != null) {
            ImageView projectQr = new ImageView(this);
            projectQr.setImageBitmap(projectCode);
            projectQr.setScaleType(ImageView.ScaleType.FIT_CENTER);
            projectQr.setBackground(shape(Color.WHITE, 12, false));
            projectQr.setPadding(u(8), u(8), u(8), u(8));
            projectQr.setContentDescription("项目地址二维码");
            about.addView(projectQr, lp(u(168), u(168))); gap(about, 11);
        } else {
            TextView retry = label("二维码生成失败，请点击上方项目地址", 15, muted);
            retry.setGravity(Gravity.CENTER); about.addView(retry, lp(-1, -2));
            gap(about, 11);
        }
        TextView scan = featureDetail("扫码访问Github项目仓库；开源项目，禁止倒卖。");
        scan.setGravity(Gravity.CENTER); about.addView(scan, lp(-1, -2));
        body.addView(about, lp(-1, -2));
    }

    @Override public void onConfigurationChanged(Configuration c) {
        super.onConfigurationChanged(c);
        // Recreate with the newly selected Activity theme when following the vehicle theme;
        // for other configuration changes preserve the current activity and scroll position.
        if (prefs != null && prefs.getInt("appearance", 0) == 0 && dark != isDark()) recreate();
        else if (root != null) rebuildPage();
    }
    @Override protected void onActivityResult(int request, int result, Intent data) {
        super.onActivityResult(request, result, data);
        if (request == STORAGE_REQUEST) {
            storageNote = storageGranted() ? "文件权限已生效" : "尚未授予文件权限";
            if (root != null) build();
        } else if (request == INSTALL_REQUEST) {
            awaitingInstaller = false;
            scanStatus = result == RESULT_OK ? "安装已完成" : "已返回鹏友助手";
            fillFiles();
        }
    }
    @Override protected void onResume() {
        super.onResume();
        if (exiting) return;
        foreground = true;
        releaseHandler.removeCallbacks(downloadPoll);
        releaseHandler.post(downloadPoll);
        if (root != null && dark != isDark()) rebuildPage();
        if (page == Page.TRANSFER && server == null) { startServer(); build(); }
        if (page == Page.FILES && root != null) {
            if (awaitingInstaller && !adbBusy) {
                awaitingInstaller = false;
                scanStatus = "已返回鹏友助手 · " + installerRoute;
            }
            // Re-read actual permission state, including external ADB grants.
            build(); scan();
        }
        if (page == Page.DEBUG && root != null) rebuildPage();
        refreshReleaseViews();
        announceRelease();
    }
    @Override protected void onPause() {
        foreground = false;
        releaseHandler.removeCallbacks(downloadPoll);
        super.onPause();
    }
    @Override public void onRequestPermissionsResult(int code, String[] permissions, int[] grants) {
        super.onRequestPermissionsResult(code, permissions, grants);
        if (code == 20) { if (page == Page.TRANSFER) startServer(); build(); scan(); }
    }
    @Override public void onBackPressed() {
        if (page != Page.FILES) navigate(Page.FILES); else super.onBackPressed();
    }
    @Override protected void onDestroy() {
        destroyed = true; ++scanToken; stopServer(); worker.shutdownNow();
        releaseHandler.removeCallbacks(downloadPoll);
        systemWorker.shutdownNow(); releaseWorker.shutdownNow();
        releasePrefs.unregisterOnSharedPreferenceChangeListener(releaseListener);
        super.onDestroy();
    }
    @Override protected void onStop() {
        stopServer();
        super.onStop();
    }
    private void message(String value) { Toast.makeText(this, value, Toast.LENGTH_SHORT).show(); }

    private void exitApp() {
        if (exiting) return;
        exiting = true; destroyed = true; ++scanToken;
        stopServer(); worker.shutdownNow(); systemWorker.shutdownNow(); releaseWorker.shutdownNow();
        prefs.edit().putInt("appearance", prefs.getInt("appearance", 0)).commit();
        try {
            ActivityManager manager = (ActivityManager) getSystemService(ACTIVITY_SERVICE);
            for (ActivityManager.AppTask task : manager.getAppTasks()) task.finishAndRemoveTask();
        } catch (RuntimeException ignored) {}
        finishAndRemoveTask();
        new Handler(Looper.getMainLooper()).postDelayed(() -> {
            android.os.Process.killProcess(android.os.Process.myPid());
            System.exit(0);
        }, 250);
    }

    private final class CarSwitch extends Switch {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        CarSwitch() {
            super(CarActivity.this);
            setThumbDrawable(null); setTrackDrawable(null); setSwitchPadding(0);
            setPadding(0, 0, 0, 0); setBackgroundColor(Color.TRANSPARENT);
            // Match the soft, slightly raised thumb used by the vehicle's driving settings.
            setLayerType(View.LAYER_TYPE_SOFTWARE, null);
        }
        @Override public void onMeasure(int width, int height) { setMeasuredDimension(u(90), u(56)); }
        @Override protected void onDraw(Canvas canvas) {
            float left = u(5), top = (getHeight() - u(40)) / 2f;
            paint.setAlpha(isEnabled() ? 255 : 90);
            paint.setColor(isChecked() ? (dark ? 0xffcdd0d6 : 0xff00b698)
                    : (dark ? 0xff3d4048 : 0xffcbd3dd));
            paint.setAlpha(isEnabled() ? 255 : 90);
            canvas.drawRoundRect(new RectF(left, top, left + u(80), top + u(40)), u(20), u(20), paint);
            paint.setColor(isChecked() ? (dark ? 0xff373a43 : Color.WHITE)
                    : (dark ? 0xff9296a0 : Color.WHITE));
            paint.setAlpha(isEnabled() ? 255 : 90);
            paint.setShadowLayer(u(2), 0, u(1), dark ? 0x66000000 : 0x300d2538);
            canvas.drawCircle(left + u(isChecked() ? 60 : 20), top + u(20), u(15), paint);
            paint.clearShadowLayer();
        }
    }

    private final class ModePreview extends View {
        final int mode;
        final Paint p = new Paint(Paint.ANTI_ALIAS_FLAG);
        ModePreview(int mode) { super(CarActivity.this); this.mode = mode; setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO); }
        @Override protected void onDraw(Canvas c) {
            c.save(); c.scale(getWidth() / 104f, getHeight() / 66f);
            p.setColor(mode == 2 ? 0xff15161a : 0xfff5f6f8);
            c.drawRoundRect(new RectF(0, 0, 104, 66), 6, 6, p);
            if (mode == 0) {
                c.save(); c.clipRect(52, 0, 104, 66); p.setColor(0xff15161a);
                c.drawRoundRect(new RectF(0, 0, 104, 66), 6, 6, p); c.restore();
            }
            p.setColor(mode == 2 ? 0xff30333b : 0xffe0e4e9);
            c.drawRoundRect(new RectF(7, 8, 29, 58), 3, 3, p);
            for (int i = 0; i < 3; i++) {
                p.setColor((mode == 2 || mode == 0) ? 0xff454953 : Color.WHITE);
                c.drawRoundRect(new RectF(36, 9 + i * 17, 97, 21 + i * 17), 3, 3, p);
            }
            p.setColor(0xff0caf88); c.drawRoundRect(new RectF(11, 15, 25, 19), 2, 2, p);
            c.restore();
        }
    }

    /** Small line icons drawn locally, with no emoji or external icon dependency. */
    private final class Icon extends View {
        final int kind, color;
        final Paint p = new Paint(Paint.ANTI_ALIAS_FLAG);
        Icon(int kind, int color) { super(CarActivity.this); this.kind = kind; this.color = color; setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO); }
        @Override protected void onDraw(Canvas canvas) {
            super.onDraw(canvas);
            canvas.save(); canvas.scale(getWidth() / 32f, getHeight() / 32f);
            p.setColor(color); p.setStyle(Paint.Style.STROKE); p.setStrokeWidth(1.8f);
            p.setStrokeCap(Paint.Cap.ROUND); p.setStrokeJoin(Paint.Join.ROUND);
            Path path = new Path();
            if (kind == 0) {
                path.moveTo(16, 3); path.lineTo(28, 9); path.lineTo(28, 23);
                path.lineTo(16, 29); path.lineTo(4, 23); path.lineTo(4, 9); path.close();
                canvas.drawPath(path, p); path.reset(); path.moveTo(4, 9); path.lineTo(16, 15);
                path.lineTo(28, 9); path.moveTo(16, 15); path.lineTo(16, 29);
                path.moveTo(10, 6); path.lineTo(22, 12); canvas.drawPath(path, p);
            } else if (kind == 1) {
                path.moveTo(16, 21); path.lineTo(16, 4); path.moveTo(9, 11); path.lineTo(16, 4);
                path.lineTo(23, 11); path.moveTo(5, 19); path.lineTo(5, 27);
                path.lineTo(27, 27); path.lineTo(27, 19); canvas.drawPath(path, p);
            } else if (kind == 2) {
                for (int y = 8; y <= 24; y += 8) {
                    int x = y == 16 ? 21 : 11;
                    canvas.drawLine(4, y, x - 4, y, p); canvas.drawLine(x + 4, y, 28, y, p);
                    canvas.drawCircle(x, y, 3.5f, p);
                }
            } else if (kind == 3) {
                canvas.drawCircle(16, 16, 7, p);
                for (int i = 0; i < 8; i++) {
                    double a = Math.PI * i / 4;
                    canvas.drawLine(16 + (float)Math.cos(a) * 11, 16 + (float)Math.sin(a) * 11,
                            16 + (float)Math.cos(a) * 14, 16 + (float)Math.sin(a) * 14, p);
                }
            } else if (kind == 5) {
                canvas.drawRoundRect(new RectF(3, 5, 29, 27), 3, 3, p);
                path.moveTo(8, 11); path.lineTo(13, 16); path.lineTo(8, 21);
                path.moveTo(17, 21); path.lineTo(24, 21); canvas.drawPath(path, p);
            } else if (kind == 6) {
                canvas.drawArc(new RectF(5, 5, 27, 27), -50, 280, false, p);
                canvas.drawLine(16, 2, 16, 16, p);
            } else if (kind == 7) {
                canvas.drawCircle(16, 16, 12, p);
                canvas.drawLine(16, 14, 16, 23, p);
                p.setStyle(Paint.Style.FILL); canvas.drawCircle(16, 9, 1.2f, p);
            } else if (kind == 8) {
                path.moveTo(11, 5); path.lineTo(22, 16); path.lineTo(11, 27);
                canvas.drawPath(path, p);
            } else {
                path.moveTo(5, 16); path.lineTo(12, 23); path.lineTo(27, 8); canvas.drawPath(path, p);
            }
            canvas.restore();
        }
    }

}
