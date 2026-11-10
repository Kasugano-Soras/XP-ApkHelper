.class public final Lcom/google/zxing/oned/UPCAWriter;
.super Ljava/lang/Object;
.source "UPCAWriter.java"

# interfaces
.implements Lcom/google/zxing/Writer;


# instance fields
.field private final subWriter:Lcom/google/zxing/oned/EAN13Writer;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    new-instance v0, Lcom/google/zxing/oned/EAN13Writer;

    invoke-direct {v0}, Lcom/google/zxing/oned/EAN13Writer;-><init>()V

    iput-object v0, p0, Lcom/google/zxing/oned/UPCAWriter;->subWriter:Lcom/google/zxing/oned/EAN13Writer;

    return-void
.end method


# virtual methods
.method public encode(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;II)Lcom/google/zxing/common/BitMatrix;
    .locals 6
    .param p1, "contents"    # Ljava/lang/String;
    .param p2, "format"    # Lcom/google/zxing/BarcodeFormat;
    .param p3, "width"    # I
    .param p4, "height"    # I

    .line 37
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    .end local p1    # "contents":Ljava/lang/String;
    .end local p2    # "format":Lcom/google/zxing/BarcodeFormat;
    .end local p3    # "width":I
    .end local p4    # "height":I
    .local v1, "contents":Ljava/lang/String;
    .local v2, "format":Lcom/google/zxing/BarcodeFormat;
    .local v3, "width":I
    .local v4, "height":I
    invoke-virtual/range {v0 .. v5}, Lcom/google/zxing/oned/UPCAWriter;->encode(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Lcom/google/zxing/common/BitMatrix;

    move-result-object p1

    return-object p1
.end method

.method public encode(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Lcom/google/zxing/common/BitMatrix;
    .locals 7
    .param p1, "contents"    # Ljava/lang/String;
    .param p2, "format"    # Lcom/google/zxing/BarcodeFormat;
    .param p3, "width"    # I
    .param p4, "height"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/google/zxing/BarcodeFormat;",
            "II",
            "Ljava/util/Map<",
            "Lcom/google/zxing/EncodeHintType;",
            "*>;)",
            "Lcom/google/zxing/common/BitMatrix;"
        }
    .end annotation

    .line 46
    .local p5, "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/EncodeHintType;*>;"
    sget-object v0, Lcom/google/zxing/BarcodeFormat;->UPC_A:Lcom/google/zxing/BarcodeFormat;

    if-ne p2, v0, :cond_0

    .line 50
    iget-object v1, p0, Lcom/google/zxing/oned/UPCAWriter;->subWriter:Lcom/google/zxing/oned/EAN13Writer;

    const-string v0, "0"

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lcom/google/zxing/BarcodeFormat;->EAN_13:Lcom/google/zxing/BarcodeFormat;

    move v4, p3

    move v5, p4

    move-object v6, p5

    .end local p3    # "width":I
    .end local p4    # "height":I
    .end local p5    # "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/EncodeHintType;*>;"
    .local v4, "width":I
    .local v5, "height":I
    .local v6, "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/EncodeHintType;*>;"
    invoke-virtual/range {v1 .. v6}, Lcom/google/zxing/oned/EAN13Writer;->encode(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Lcom/google/zxing/common/BitMatrix;

    move-result-object p3

    return-object p3

    .line 47
    .end local v4    # "width":I
    .end local v5    # "height":I
    .end local v6    # "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/EncodeHintType;*>;"
    .restart local p3    # "width":I
    .restart local p4    # "height":I
    .restart local p5    # "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/EncodeHintType;*>;"
    :cond_0
    move v4, p3

    move v5, p4

    move-object v6, p5

    .end local p3    # "width":I
    .end local p4    # "height":I
    .end local p5    # "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/EncodeHintType;*>;"
    .restart local v4    # "width":I
    .restart local v5    # "height":I
    .restart local v6    # "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/EncodeHintType;*>;"
    new-instance p3, Ljava/lang/IllegalArgumentException;

    const-string p4, "Can only encode UPC-A, but got "

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p5

    invoke-virtual {p4, p5}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4

    invoke-direct {p3, p4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p3
.end method
