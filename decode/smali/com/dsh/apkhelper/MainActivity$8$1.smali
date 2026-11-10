.class Lcom/dsh/apkhelper/MainActivity$8$1;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/dsh/apkhelper/MainActivity$8;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/dsh/apkhelper/MainActivity$8;

.field final synthetic val$msg:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/dsh/apkhelper/MainActivity$8;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 263
    iput-object p1, p0, Lcom/dsh/apkhelper/MainActivity$8$1;->this$1:Lcom/dsh/apkhelper/MainActivity$8;

    iput-object p2, p0, Lcom/dsh/apkhelper/MainActivity$8$1;->val$msg:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 265
    iget-object v0, p0, Lcom/dsh/apkhelper/MainActivity$8$1;->this$1:Lcom/dsh/apkhelper/MainActivity$8;

    iget-object v0, v0, Lcom/dsh/apkhelper/MainActivity$8;->this$0:Lcom/dsh/apkhelper/MainActivity;

    invoke-static {v0}, Lcom/dsh/apkhelper/MainActivity;->access$300(Lcom/dsh/apkhelper/MainActivity;)Landroid/widget/TextView;

    move-result-object v0

    iget-object v1, p0, Lcom/dsh/apkhelper/MainActivity$8$1;->val$msg:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_0

    .line 266
    const-string v1, "\u5df2\u8c03\u8d77\u5b89\u88c5\u5668\uff0c\u8bf7\u5728\u5f39\u7a97\u91cc\u70b9\u201c\u5b89\u88c5\u201d"

    goto :goto_0

    .line 267
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u8fd4\u56de\uff1a"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/dsh/apkhelper/MainActivity$8$1;->val$msg:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 265
    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 268
    return-void
.end method
