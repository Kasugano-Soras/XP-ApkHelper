# P7-ApkHelper（安装助手）

给小鹏 P7 车机用的 APK 安装小工具：手机浏览器把 APK 传进车机 `Download`，车机上点一下就能装。

车机（E28U / `au8295_xp`，Android 12）**不允许 `adb install`**（`isPlatSigned:false`），也没有 root，所以第三方 APK 只能走「App 内把文件落到 Download → 再调系统安装界面」这条路。这个 App 就是把这套流程做成一个界面。

- 包名 `com.dsh.apkhelper` · minSdk 23 · targetSdk 30
- 当前版本 **1.20**（versionCode 6）
- 签名证书 SHA-256 `a6196bc28aa7681fdced7c41b47264e1b7d8d45ebcc38c18a49bdc071e5341ff`（全系一致，可覆盖升级）

## 功能

| 功能 | 说明 |
|---|---|
| 手机上传 | App 内开一个 8080 端口的上传服务，手机连同一网络打开页面选文件上传，落到 `/sdcard/Download`；`.apk.1` 自动改名回 `.apk` |
| 列出 Download 全部 APK | 首页扫描 `/sdcard/Download`、`/storage/emulated/0/Download`、`/sdcard`，同时用调试连接 `ls` 一遍 Download 兜底，两路按规范化路径去重后合并 |
| 一键安装 | 用 `file://` + `PackageInstallerActivity` 调起系统安装界面，用户点「继续 → 更新」 |
| 连接复用 | 一个 App 会话只与车机握手一次，后续安装复用同一条 adb 连接，避免每次点安装都弹 USB 调试授权 |
| 图标 | 五套密度（48/72/96/144/192）内建 |

为什么列表要 adb 兜底：车机上 `MANAGE_EXTERNAL_STORAGE` 只能拿到 `default`，系统里没有「所有文件访问权限」的入口（连 `MANAGE_APP_ALL_FILES_ACCESS_PERMISSION` 这个 activity 都没有），所以 App 自己枚举文件时是空的，必须靠调试连接补一路。

## 安装

去 [Releases](../../releases) 下载对应版本的 APK，拷到车机 `Download` 后用任意方式安装即可。装过旧版的直接**覆盖安装**，不用卸载。

首次使用需要在车机上放行一次 USB 调试：弹窗只有键盘能操作（`TAB → ↑ → 回车（勾一律允许）→ ↓ → 回车`）。

> 已知：车机 ROM 把 `/data/misc/adb/adb_keys` 写坏了（`adbd` 报 `Invalid base64 key`），勾「一律允许」也只对当前会话有效，冷启动后的第一次连接仍要再允许一次。这是固件问题，App 侧只能保证「一次会话最多弹一次」。

## 使用

1. 车机上打开「安装助手」，点**扫码传文件**，App 开始监听 8080；
2. 手机连同一个网络（或车机热点），扫二维码 / 打开页面，选 APK 上传；
3. 车机点**刷新列表**，选中刚传上来的包点「安装」，系统界面点「继续」→「更新」。

也可以不用上传：`adb push xxx.apk /sdcard/Download/`、U 盘拷贝都行，首页会列出来。

## 目录结构

| 路径 | 内容 |
|---|---|
| `decode/` | apktool 反编译工作区，改动的 smali 都在 `decode/smali/com/dsh/apkhelper/` |
| `build/` | 构建脚本与中间件：`AndroidManifest_1.20.xml`、`assemble_res.py`（aapt2 组装资源）等 |
| `icon_work/` | 图标源图与 `make_icon.py`（Pillow 生成五套密度） |
| `小鹏p7安装器_*.apk` | 各版本产物 |
| `BUILD.md` | 完整构建与排障文档（aapt2 的坑、smali 分支对照表、车机操作坐标） |
| `更新日志.md` | 面向使用者的版本日志 |
| `Release.md` | 各版本 Release 正文草稿 |
| `sync.ps1` | 提交并推送的辅助脚本 |
| `patch_*.py` / `parse_*.py` / `verify*.py` | 改包、解析 AXML/DEX、校验用的脚本 |

## 构建

没有 Gradle 工程，产物是「反编译现有的包 → 改 smali/资源 → 重新组装 → 签名」：

```powershell
java -jar apktool_3.0.3.jar b decode -o build\apkhelper-1.20-test.apk
python -X utf8 build\assemble_res.py            # aapt2 组装资源 + 合并 classes.dex
# uber-apk-signer 签名（需自备密钥库，见下）
```

三个必须知道的约束：

- **aapt2 不认中文路径**，中间产物必须放到纯 ASCII 的暂存目录；
- targetSdk ≥ 30 时 `resources.arsc` 与 `res/**` 必须以 `ZIP_STORED` 且 4 字节对齐写入，否则 `adb install` 报 `requires the resources.arsc ... stored uncompressed and aligned`；
- 密钥库 `dsh-release.jks` **不在本仓库**（`.gitignore` 排除）。想签出能覆盖升级的包，必须用同一张证书；换成别的证书就只能先卸载旧版。

细节见 [`BUILD.md`](BUILD.md)。

## 已知限制

- **Android 16 上点「安装」会失败**，报 `PackageInstallerActivity` 不存在——新系统换了安装界面的组件名，代码里写死的是旧地址。车机是 Android 12，不受影响。
- **做不了热更新**：车机无 root、无系统签名，替换已安装 APK 这条路不通，只能「下载新包 → 覆盖安装」。
- 上传服务是明文 HTTP，只适合局域网/热点内使用，不要暴露到公网。

## 版本

见 [`更新日志.md`](更新日志.md) 与 [Releases](../../releases)。

## 声明

个人自用工具，与小鹏官方无关。改动车机行为（含调试授权、安装第三方应用）有一定风险，后果自行承担。许可证见 [`LICENSE`](LICENSE)。
