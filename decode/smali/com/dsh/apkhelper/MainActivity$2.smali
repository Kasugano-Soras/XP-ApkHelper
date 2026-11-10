.class Lcom/dsh/apkhelper/MainActivity$2;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/dsh/apkhelper/MainActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/dsh/apkhelper/MainActivity;


# direct methods
.method constructor <init>(Lcom/dsh/apkhelper/MainActivity;)V
    .locals 0

    .line 84
    iput-object p1, p0, Lcom/dsh/apkhelper/MainActivity$2;->this$0:Lcom/dsh/apkhelper/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 86
    iget-object p1, p0, Lcom/dsh/apkhelper/MainActivity$2;->this$0:Lcom/dsh/apkhelper/MainActivity;

    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/dsh/apkhelper/MainActivity$2;->this$0:Lcom/dsh/apkhelper/MainActivity;

    const-class v2, Lcom/dsh/apkhelper/TransferActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p1, v0}, Lcom/dsh/apkhelper/MainActivity;->startActivity(Landroid/content/Intent;)V

    .line 87
    return-void
.end method
