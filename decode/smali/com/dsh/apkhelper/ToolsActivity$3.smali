.class Lcom/dsh/apkhelper/ToolsActivity$3;
.super Ljava/lang/Object;
.source "ToolsActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/dsh/apkhelper/ToolsActivity;->apply(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/dsh/apkhelper/ToolsActivity;

.field final synthetic val$block:Z


# direct methods
.method constructor <init>(Lcom/dsh/apkhelper/ToolsActivity;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 130
    iput-object p1, p0, Lcom/dsh/apkhelper/ToolsActivity$3;->this$0:Lcom/dsh/apkhelper/ToolsActivity;

    iput-boolean p2, p0, Lcom/dsh/apkhelper/ToolsActivity$3;->val$block:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 132
    iget-boolean v0, p0, Lcom/dsh/apkhelper/ToolsActivity$3;->val$block:Z

    if-eqz v0, :cond_0

    .line 133
    const-string v0, "pm disable-user --user 0 com.xiaopeng.ota"

    goto :goto_0

    .line 134
    :cond_0
    const-string v0, "pm enable com.xiaopeng.ota"

    .line 135
    :goto_0
    const/16 v1, 0x13ba

    invoke-static {v0, v1}, Lcom/dsh/apkhelper/AdbShell;->exec(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    .line 136
    if-eqz v0, :cond_1

    const-string v1, "ERR"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 137
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-string v2, "exception"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    const/4 v1, 0x1

    goto :goto_1

    :cond_1
    const/4 v1, 0x0

    .line 138
    :goto_1
    iget-object v2, p0, Lcom/dsh/apkhelper/ToolsActivity$3;->this$0:Lcom/dsh/apkhelper/ToolsActivity;

    invoke-static {v2}, Lcom/dsh/apkhelper/ToolsActivity;->access$400(Lcom/dsh/apkhelper/ToolsActivity;)Landroid/os/Handler;

    move-result-object v2

    new-instance v3, Lcom/dsh/apkhelper/ToolsActivity$3$1;

    invoke-direct {v3, p0, v1, v0}, Lcom/dsh/apkhelper/ToolsActivity$3$1;-><init>(Lcom/dsh/apkhelper/ToolsActivity$3;ZLjava/lang/String;)V

    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 152
    return-void
.end method
