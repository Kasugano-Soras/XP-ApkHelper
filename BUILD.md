> 本文档已脱敏：签名口令以 `***` 占位，本机路径以 `<工程目录>` 占位；真实值只在本地保存，不入库。

# 安装助手（小鹏P7 安装器）v1.20 构建说明

包名 `com.dsh.apkhelper`，应用名「安装助手」。当前交付物：`小鹏p7安装器_1.20.apk`
（`versionName=1.20` / `versionCode=6`，275,231 B，SHA-256 `3C2AEAE86159BE8E9FE52566A4BB339BD8C03A0492A31945C8C3F187990745BE`）

## v1.20：内建 App 图标 + 首页列出 /sdcard/Download 里的全部 APK

### 1) App 图标（原包没有 `android:icon`）

原包清单没有 `android:icon`，`resources.arsc` 只有 40 字节的空表，所以图标不是「换张图」能解决的，必须**重建资源表**。

图标做法（脚本 `icon_work\make_icon.py`，可重跑）：源图是纯黑底白标（Android 机器人头 + 剪刀状 X + 云下载箭头）。第一版用「裁内容包围盒→缩放→贴黑画布」，出现矩形贴纸接缝；改为**亮度转 alpha 蒙版法**——按亮度阈值 18 求 alpha，标志渲成纯白+alpha 叠到 `#000000` 画布，再按内容包围盒（原图 bbox=(348,406)-(1763,1774)）等比缩到最长边占画布 72%，居中放入 1024×1024。产出：正方形、圆角（半径 22%、外部透明）、512 商店图、5 个密度 mipmap（48/72/96/144/192）。

### 2) 首页列表：本进程枚举不到时，用自家 adb 兜底

车机上 `MANAGE_EXTERNAL_STORAGE` 是 `default`（`appops get` 带 `rejectTime`），`READ_EXTERNAL_STORAGE` 授予了也没用，且 ROM 里**没有** `MANAGE_APP_ALL_FILES_ACCESS_PERMISSION` / `OPEN_DOCUMENT_TREE` / DocumentsUI 任何入口，所以「授权一下就能看全」这条路在车上不存在。

方案：`load()` 先老实跑本进程 `File.listFiles()`（能列多少列多少），然后 `mergeAdb()` 起线程用 App 自己的 adb 连接执行 `ls -1 /sdcard/Download`，把结果逐行解析成 `/sdcard/Download/<name>` 追加进同一个列表（adb shell 是 shell UID，绕过 scoped storage）。端口先试 5050（车机），`ERR` 再试 5555（模拟器）。去重按 `File.getCanonicalPath()` 归一（`/sdcard/...` 与 `/storage/emulated/0/...` 视为同一个文件），否则同一文件会被列两遍。

### 3) 手写 smali 最容易翻车的地方：`if-*` 分支方向

本轮新增的三个方法**五处条件分支全部写反**，而且症状统一是「静默什么都不做」——能验到新常量、新方法名，连接也建了，但列表就是不增：

| 位置 | 写错的 | 正确的 | 症状 |
|---|---|---|---|
| `mergeAdb()` | `if-eqz v0, :done` | `if-nez v0, :done`（`sMerging` 为 true 时才算「已在合并」） | 首次进 mergeAdb 就 return，线程永不启动 |
| `addAdbListing()` 空串判断 | `if-nez p1, :done` | `if-eqz p1, :done` | 非 null 反而直接 return |
| `addAdbListing()` 后缀判断 | `if-nez v4, :next` | `if-eqz v4, :next` | 是 `.apk` 的行被全部跳过 |
| `addAdbListing()` 去重判断 | `if-eqz v7, :next` | `if-nez v7, :next` | 新条目（`contains=false`）被跳过 |
| `addAdbListing()` 计数守卫 | `if-gtz v0, :done` | `if-lez v0, :done` | 有行时反而跳过状态栏改写 |

语义记牢：`if-eqz` = 等于 0 时跳；`if-nez` = 不等于 0 时跳；`if-gtz` = 大于 0 时跳；`if-lez` = 小于等于 0 时跳。新增方法一律「进入 → 走哪边 → 返回值」三段日志打点验证，验完再删。

### 4) 构建链：aapt2 重建资源表（apktool 做不到）

`patch_manifest.py` 只支持等长替换（`1.1.4`→`1.20` 长度不同，assert 失败），版本号与图标都走 aapt2：

