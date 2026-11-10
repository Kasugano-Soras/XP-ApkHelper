.class Lcom/dsh/apkhelper/ToolsActivity$1;
.super Ljava/lang/Object;
.source "ToolsActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/dsh/apkhelper/ToolsActivity;->onCreate(Landroid/os/Bundle;)V
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

    .line 84
    iput-object p1, p0, Lcom/dsh/apkhelper/ToolsActivity$1;->this$0:Lcom/dsh/apkhelper/ToolsActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 86
    iget-object p1, p0, Lcom/dsh/apkhelper/ToolsActivity$1;->this$0:Lcom/dsh/apkhelper/ToolsActivity;

    invoke-static {p1}, Lcom/dsh/apkhelper/ToolsActivity;->access$000(Lcom/dsh/apkhelper/ToolsActivity;)Z

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/dsh/apkhelper/ToolsActivity$1;->this$0:Lcom/dsh/apkhelper/ToolsActivity;

    iget-object v0, p0, Lcom/dsh/apkhelper/ToolsActivity$1;->this$0:Lcom/dsh/apkhelper/ToolsActivity;

    invoke-static {v0}, Lcom/dsh/apkhelper/ToolsActivity;->access$100(Lcom/dsh/apkhelper/ToolsActivity;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    invoke-static {p1, v0}, Lcom/dsh/apkhelper/ToolsActivity;->access$200(Lcom/dsh/apkhelper/ToolsActivity;Z)V

    .line 87
    :cond_0
    return-void
.end method
