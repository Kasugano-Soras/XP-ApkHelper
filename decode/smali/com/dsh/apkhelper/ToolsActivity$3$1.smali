.class Lcom/dsh/apkhelper/ToolsActivity$3$1;
.super Ljava/lang/Object;
.source "ToolsActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/dsh/apkhelper/ToolsActivity$3;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/dsh/apkhelper/ToolsActivity$3;

.field final synthetic val$ok:Z

.field final synthetic val$out:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/dsh/apkhelper/ToolsActivity$3;ZLjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 138
    iput-object p1, p0, Lcom/dsh/apkhelper/ToolsActivity$3$1;->this$1:Lcom/dsh/apkhelper/ToolsActivity$3;

    iput-boolean p2, p0, Lcom/dsh/apkhelper/ToolsActivity$3$1;->val$ok:Z

    iput-object p3, p0, Lcom/dsh/apkhelper/ToolsActivity$3$1;->val$out:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 140
    iget-object v0, p0, Lcom/dsh/apkhelper/ToolsActivity$3$1;->this$1:Lcom/dsh/apkhelper/ToolsActivity$3;

    iget-object v0, v0, Lcom/dsh/apkhelper/ToolsActivity$3;->this$0:Lcom/dsh/apkhelper/ToolsActivity;

    invoke-static {v0}, Lcom/dsh/apkhelper/ToolsActivity;->access$500(Lcom/dsh/apkhelper/ToolsActivity;)Landroid/widget/Button;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 141
    iget-boolean v0, p0, Lcom/dsh/apkhelper/ToolsActivity$3$1;->val$ok:Z

    const/4 v1, 0x0

    if-nez v0, :cond_1

    .line 142
    iget-object v0, p0, Lcom/dsh/apkhelper/ToolsActivity$3$1;->this$1:Lcom/dsh/apkhelper/ToolsActivity$3;

    iget-object v0, v0, Lcom/dsh/apkhelper/ToolsActivity$3;->this$0:Lcom/dsh/apkhelper/ToolsActivity;

    invoke-static {v0, v1}, Lcom/dsh/apkhelper/ToolsActivity;->access$002(Lcom/dsh/apkhelper/ToolsActivity;Z)Z

    .line 143
    iget-object v0, p0, Lcom/dsh/apkhelper/ToolsActivity$3$1;->this$1:Lcom/dsh/apkhelper/ToolsActivity$3;

    iget-object v0, v0, Lcom/dsh/apkhelper/ToolsActivity$3;->this$0:Lcom/dsh/apkhelper/ToolsActivity;

    invoke-static {v0}, Lcom/dsh/apkhelper/ToolsActivity;->access$600(Lcom/dsh/apkhelper/ToolsActivity;)Landroid/widget/TextView;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u5931\u8d25\uff1a"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/dsh/apkhelper/ToolsActivity$3$1;->val$out:Ljava/lang/String;

    if-nez v2, :cond_0

    const-string v2, ""

    goto :goto_0

    :cond_0
    iget-object v2, p0, Lcom/dsh/apkhelper/ToolsActivity$3$1;->val$out:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    :goto_0
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 144
    return-void

    .line 146
    :cond_1
    iget-object v0, p0, Lcom/dsh/apkhelper/ToolsActivity$3$1;->this$1:Lcom/dsh/apkhelper/ToolsActivity$3;

    iget-object v0, v0, Lcom/dsh/apkhelper/ToolsActivity$3;->this$0:Lcom/dsh/apkhelper/ToolsActivity;

    .line 147
    iget-object v2, p0, Lcom/dsh/apkhelper/ToolsActivity$3$1;->this$1:Lcom/dsh/apkhelper/ToolsActivity$3;

    iget-boolean v2, v2, Lcom/dsh/apkhelper/ToolsActivity$3;->val$block:Z

    if-eqz v2, :cond_2

    const-string v2, "\u5df2\u5c4f\u853d\u7cfb\u7edf\u66f4\u65b0"

    goto :goto_1

    :cond_2
    const-string v2, "\u5df2\u6062\u590d\u7cfb\u7edf\u66f4\u65b0"

    .line 146
    :goto_1
    invoke-static {v0, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 148
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 149
    iget-object v0, p0, Lcom/dsh/apkhelper/ToolsActivity$3$1;->this$1:Lcom/dsh/apkhelper/ToolsActivity$3;

    iget-object v0, v0, Lcom/dsh/apkhelper/ToolsActivity$3;->this$0:Lcom/dsh/apkhelper/ToolsActivity;

    invoke-static {v0}, Lcom/dsh/apkhelper/ToolsActivity;->access$700(Lcom/dsh/apkhelper/ToolsActivity;)V

    .line 150
    return-void
.end method