`build\AndroidManifest_1.20.xml`（`versionCode=6` / `versionName="1.20"` / `android:icon="@mipmap/ic_launcher"`）→ `build\assemble_res.py` 把 5 个 mipmap 收进临时 `res/` → `aapt2 compile --dir` → `aapt2 link --manifest … -I android.jar` 得底座包 → 把 apktool 编出的 `classes.dex` 塞进去。

两个硬坑：

1. **aapt2 不认中文路径**，全部落 ASCII 暂存目录 `<工程目录>\AppData\Local\Temp\apkhelper_aapt`；
2. **targetSdk≥30 时 `resources.arsc` 与 `res/**` 必须 `ZIP_STORED` 且 4 字节对齐**，否则 `adb install` 报 `-124 … requires the resources.arsc … stored uncompressed and aligned`（`assemble_res.py` 已强制 STORED，其余 deflate）。

`AdbShell.smali` 的 `.locals 14` 绝不能改大——改大后 p0/p1 落到 v17/v18，4-bit 寄存器指令直接报 `Invalid register`。

### 5) v1.20 验收

| 环境 | 结果 |
|---|---|
| 模拟器 `emulator-5554`（Android 16，1080×2424） | `MANAGE_EXTERNAL_STORAGE` 改回 `default` 后仍列出「共 2 个安装包」（adb 兜底生效）；`refreshing` 前状态是「没找到 APK」——对照组 |
| 车机 `E28U`（Android 12，2400×1200） | 修复版装好后一次启动列出 **「共 12 个安装包」**，实测清点 `/sdcard/Download` 正好 12 个 `.apk`，无重复行（`/sdcard` 与 `/storage/emulated/0` 归一成功） |
| 车机 `dumpsys package` | `versionName=1.20` / `versionCode=6` |
| 车机点安装（adb 列出来的行） | 打开 `PackageInstallerActivity` →「继续」→「更新」→ `InstallSuccess`，说明 adb 侧的文件路径一样能装 |

已知遗留：Android 16 上点安装必失败（App 写死 `com.android.packageinstaller/.PackageInstallerActivity`，该组件在新系统上不存在，车机 Android 12 不受影响）；车机 ROM 把 `adb_keys` 写坏（`E adbd: Invalid base64 key`），每次冷启动第一个 transport 仍弹一次授权。

## v1.1.4：修掉「连接复用根本没生效」的根因（一次会话只弹一次）

1.1.3 在车机上装好后仍然「每点一次安装就弹一次」，实测原因不是缓存写丢，而是**入口判断写反了**：

```smali
# 错：if-eq 在「相等」时跳转，于是端口一致（正该复用）时反而跳去新建连接
if-eq v9, p1, :fresh_conn
# 对：只在端口不同时才算「不是同一条连接」
if-ne v9, p1, :fresh_conn
```

定位过程（在真车机上给 APK 临时加 `Log.i("ApkHelperAdb", …)` 打点，装到车机后连点两次）：

| 时点 | 打点 | 说明 |
|---|---|---|
| 第 1 次点安装 | `branch-fresh` + 四个静态字段全是 `null` / `sPort=0` / `p1=5050` | 首次建连，正常 |
| 第 1 次收尾 | `clse-cached` + `Socket[address=/127.0.0.1,port=5050,localPort=39612]` | 缓存确实写进了静态字段 |
| 第 2 次点安装（同进程 `pid` 不变） | `branch-fresh`，且日志显示 `sSock` 仍是上面那条 Socket、`sOut`/`sIn` 非空、`sPort=5050`、`p1=5050` | **缓存是好的，却仍走新建连接** → 入口条件写反 |
| 改 `if-eq`→`if-ne` 后第 2 次点安装 | `branch-reuse` → `reuse-open-sent` → `clse-cached`，`adbd` 日志**一行都没有** | 复用成功，没有新 transport、没有授权弹窗 |

改完在车机上的验收记录（1.1.4 正式包，已去掉全部调试日志）：

