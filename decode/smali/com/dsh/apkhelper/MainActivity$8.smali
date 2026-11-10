.class Lcom/dsh/apkhelper/MainActivity$8;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/dsh/apkhelper/MainActivity;->install(Ljava/io/File;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/dsh/apkhelper/MainActivity;

.field final synthetic val$cmd:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/dsh/apkhelper/MainActivity;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 256
    iput-object p1, p0, Lcom/dsh/apkhelper/MainActivity$8;->this$0:Lcom/dsh/apkhelper/MainActivity;

    iput-object p2, p0, Lcom/dsh/apkhelper/MainActivity$8;->val$cmd:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 258
    iget-object v0, p0, Lcom/dsh/apkhelper/MainActivity$8;->val$cmd:Ljava/lang/String;

    const/16 v1, 0x13ba

    invoke-static {v0, v1}, Lcom/dsh/apkhelper/AdbShell;->exec(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    .line 259
    if-eqz v0, :cond_0

    const-string v1, "ERR"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 260
    iget-object v0, p0, Lcom/dsh/apkhelper/MainActivity$8;->val$cmd:Ljava/lang/String;

    const/16 v1, 0x15b3

    invoke-static {v0, v1}, Lcom/dsh/apkhelper/AdbShell;->exec(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    .line 262
    :cond_0
    if-nez v0, :cond_1

    const-string v0, ""

    goto :goto_0

    :cond_1
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 263
    :goto_0
    iget-object v1, p0, Lcom/dsh/apkhelper/MainActivity$8;->this$0:Lcom/dsh/apkhelper/MainActivity;

    new-instance v2, Lcom/dsh/apkhelper/MainActivity$8$1;

    invoke-direct {v2, p0, v0}, Lcom/dsh/apkhelper/MainActivity$8$1;-><init>(Lcom/dsh/apkhelper/MainActivity$8;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Lcom/dsh/apkhelper/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 270
    return-void
.end method
