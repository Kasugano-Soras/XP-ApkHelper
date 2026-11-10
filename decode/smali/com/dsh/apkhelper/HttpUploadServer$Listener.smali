.class public interface abstract Lcom/dsh/apkhelper/HttpUploadServer$Listener;
.super Ljava/lang/Object;
.source "HttpUploadServer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dsh/apkhelper/HttpUploadServer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Listener"
.end annotation


# virtual methods
.method public abstract onLog(Ljava/lang/String;)V
.end method

.method public abstract onUploaded(Ljava/lang/String;)V
.end method