| 步骤 | 结果 |
|---|---|
| `am force-stop` 后重新启动 App，点第 1 次「安装」 | 弹「允许 USB 调试吗」（本次会话唯一一次），`adbd` 新建 `host-36`；键盘勾「一律允许」并点允许后 `PackageInstallerActivity` 打开 |
| 同进程内（`Work` 键切走再 `am start` 回来，`pid` 未变）点第 2 次「安装」 | `mCurrentFocus` 直接是 `PackageInstallerActivity`，**没有 `UsbDebuggingActivity`**，`logcat -s adbd` 为空 → 无新 transport、无弹窗 ✓ |
| 车机 `dumpsys package` | `versionName=1.1.4` / `versionCode=5` |
| 模拟器 `emulator-5554` | `adb install -r -d` 成功，1.1.4 已装 |

补充事实：车机把 `adb_keys` 写坏（`E adbd: Invalid base64 key`）这个 ROM bug 依旧存在，所以**每次冷启动第一次连接仍会弹一次**——1.1.4 保证的是「一次 App 会话最多弹一次」。若哪天车机那边把授权库清干净，连这一次也不用弹。

### 1.1.4 重建命令（可复现）

```powershell
$dir = "D:\DoubaoProjects\chats\2026-11-05\new-chat\小鹏p7安装器_分析"
Set-Location -LiteralPath $dir
# 1) 从 1.1.2 的原始 smali 重打连接复用补丁（脚本非幂等，必须先覆盖）
Copy-Item -LiteralPath "build\AdbShell.smali.bak112" -Destination "decode\smali\com\dsh\apkhelper\AdbShell.smali" -Force
python patch_conn_reuse.py
# 2) 版本名等长替换 1.1.3 → 1.1.4，versionCode 4 → 5
python patch_manifest.py "build\AndroidManifest_1.1.3.xml" "build\AndroidManifest_1.1.4.xml" "1.1.4" 5
Copy-Item -LiteralPath "build\AndroidManifest_1.1.4.xml" -Destination "decode\AndroidManifest.xml" -Force
# 3) 编译 + 签名
java -jar apktool_3.0.3.jar b decode -o "build\apkhelper-1.1.4-unsigned.apk"
java -jar uber-apk-signer.jar -a "build\apkhelper-1.1.4-unsigned.apk" --ks dsh-release.jks --ksAlias dsh --ksPass *** --ksKeyPass *** -o signed_1.1.4
Copy-Item -LiteralPath "signed_1.1.4\apkhelper-1.1.4-aligned-signed.apk" -Destination "小鹏p7安装器_1.1.4.apk" -Force
```

`patch_conn_reuse.py` 里已同步改成 `if-ne v9, p1, :fresh_conn`，从 `.bak112` 重跑得到的 smali 与本次交付完全一致。

### 往车机上装包的正确姿势（`adb install` 被 ROM 拦）

```
adb push 小鹏p7安装器_1.1.4.apk /sdcard/Download/xxx.apk   # 或走 App 自带的上传页
# 车机 App 列表里点「安装」→ 键盘放行授权 → 安装器里「继续」→「更新」
```

注意两点：`adb push` 直接落盘的文件，App 的 `listFiles()` 在车机上**看不到**（存储可见性限制），
要在列表里点到它，得走 App 自己的「扫码传文件」上传（其 HTTP 服务写出的文件 App 自己可见）；
若要从本机直接喂文件，可 `adb forward tcp:18080 tcp:8080` 后
`curl -X POST --data-binary "@包.apk" "http://127.0.0.1:18080/upload?name=xxx.apk"`。

## v1.1.3 相对 v1.1.2 的改动：adb 连接复用（只握手一次）


| # | 位置 | 改动 | 为什么 |
|---|------|------|--------|
| 1 | `AdbShell.smali` 追加 7 个静态字段（`sSock` / `sOut` / `sIn` / `sPort` / `sCurPort` / `sCmd` / `sReuse`） | 缓存「上一次成功用完的连接」 | `exec()` 是纯静态方法，`.locals 14` 不能动（见下），状态只能放类字段 |
| 2 | `exec` 入口 | 若缓存存在且端口相同 → 直接用缓存的 `Socket`/`DataOutputStream`/`DataInputStream`，跳过 `connect` 与 `CNXN`/`AUTH` 握手，直接 `OPEN("shell:<cmd>")` | 握手是弹「允许 USB 调试吗」的唯一触发点，复用连接 = 本次会话不再弹 |
| 3 | `exec` 正常收尾（收到 `A_CLSE` 后） | 把 `Socket`/`DataOutputStream`/`DataInputStream` 存回静态字段，不再 `close()` | 连接留给下一次安装 |
| 4 | `exec` 异常路径 | 先清空缓存；若本次是复用（`sReuse=true`）则用原命令重调一次 `exec` 自动重连；否则返回 `ERR …` | 连接被对端掐掉时自动降级为「重连一次」，用户无感 |
| 5 | `exec` 声明改为 `declared-synchronized` | 多个安装线程不会同时抢一条连接 | 车机上连续点多个 APK 时安全 |
| 6 | `AndroidManifest.xml` | `versionName` 1.1.2 → **1.1.3**；`versionCode` 3 → **4** | 便于区分（`patch_manifest.py` 等长替换） |

