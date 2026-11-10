.class Lcom/dsh/apkhelper/MainActivity$6;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/dsh/apkhelper/MainActivity;->makeRow(Ljava/io/File;)Landroid/view/View;
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

    .line 201
    iput-object p1, p0, Lcom/dsh/apkhelper/MainActivity$6;->this$0:Lcom/dsh/apkhelper/MainActivity;

    iput-object p2, p0, Lcom/dsh/apkhelper/MainActivity$6;->val$f:Ljava/io/File;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 203
    iget-object p1, p0, Lcom/dsh/apkhelper/MainActivity$6;->this$0:Lcom/dsh/apkhelper/MainActivity;

    iget-object v0, p0, Lcom/dsh/apkhelper/MainActivity$6;->val$f:Ljava/io/File;

    invoke-static {p1, v0}, Lcom/dsh/apkhelper/MainActivity;->access$200(Lcom/dsh/apkhelper/MainActivity;Ljava/io/File;)V

    .line 204
    return-void
.end method
