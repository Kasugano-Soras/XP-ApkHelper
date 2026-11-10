# P7-ApkHelper（安装助手）

## 来历
本项目基于焕芯8295P_车友群内大佬分享的 `p7安装器1.0.apk`
该版本WEB上传页选择框把 `accept` 写为`.apk,application/vnd.android.package-archive`
Apple设备不认这个类型，会把文件当作`public.data` APK在选择器里被置灰导致无法上传文件。基于此发布更新版本。
更新版本主要修改了 `accept` 与 `application/octet-stream`，将限制类型的地方挪到页面 JS 后缀校验和车机端400白名单校验。另支持上传微信下载的`.apk.1`文件，自动重命名为正确后缀。以及新增一些小功能


## 简介
给 P7 车机用的 APK 安装小工具：手机浏览器把 APK 传进车机 `Download`，车机上点一下即可完成安装。


由于车机即使打开了ADB也不允许 `adb install`，安装第三方 APK 只能把文件拷贝至车机再用命令行调出系统安装界面，略显繁琐。这个App把这套步骤做成了图形化操作界面。

软件仅在P7（SA8295P）焕芯版通过测试，其他车型请自测，不保证可用性。

## 功能

| 功能 | 说明 |
|---|---|
| Apple设备支持 | 支持APPLE设备上传文件 |
| 自动重命名 | 支持上传`.apk.1`的文件自动改名回正确的 `.apk` |
| 列出 Download 全部 APK | 首页扫描 `/sdcard/Download`、`/storage/emulated/0/Download`、`/sdcard`，同时用调试连接 `ls` 一遍 Download，两路按规范化路径去重后合并 |
| 一键安装 | 用 `file://` + `PackageInstallerActivity` 调起系统安装界面，用户点「继续 → 更新」 |
| 连接复用 | 一个 App 会话只与车机握手一次，后续安装复用同一条 adb 连接，避免每次点安装都弹 USB 调试授权 |
| 类型判定 | `accept` 不再收紧，改为页面 JS 后缀校验 + 车机端 400 白名单， |
| 自绘图标 | 五套密度（48/72/96/144/192）内建 |


## 安装

首先需要获取车机的ADB权限，如无ADB权限则无法安装此软件。

在 [Releases](../../releases) 下载对应版本的 APK，拷到车机 `Download` 后用AM方式安装即可。

首次使用需要在车机上放行一次 USB 调试，勾选始终允许。

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


## 声明

个人自用工具，与小鹏官方无关。改动车机行为（含调试授权、安装第三方应用）有一定风险，后果自行承担。