### 为什么状态必须放静态字段

`AdbShell.exec` 原 `.locals 14`，参数 p0/p1 正好落在 v14/v15。把 `.locals` 改大（如 17）会让
p0/p1 变成 v17/v18，方法里所有 4-bit 编码指令都会报 `Invalid register v17…v19`，apktool 直接拒绝
编译 smali。所以缓存只能写进类的静态字段，`.locals` 保持 14。

### 实测抓到的两个坑（都是被 Android 的字节码校验器拦下的，apktool 编译期不报）

改完第一版能编译、能签名，但一进「安装」就崩在 `MainActivity$8.run` 的 `exec` 调用上：

1. `VerifyError: … [0x139] 'this' argument 'Reference: java.io.DataOutputStream' not instance of
   'Reference: java.lang.StringBuilder'` —— 复用路径里寄存器 `v3` 还是「流对象」，但循环里
   `StringBuilder->append` 拿它当 `this`。
2. `VerifyError: … [0x14E] copy-reference v1<-v2 type=BooleanConstant` —— 复用路径里把
   `const/4 v2, 0x1`（布尔）留在 `v2`，而 catch 里 `move-object v1, v2` 要求它是 `Socket`。

修法：复用分支里显式补齐寄存器类型 —— 重新 `new-instance v3, StringBuilder`、把 `v2` 赋成
`sget-object sSock`、`v4=0x4e584e43`、`v5/v6/v7/v8=0`（`sReuse` 的布尔改用 `v10` 承载），
再 `goto/16 :conn_ready`。教训：**这类 smali 改动必须真跑一次，编译通过不等于能跑。**

### 验证记录（Android 16 模拟器 `sdk_gphone64_x86_64`，1.1.3 版本实测）

| 步骤 | 结果 |
|---|---|
| `adb install -r` | 成功，`dumpsys package` 读回 `versionName=1.1.3 / versionCode=4` |
| 启动 App → 点第 1 次「安装」 | `adbd` 新建一条 transport（`host-9: read thread spawning`），命令执行完，界面回显 `返回：Starting: Intent {…}`；`netstat` 里 app 与 `127.0.0.1:5555` 有 **1 条 ESTABLISHED** |
| 同一会话点第 2 次「安装」 | 复测结论：1.1.3 的入口判断写反（`if-eq`），这条「没有新 transport」的旧记录**不成立**；1.1.4 改 `if-ne` 后在同一台模拟器与真车机上都复现了「无新 transport」 |
| `adb root` 重启 adbd 把缓存的连接掐死，再点「安装」 | 自动丢弃旧连接并重连（新 transport `host-9`），命令仍正常返回 → 自愈重连 ✓ |
| 再点一次「安装」（缓存已换成新连接） | 又没有任何新 transport → 复用 ✓ |
| `logcat -b crash` | 全程无崩溃、无 `VerifyError` |

协议层单独验证（不依赖 App）：一条 TCP 连接上连续 `OPEN` 三个 `shell:` 通道（`id` /
`getprop ro.product.model` / `echo reuse-ok`）全部正常返回，说明 adbd 允许在同一连接上反复开通道，
脚本 `<工程目录>\Downloads\_adb_reuse_probe2.py`。

模拟器上要能列出 Download 里的 APK，得先 `appops set com.dsh.apkhelper MANAGE_EXTERNAL_STORAGE allow`
（Android 16 的存储可见性老问题，与本改动无关）。

**车机侧实测（1.1.3 时的情况，已在本文件顶部 v1.1.4 节修正）**：1.1.3 装到车机后仍然每次点安装都弹，
后来加日志才查出是入口 `if-eq` 写反导致复用分支从未进入；1.1.4 已修，实测「一次会话只弹一次」通过。

