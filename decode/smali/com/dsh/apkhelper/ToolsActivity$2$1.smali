.class Lcom/dsh/apkhelper/ToolsActivity$2$1;
.super Ljava/lang/Object;
.source "ToolsActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/dsh/apkhelper/ToolsActivity$2;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/dsh/apkhelper/ToolsActivity$2;

.field final synthetic val$dis:Z


# direct methods
.method constructor <init>(Lcom/dsh/apkhelper/ToolsActivity$2;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 101
    iput-object p1, p0, Lcom/dsh/apkhelper/ToolsActivity$2$1;->this$1:Lcom/dsh/apkhelper/ToolsActivity$2;

    iput-boolean p2, p0, Lcom/dsh/apkhelper/ToolsActivity$2$1;->val$dis:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 103
    iget-object v0, p0, Lcom/dsh/apkhelper/ToolsActivity$2$1;->this$1:Lcom/dsh/apkhelper/ToolsActivity$2;

    iget-object v0, v0, Lcom/dsh/apkhelper/ToolsActivity$2;->this$0:Lcom/dsh/apkhelper/ToolsActivity;

    iget-boolean v1, p0, Lcom/dsh/apkhelper/ToolsActivity$2$1;->val$dis:Z

    invoke-static {v0, v1}, Lcom/dsh/apkhelper/ToolsActivity;->access$102(Lcom/dsh/apkhelper/ToolsActivity;Z)Z

    .line 104
    iget-object v0, p0, Lcom/dsh/apkhelper/ToolsActivity$2$1;->this$1:Lcom/dsh/apkhelper/ToolsActivity$2;

    iget-object v0, v0, Lcom/dsh/apkhelper/ToolsActivity$2;->this$0:Lcom/dsh/apkhelper/ToolsActivity;

    invoke-static {v0}, Lcom/dsh/apkhelper/ToolsActivity;->access$300(Lcom/dsh/apkhelper/ToolsActivity;)V

    .line 105
    return-void
.end method
