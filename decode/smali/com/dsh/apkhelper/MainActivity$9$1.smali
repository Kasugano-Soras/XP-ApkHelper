.class Lcom/dsh/apkhelper/MainActivity$9$1;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Ljava/lang/Runnable;

# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/dsh/apkhelper/MainActivity$9;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

# instance fields
.field final synthetic this$0:Lcom/dsh/apkhelper/MainActivity;

.field final synthetic val$text:Ljava/lang/String;

# direct methods
.method constructor <init>(Lcom/dsh/apkhelper/MainActivity;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/dsh/apkhelper/MainActivity$9$1;->this$0:Lcom/dsh/apkhelper/MainActivity;

    iput-object p2, p0, Lcom/dsh/apkhelper/MainActivity$9$1;->val$text:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/dsh/apkhelper/MainActivity$9$1;->this$0:Lcom/dsh/apkhelper/MainActivity;

    iget-object v1, p0, Lcom/dsh/apkhelper/MainActivity$9$1;->val$text:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/dsh/apkhelper/MainActivity;->addAdbListing(Ljava/lang/String;)V

    return-void
.end method