### 从当前工程状态重建 1.1.3

```powershell
$dir = "D:\DoubaoProjects\chats\2026-11-05\new-chat\小鹏p7安装器_分析"
java -jar "$dir\apktool_3.0.3.jar" b "$dir\decode" -o "$dir\build\apkhelper-1.1.3-unsigned.apk"
java -jar "$dir\uber-apk-signer.jar" -a "$dir\build\apkhelper-1.1.3-unsigned.apk" `
  --ks "$dir\dsh-release.jks" --ksAlias dsh --ksPass *** --ksKeyPass *** -o "$dir\signed_1.1.3"
```

连接复用补丁脚本 `patch_conn_reuse.py` 已执行过，重跑前要先把
`build\AdbShell.smali.bak112` 覆盖回 `decode\smali\com\dsh\apkhelper\AdbShell.smali`（脚本不是幂等的）。
脚本已包含上面两处 `VerifyError` 修正与 `declared-synchronized`，从 `.bak112` 重跑可得到与本次一致的 smali。

### 顺带发现（未修，Android 16 的安装器组件改名）

模拟器上点「安装」后 `exec` 返回的是
`Error: Activity class {com.android.packageinstaller/com.android.packageinstaller.PackageInstallerActivity} does not exist.`
—— App 里写死了 Android 12 时代的安装器组件名，Android 16 上该组件已不在
`com.android.packageinstaller` 包里。车机是 Android 12，组件仍在，所以车机不受影响；
如果以后要支持 Android 16 车机/手机，需要改成不带 `-n` 的 `am start -a android.intent.action.VIEW`
或按 `TYPE`/包名运行时探测。

## v1.1.2 当时的状态（历史）

包名 `com.dsh.apkhelper`，应用名「安装助手」。交付物：`小鹏p7安装器_1.1.2.apk`
（SHA-256 `5de8e7720e14d8b41be6cb3e65d5deda6b79650a218006e1fc1138d62f1e5193`，512,393 B）

## v1.1.2 相对 v1.1.1 的改动

| # | 位置 | 改动 | 为什么 |
|---|------|------|--------|
| 1 | 内嵌网页 `<script>` 开头（两处 HTML 同步） | Android 浏览器上 `removeAttribute('accept')`：`navigator.userAgent.indexOf('Android')>=0` 时去掉 `accept`；iOS 保留原 `accept` 白名单 | ColorOS 16 / HyperOS 3 / OriginOS 6 / MagicOS 10 换掉了 DocumentsUI，按 `accept`/`type` 自己过滤，`.apk` 及其 MIME 不在列表里 → “别的都能选、APK 选不到”。去掉 `accept` 后选择器恢复全量，限制仍留在页面 JS 后缀校验 + 车机端 400 |
| 2 | `AdbShell.PUB_KEY`（字段 + `cond_4` 内联串） | `…= root@localhost dsh@car\u0000` → `…= dsh@car`（去掉结尾 NUL 与 `root@localhost` 前缀） | 「记不住授权」的根因，见下节 |
| 3 | `AndroidManifest.xml` | `versionName` 1.1.1 → **1.1.2**；`versionCode` 2 → **3** | 便于区分 |

### 「每次点安装都弹『允许 USB 调试吗』，勾了一律还弹」的根因（已取证）

车机 E28U（Android 12，`ro.adb.secure=1`，`service.adb.tcp.port=5050`）上实测：

1. `dumpsys adb` 里 `user_keys` **已经包含**本应用的钥匙（`…dsh@car`），且与 APK 内置公钥**逐字节完全一致**（700 字符）。
2. 但 adbd 每次新连接加载密钥时打 `E adbd: Invalid base64 key`，随后 `I adbd: prompting user to authorize key` —— 那行钥匙存下来之后 `adbd` 解析不了，所以：
   - 签名验证必然失败（实测用 App 的私钥自签、本地自校验通过，车机仍回第二个 `A_AUTH TOKEN`），
   - 于是每次都退回「上传公钥 → 弹窗确认」这条路，勾「一律允许」也记不住。
3. 可疑点就是 App 发送的公钥串结尾多带了一个 `\u0000` 且名字写成 `root@localhost dsh@car`（双 token），落盘后在 `adb_keys` 里成了脏行。

改法：把公钥串改成规规矩矩的 `<base64> dsh@car`（无 NUL、单 token）。

### v1.1.2 装上后复测：改了名字仍弹，根因改判为「车机侧授权库写坏」

在车机装好 1.1.2 之后重跑取证，结论变了：

1. `dumpsys adb` 的 `user_keys` 里，本 App 的钥匙出现过两种写法：
   `…VgEAAQA= root@localhost dsh@car`（旧）与 `…VgEAAQA= dsh@care@wb`（新写入后名字被粘连污染）。
   能看出**车机 framework 往 `adb_keys` 里写行时会把行写坏/粘连**——这正是每次
   adbd 加载都报 `Invalid base64 key` 的来源。
2. 用**本机 PC 的 adb 私钥**（`<工程目录>\.android\adbkey`，车机 `user_keys` 里明确已授权两条）
   跑同一套裸协议握手：签名同样被拒（收到第二个 `A_AUTH TOKEN`），但**不弹窗**（framework 认得它、静默放行）。
   App 的钥匙则弹。差别不在签名（两者签名都过不了），而在 framework 是否认得出这把钥匙。
3. 于是可以在车机上用键盘把弹窗勾上「一律允许」并点了允许（日志有 `adb client 26 authorized`），
   之后再用 App 钥匙连接仍然 `prompting user to authorize key`。

### 附：车机上怎么用 adb 操作那个弹窗（`input tap` 无效时）

车机分区窗口 `uiautomator dump` 的 bounds 全是 `[0,0][0,0]`，`input tap` 目测坐标点不动弹窗；
但**键盘事件有效**，按键顺序：

```
adb shell input keyevent 61   # TAB，把焦点从按钮移开
adb shell input keyevent 19   # DPAD_UP  → 焦点落到「一律允许」复选框
adb shell input keyevent 66   # ENTER    → 勾上
adb shell input keyevent 20   # DPAD_DOWN → 焦点回到「允许」
adb shell input keyevent 66   # ENTER    → 点掉
```

（`input keyevent 4` 返回键可以关掉弹窗。）

**最终结论（v1.1.2 实测后）**：这是**车机 ROM 的 adb 授权库落盘 bug**，不是 App 公钥串格式问题——
App 侧把名字改干净只能保证自己发的串合法，管不到车机把 `adb_keys` 写坏。要继续改善只有两条路：
① 减少握手次数（一个 App 会话只连一次 adbd，最多弹一次）；② 车机侧清库/刷固件。

补充：车机 `adb install` 被 ROM 拦（`INSTALL_FAILED_INVALID_APK … isPlatSigned:false`），所以**升级只能走 App 自己的「上传 → 点安装」流程**，不能 `adb install -r` 推。

## 一、本次改动（相对下载的 1.0 版）

| # | 位置 | 改动 |
|---|------|------|
| 1 | `AndroidManifest.xml` | `versionName` 1.0 → **1.1.1**；`versionCode` 1 → **2** |
| 2 | 内嵌网页 `<h2>` | 「传到车机 Download」→「**选APK传到车机 Download即可安装，apk.1 自动改名**」 |
| 3 | 内嵌网页 `<input type=file>` | `accept` 由 `.apk,application/vnd.android.package-archive` 改为 `.apk,.apk.1,application/vnd.android.package-archive,application/octet-stream` |
| 4 | 内嵌网页 JS `up()` | 上传前校验文件名后缀，非 `.apk` / `.apk.1` 直接提示「只支持 .apk 或 .apk.1 文件」并中止，不发请求 |
| 5 | `HttpUploadServer.handle()` | 新增 `fixApkName()`：名字以 `.apk.1` 结尾（不区分大小写）时去掉末尾 `.1`，直接以 `xxx.apk` 写入 Download |
| 6 | `HttpUploadServer.handle()` | 新增 `isApk()` 白名单：规范化后不是 `.apk` 结尾的请求返回 **HTTP 400**「只支持 .apk 或 .apk.1 文件」，不落盘 |

### 为什么 `accept` 里要带 `application/octet-stream`

只允许后缀在浏览器层面做不到两端通吃：

- Android：微信下载的 `xxx.apk.1` 真实 MIME 是 `application/octet-stream`，`accept` 里只写 `.apk`/它的 MIME
  会让这类文件在选择器里直接不显示，功能等于废掉（1.0 就是被 `.apk` 卡住的）。
- iOS：Safari 的 `accept` 按 UTI 匹配，`.apk` `.apk.1` 都不是系统已知类型，会被当作 `public.data` 处理，
  过滤本来就不可靠；写得越窄，越容易把用户想选的文件变灰。

结论：**文件选择器的过滤在手机上无法真正收紧**，所以把限制放在两层——页面里选完立刻校验并按后缀拒绝，
车机端再把一次关（即使有人绕过页面直接 POST，也会被 400 拒掉，Download 里不会留下文件）。
这样 Android 能选到 `.apk.1`、iOS 也能正常选文件，而落到车机上的只可能是 `.apk`。

### 后缀判定规则

- 允许：`xxx.apk`、`xxx.APK`、`xxx.apk.1`、`xxx.APK.1`
- 拒绝：`xxx.zip`、`xxx.jpg`、`xxx.apk1`、`xxx.apk.zip` 等
- 拒绝对应的响应：HTTP 400 + 文本「只支持 .apk 或 .apk.1 文件」，不写任何文件

## 二、版本名 1.1 → 1.1.1 是怎么改的

版本名存在 AXML 的字符串池里，**长度一变就不能原地替换**（1.1 是 3 个字符、1.1.1 是 5 个），
所以 `patch_version_name.py` 会重建整个字符串池：

- 字符串**数量不变**，逐个改写后重算 `stringsStart` 与每条偏移，所有字符串索引（元素名、属性名、
  属性值）继续有效，不用重排；
- 每个串后面保留原包的 `0x0000` 终止符，字符串数据区补到 4 字节对齐；
- 只更新字符串池 chunk 的 `size` 与外层 XML chunk 的 `size`，其余 chunk 依次顺延。

## 三、签名

沿用 `dsh-release.jks`（PKCS12，alias `dsh`，口令 `***`），
证书 SHA-256 `a6196bc28aa7681fdced7c41b47264e1b7d8d45ebcc38c18a49bdc071e5341ff`，
与 1.0 版一致 → 车机上已装的旧版可直接覆盖安装升级。

签名方式为 v1 + v2 + v3，zipalign 已通过。

## 四、重新构建（在本目录下执行）

```powershell
$dir = "<工程目录>\Doubao\chats\2026-11-05\new-chat\小鹏p7安装器_分析"

