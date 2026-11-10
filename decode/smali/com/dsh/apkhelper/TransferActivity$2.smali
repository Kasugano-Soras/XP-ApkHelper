.class Lcom/dsh/apkhelper/TransferActivity$2;
.super Ljava/lang/Object;
.source "TransferActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/dsh/apkhelper/TransferActivity;->onUploaded(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/dsh/apkhelper/TransferActivity;

.field final synthetic val$name:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/dsh/apkhelper/TransferActivity;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 186
    iput-object p1, p0, Lcom/dsh/apkhelper/TransferActivity$2;->this$0:Lcom/dsh/apkhelper/TransferActivity;

    iput-object p2, p0, Lcom/dsh/apkhelper/TransferActivity$2;->val$name:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 188
    iget-object v0, p0, Lcom/dsh/apkhelper/TransferActivity$2;->this$0:Lcom/dsh/apkhelper/TransferActivity;

    invoke-static {v0}, Lcom/dsh/apkhelper/TransferActivity;->access$000(Lcom/dsh/apkhelper/TransferActivity;)Landroid/widget/TextView;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u5df2\u6536\u5230\uff1a"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/dsh/apkhelper/TransferActivity$2;->val$name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n\u56de\u5230\u4e0a\u4e00\u9875\u70b9\u5237\u65b0\u5373\u53ef\u5b89\u88c5"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 189
    return-void
.end method
