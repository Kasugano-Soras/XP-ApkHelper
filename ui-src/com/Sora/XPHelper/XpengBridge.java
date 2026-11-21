package com.Sora.XPHelper;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.provider.Settings;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/**
 * Native port of the three launch routes and status reads inspected in the
 * user-supplied xpeng-adb.apk (SHA-256 cb3579b101a8281c7d8c6de803c4a20b0efd28098afc8e1b11c7bf15585bf467).
 * No developer setting, repair mode, or vehicle setting is changed automatically.
 */
public final class XpengBridge {
    private XpengBridge() {}
    public static final String DEVTOOLS = "com.xiaopeng.devtools";
    private static final String[] SCREENS = {
        "com.xiaopeng.devtools.view.usersettings.UserSettingsActivity",
        "com.xiaopeng.devtools.view.usersettings.RepairModeActivity"
    };

    public static final class Result {
        public final boolean ok;
        public final String route, trace;
        Result(boolean ok, String route, String trace) {
            this.ok = ok; this.route = route; this.trace = trace;
        }
    }

    public static boolean available(Context context) {
        try {
            context.getPackageManager().getApplicationInfo(DEVTOOLS, 0);
            return true;
        } catch (Exception ignored) {
            return false;
        }
    }

    public static Intent intent(int page) {
        Intent value = page == 2
                ? new Intent("com.xiaopeng.devtools.aftersales").setPackage(DEVTOOLS)
                : new Intent(Intent.ACTION_MAIN).setComponent(new ComponentName(DEVTOOLS, SCREENS[page]));
        return value.putExtra("screenId", 0).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
    }

    public static String status(Context context) {
        return "ADB 总开关   " + readSwitch(context, "adb_enabled")
                + "\nWi-Fi 调试     " + readSwitch(context, "xp_wifi_adb")
                + "\nTCP 端口       " + readProperty("service.adb.tcp.port");
    }

    private static String readSwitch(Context c, String key) {
        try {
            int value = Settings.Global.getInt(c.getContentResolver(), key, -1);
            return value == 1 ? "已开启" : value == 0 ? "已关闭" : "系统未提供";
        } catch (Exception ignored) { return "无法读取"; }
    }

    private static String readProperty(String key) {
        try {
            Object value = invokeStatic("android.os.SystemProperties", "get",
                    new Class<?>[]{String.class}, new Object[]{key});
            String s = String.valueOf(value);
            return s.isEmpty() ? "系统未提供" : s;
        } catch (Throwable ignored) { return "无法读取"; }
    }

    public static Result launch(Context context, int page) {
        Intent intent = intent(page);
        StringBuilder trace = new StringBuilder();
        try {
            context.startActivity(intent);
            return new Result(true, "系统入口", "已请求打开系统页面");
        } catch (Throwable denied) {
            trace.append("系统入口：").append(reason(denied)).append('\n');
        }
        try {
            Object raw = invokeStatic("android.os.ServiceManager", "getService",
                    new Class<?>[]{String.class}, new Object[]{"XuiServiceManager"});
            IBinder xuiBinder = binder(raw, "XuiServiceManager");
            Object service = invokeStatic("com.xiaopeng.xuimanager.IXUIService$Stub", "asInterface",
                    new Class<?>[]{IBinder.class}, new Object[]{xuiBinder});
            Object appBinder = invoke(service, "getXUIService", new Class<?>[]{String.class},
                    new Object[]{"xapp"});
            Object app = invokeStatic("com.xiaopeng.xuimanager.xapp.IXApp$Stub", "asInterface",
                    new Class<?>[]{IBinder.class}, new Object[]{binder(appBinder, "xapp")});
            Bundle options = new Bundle();
            options.putInt("screenId", 0);
            Object result = invoke(app, "startApp", new Class<?>[]{Intent.class, Bundle.class},
                    new Object[]{intent, options});
            boolean ok = !(result instanceof Boolean) || (Boolean) result;
            trace.append("XUI startApp：").append(String.valueOf(result));
            return new Result(ok, "XUI", trace.toString());
        } catch (Throwable denied) {
            trace.append("XUI 入口：").append(reason(denied));
            return new Result(false, "不可用", trace.toString());
        }
    }

    private static IBinder binder(Object value, String name) {
        if (value instanceof IBinder) return (IBinder) value;
        if (value instanceof IInterface) return ((IInterface) value).asBinder();
        throw new IllegalStateException(name + " 服务不可用");
    }
    private static Object invokeStatic(String type, String name, Class<?>[] types, Object[] args) throws Exception {
        Method method = Class.forName(type).getMethod(name, types);
        method.setAccessible(true);
        return method.invoke(null, args);
    }
    private static Object invoke(Object target, String name, Class<?>[] types, Object[] args) throws Exception {
        if (target == null) throw new IllegalStateException("服务接口为空");
        Method method = target.getClass().getMethod(name, types);
        method.setAccessible(true);
        return method.invoke(target, args);
    }
    private static String reason(Throwable t) {
        while (t instanceof InvocationTargetException && t.getCause() != null) t = t.getCause();
        return t.getClass().getSimpleName() + (t.getMessage() == null ? "" : " · " + t.getMessage());
    }
}
