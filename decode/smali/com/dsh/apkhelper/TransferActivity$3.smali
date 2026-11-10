.class Lcom/dsh/apkhelper/TransferActivity$3;
.super Ljava/lang/Object;
.source "TransferActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/dsh/apkhelper/TransferActivity;->onLog(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/dsh/apkhelper/TransferActivity;

.field final synthetic val$msg:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/dsh/apkhelper/TransferActivity;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 194
    iput-object p1, p0, Lcom/dsh/apkhelper/TransferActivity$3;->this$0:Lcom/dsh/apkhelper/TransferActivity;

    iput-object p2, p0, Lcom/dsh/apkhelper/TransferActivity$3;->val$msg:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 196
    iget-object v0, p0, Lcom/dsh/apkhelper/TransferActivity$3;->this$0:Lcom/dsh/apkhelper/TransferActivity;

    invoke-static {v0}, Lcom/dsh/apkhelper/TransferActivity;->access$000(Lcom/dsh/apkhelper/TransferActivity;)Landroid/widget/TextView;

    move-result-object v0

    iget-object v1, p0, Lcom/dsh/apkhelper/TransferActivity$3;->val$msg:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 197
    return-void
.end method
