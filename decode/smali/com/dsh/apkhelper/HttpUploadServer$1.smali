.class Lcom/dsh/apkhelper/HttpUploadServer$1;
.super Ljava/lang/Object;
.source "HttpUploadServer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/dsh/apkhelper/HttpUploadServer;->start()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/dsh/apkhelper/HttpUploadServer;


# direct methods
.method constructor <init>(Lcom/dsh/apkhelper/HttpUploadServer;)V
    .locals 0

    .line 45
    iput-object p1, p0, Lcom/dsh/apkhelper/HttpUploadServer$1;->this$0:Lcom/dsh/apkhelper/HttpUploadServer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 47
    iget-object v0, p0, Lcom/dsh/apkhelper/HttpUploadServer$1;->this$0:Lcom/dsh/apkhelper/HttpUploadServer;

    invoke-static {v0}, Lcom/dsh/apkhelper/HttpUploadServer;->access$000(Lcom/dsh/apkhelper/HttpUploadServer;)V

    .line 48
    return-void
.end method
