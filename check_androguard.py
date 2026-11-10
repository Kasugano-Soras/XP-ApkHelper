"""Independent dex check with androguard: disassemble the patched upload handler."""
import sys
from loguru import logger

logger.remove()          # silence androguard's debug logging
from androguard.misc import AnalyzeAPK

apk_path = sys.argv[1]
a, ds, dx = AnalyzeAPK(apk_path)
print("package:", a.get_package(), "| versionName:", a.get_androidversion_name(),
      "| versionCode:", a.get_androidversion_code())
print("main activity:", a.get_main_activity())

dex = ds[0]
cls = dex.get_class("Lcom/dsh/apkhelper/HttpUploadServer;")
print("class:", cls.get_name())

target = [m for m in cls.get_methods() if m.name == "fixApkName"]
print("fixApkName found:", len(target))
for m in target:
    print("\nmethod:", m.name, m.get_descriptor(), "| access:", m.get_access_flags_string())
    for ins in m.get_instructions():
        print("   ", ins.get_name(), ins.get_output())
