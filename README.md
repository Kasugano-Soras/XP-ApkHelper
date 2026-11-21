# 鹏友助手（XPHelper）

鹏友助手是面向小鹏 P7 车机的安装包管理与文件传输工具。当前应用包名为 `com.Sora.XPHelper`，显示版本为 **2.0**。

项目地址：[Kasugano-Soras/XPHelper](https://github.com/Kasugano-Soras/XPHelper)

## 功能

- 管理车机 Download 目录中的 APK，并调用系统安装器完成安装。
- 通过局域网网页从手机或电脑向车机传送 APK。
- 提供车机调试入口、昼夜外观设置和 OTA 状态管理。
- 在应用内检查 GitHub Release 更新。

## 下载与安装

从 [GitHub Releases](https://github.com/Kasugano-Soras/XPHelper/releases) 下载 APK，放入车机 Download 目录后打开安装。

## 源码说明

[下载不含 smali/DEX 后端的 UI 与网页源码包](https://github.com/Kasugano-Soras/XPHelper/raw/refs/heads/main/XPHelper-2.0-source.zip)

仓库提供应用 UI Java 源码（`ui-src/`）、上传网页源码（`web-src/`）、网页回归检查及图标源文件。早期 APK 提取的 smali/DEX 后端实现不包含在本仓库中；因此这些文件用于查看和修改 UI/网页层，不能单独重建完整 APK。

## 兼容性

主要在小鹏 P7（SA8295P）车机上验证。使用调试入口或安装第三方 APK 前，请确认你了解相关操作并自行承担风险。
