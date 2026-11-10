.class Lcom/dsh/apkhelper/MainActivity$7;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/dsh/apkhelper/MainActivity;->confirmDelete(Ljava/io/File;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/dsh/apkhelper/MainActivity;

.field final synthetic val$f:Ljava/io/File;


# direct methods
.method constructor <init>(Lcom/dsh/apkhelper/MainActivity;Ljava/io/File;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 237
    iput-object p1, p0, Lcom/dsh/apkhelper/MainActivity$7;->this$0:Lcom/dsh/apkhelper/MainActivity;

    iput-object p2, p0, Lcom/dsh/apkhelper/MainActivity$7;->val$f:Ljava/io/File;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 239
    iget-object p1, p0, Lcom/dsh/apkhelper/MainActivity$7;->val$f:Ljava/io/File;

    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    move-result p1

    .line 240
    iget-object p2, p0, Lcom/dsh/apkhelper/MainActivity$7;->this$0:Lcom/dsh/apkhelper/MainActivity;

    .line 241
    if-eqz p1, :cond_0

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "\u5df2\u5220\u9664 "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object v0, p0, Lcom/dsh/apkhelper/MainActivity$7;->val$f:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    const-string p1, "\u5220\u9664\u5931\u8d25\uff08\u6ca1\u6709\u5199\u6743\u9650\uff1f\uff09"

    .line 240
    :goto_0
    const/4 v0, 0x0

    invoke-static {p2, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    .line 242
    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 243
    iget-object p1, p0, Lcom/dsh/apkhelper/MainActivity$7;->this$0:Lcom/dsh/apkhelper/MainActivity;

    invoke-static {p1}, Lcom/dsh/apkhelper/MainActivity;->access$000(Lcom/dsh/apkhelper/MainActivity;)V

    .line 244
    return-void
.end method
