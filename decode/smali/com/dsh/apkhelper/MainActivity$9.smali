.class Lcom/dsh/apkhelper/MainActivity$9;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Ljava/lang/Runnable;

# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/dsh/apkhelper/MainActivity;->mergeAdb()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

# instance fields
.field final synthetic this$0:Lcom/dsh/apkhelper/MainActivity;

# direct methods
.method constructor <init>(Lcom/dsh/apkhelper/MainActivity;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/dsh/apkhelper/MainActivity$9;->this$0:Lcom/dsh/apkhelper/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

# virtual methods
.method public run()V
    .locals 4

    const-string v0, "ls -1 /sdcard/Download"

    const/16 v1, 0x13ba

    invoke-static {v0, v1}, Lcom/dsh/apkhelper/AdbShell;->exec(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v2

    const-string v0, "ERR"

    invoke-virtual {v2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :post

    const/16 v1, 0x15b3

    const-string v0, "ls -1 /sdcard/Download"

    invoke-static {v0, v1}, Lcom/dsh/apkhelper/AdbShell;->exec(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v2

    :post
    new-instance v0, Lcom/dsh/apkhelper/MainActivity$9$1;

    iget-object v1, p0, Lcom/dsh/apkhelper/MainActivity$9;->this$0:Lcom/dsh/apkhelper/MainActivity;

    invoke-direct {v0, v1, v2}, Lcom/dsh/apkhelper/MainActivity$9$1;-><init>(Lcom/dsh/apkhelper/MainActivity;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/dsh/apkhelper/MainActivity$9;->this$0:Lcom/dsh/apkhelper/MainActivity;

    invoke-virtual {v1, v0}, Lcom/dsh/apkhelper/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method
