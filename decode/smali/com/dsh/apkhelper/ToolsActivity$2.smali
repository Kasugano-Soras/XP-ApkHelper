.class Lcom/dsh/apkhelper/ToolsActivity$2;
.super Ljava/lang/Object;
.source "ToolsActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/dsh/apkhelper/ToolsActivity;->refresh()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/dsh/apkhelper/ToolsActivity;


# direct methods
.method constructor <init>(Lcom/dsh/apkhelper/ToolsActivity;)V
    .locals 0

    .line 97
    iput-object p1, p0, Lcom/dsh/apkhelper/ToolsActivity$2;->this$0:Lcom/dsh/apkhelper/ToolsActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 99
    const-string v0, "pm list packages -d"

    const/16 v1, 0x13ba

    invoke-static {v0, v1}, Lcom/dsh/apkhelper/AdbShell;->exec(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    .line 100
    if-eqz v0, :cond_0

    const-string v1, "com.xiaopeng.ota"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 101
    :goto_0
    iget-object v1, p0, Lcom/dsh/apkhelper/ToolsActivity$2;->this$0:Lcom/dsh/apkhelper/ToolsActivity;

    invoke-static {v1}, Lcom/dsh/apkhelper/ToolsActivity;->access$400(Lcom/dsh/apkhelper/ToolsActivity;)Landroid/os/Handler;

    move-result-object v1

    new-instance v2, Lcom/dsh/apkhelper/ToolsActivity$2$1;

    invoke-direct {v2, p0, v0}, Lcom/dsh/apkhelper/ToolsActivity$2$1;-><init>(Lcom/dsh/apkhelper/ToolsActivity$2;Z)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 107
    return-void
.end method