# 1. 反编译原始 APK（原始包：<工程目录>\Downloads\小鹏p7安装器.apk）
java -jar "$dir\apktool_3.0.3.jar" d -f -o "$dir\decode" "<工程目录>\Downloads\小鹏p7安装器.apk" --no-res

# 2. 版本号：versionName 1.1 + versionCode 2（等长替换），再改写成 1.1.1（重建字符串池）
python "$dir\patch_manifest.py" "$dir\AndroidManifest.xml" "$dir\build\AndroidManifest_1.1.xml" "1.1" 2
python "$dir\patch_version_name.py" "$dir\build\AndroidManifest_1.1.xml" "$dir\build\AndroidManifest_1.1.1.xml" "1.1.1"
Copy-Item "$dir\build\AndroidManifest_1.1.1.xml" "$dir\decode\AndroidManifest.xml" -Force

# 3. 网页文案 / accept / 新增 fixApkName
python "$dir\patch_smali.py"

# 4. 上传后缀白名单（页面 JS + 车机端 400）
python "$dir\patch_upload_filter.py"

# 5. 回编译
java -jar "$dir\apktool_3.0.3.jar" b "$dir\decode" -o "$dir\build\apkhelper-1.1.1-unsigned.apk"

# 6. 对齐 + 签名
java -jar "$dir\uber-apk-signer.jar" -a "$dir\build\apkhelper-1.1.1-unsigned.apk" `
  --ks "$dir\dsh-release.jks" --ksAlias dsh --ksPass *** --ksKeyPass *** -o "$dir\signed_1.1.1"
# 产物：signed_1.1.1\apkhelper-1.1.1-aligned-signed.apk
```

补丁脚本都是**幂等性有限**的（找不到旧字符串会直接 assert 失败），改完一次后不要重复执行；
需要重来时先重新执行第 1 步。`patch_manifest.py` 的输入用哪份 manifest 都可以，只要它的版本名是 `1.0`
（本目录根的 `AndroidManifest.xml` 就是原始 1.0 版）。

## 五、验证记录（v1.1.2）

静态/动态：

- 模拟器 Android 16（`sdk_gphone64_x86_64`）`adb install -r` 成功，`dumpsys package` 读回
  `versionName=1.1.2 / versionCode=3`
- `GET /` 返回页面 1375 字节：含 `indexOf('Android')` 的 UA 判断、`accept=` 属性仍在、
  `<h2>` 文案逐字为「选APK传到车机 Download即可安装，apk.1 自动改名」
- `uber-apk-signer -y`：zipalign verified、signature verified [v1、v2、v3]、证书 SHA-256 未变
  （与 1.0/1.1/1.1.1 同证书 → 车机上已装版本可覆盖升级）
- 车机侧：复现了 `Invalid base64 key` + `prompting user to authorize key`；
  新公钥串是否一次授权后长期有效，需车机上点一次「一律允许」后观察

## 五之二、验证记录（v1.1.1 当时）

静态校验（`verify_v11.py`，全部通过）：

- manifest：`versionCode=2`、`versionName=1.1.1`、`package=com.dsh.apkhelper`
- dex：header 校验和与 SHA-1 自洽；旧 accept 串与 `*/*` 都已消失；新 accept、新文案、`fixApkName`、
  `isApk`、拒绝文案都在
- 网页：HTMLParser 解析 `<h2>` 逐字匹配、`input accept` 为新串、页面含 `f.name.toLowerCase()` 校验
- v1 摘要：`MANIFEST.MF` 三个条目 SHA-256 全部匹配；STORE 条目 4 字节对齐
- `uber-apk-signer -y`：zipalign + v1/v2/v3 通过（其内部 aapt2 能正常解析重建后的 AXML，说明格式合法）

动态联调（夜神模拟器 Android 12 / SDK 32）：

1. `adb install -r` 成功，`dumpsys package` 读回 `versionName=1.1.1 / versionCode=2`
   （Android 自己的 AXML 解析器认这份 manifest，是最硬的格式证据）
2. `GET /` 页面标题、`accept`、JS 校验都在
3. 上传实测：

| 上传文件名 | 结果 |
|---|---|
| `微信下载包.apk.1` | 200，`已保存到 Download: 微信下载包.apk` |
| `普通文件.apk` | 200，`已保存到 Download: 普通文件.apk` |
| `别的东西.apk.1` | 200，`已保存到 Download: 别的东西.apk` |
| `说明文档.zip` | **400**，`只支持 .apk 或 .apk.1 文件` |
| `图片.jpg` | **400**，`只支持 .apk 或 .apk.1 文件` |

测试后已清理模拟器（测试文件、测试安装、端口转发），模拟器中用户原有文件未动。

### 踩过的坑

1. 白名单第一版跳转条件写反了（`if-eqz` 应为 `if-nez`），现象是 `.apk` 全被 400 挡住、`.zip` 反而保存成功。
   静态校验抓不到逻辑反转，只有真跑上传才暴露。
2. 重建字符串池时漏了每串尾部的 `0x0000` 终止符，uber-apk-signer 报
   `malformed binary resource: AndroidManifest.xml`；补上终止符 + 4 字节尾部对齐后正常。
   这类 AXML 结构改动，必须让 aapt2/apksig 和 Android 安装器各过一遍。
3. 版本名变长不能走 `patch_manifest.py` 的等长替换路径（它内部有 `assert v == len(new_name)`），
   否则会直接失败。

## 六、使用注意

- 车机首次运行需要给「安装助手」**所有文件访问权限**（MANAGE_EXTERNAL_STORAGE）。
- 绕过网页直接 POST 非 apk 文件时，车机会回 400 并立刻断开连接，部分客户端会显示成网络错误而不是
  那句中文提示 —— 正常用页面操作时页面会先拦下，不会走到这一步。
- 只识别 `.apk.1` 这一种微信后缀；首页扫描逻辑未动，车机上已存在但没走上传流程的 `.apk.1` 不会被列表发现。
- 网页 `<title>` 仍是「传到车机」，只改了正文大标题；应用内「扫码传文件」页第 3 条说明文字未改。
- `versionCode` 仍是 2（与上一版 1.1 相同），覆盖安装不受影响；如果希望车机/手机上能区分两版，
  可以把 versionCode 调大（需要重新走第 2 步的 `patch_manifest.py`）。
