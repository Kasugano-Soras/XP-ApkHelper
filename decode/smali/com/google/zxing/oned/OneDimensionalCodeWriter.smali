.class public abstract Lcom/google/zxing/oned/OneDimensionalCodeWriter;
.super Ljava/lang/Object;
.source "OneDimensionalCodeWriter.java"

# interfaces
.implements Lcom/google/zxing/Writer;


# static fields
.field private static final NUMERIC:Ljava/util/regex/Pattern;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 34
    const-string v0, "[0-9]+"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/oned/OneDimensionalCodeWriter;->NUMERIC:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method protected static appendPattern([ZI[IZ)I
    .locals 8
    .param p0, "target"    # [Z
    .param p1, "pos"    # I
    .param p2, "pattern"    # [I
    .param p3, "startColor"    # Z

    .line 121
    move v0, p3

    .line 122
    .local v0, "color":Z
    const/4 v1, 0x0

    .line 123
    .local v1, "numAdded":I
    array-length v2, p2

    const/4 v3, 0x0

    move v4, v3

    :goto_0
    if-ge v4, v2, :cond_2

    aget v5, p2, v4

    .line 124
    .local v5, "len":I
    const/4 v6, 0x0

    .local v6, "j":I
    :goto_1
    if-ge v6, v5, :cond_0

    .line 125
    add-int/lit8 v7, p1, 0x1

    .end local p1    # "pos":I
    .local v7, "pos":I
    aput-boolean v0, p0, p1

    .line 124
    add-int/lit8 v6, v6, 0x1

    move p1, v7

    goto :goto_1

    .line 127
    .end local v6    # "j":I
    .end local v7    # "pos":I
    .restart local p1    # "pos":I
    :cond_0
    add-int/2addr v1, v5

    .line 128
    if-nez v0, :cond_1

    const/4 v6, 0x1

    goto :goto_2

    :cond_1
    move v6, v3

    :goto_2
    move v0, v6

    .line 123
    .end local v5    # "len":I
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 130
    :cond_2
    return v1
.end method

.method protected static checkNumeric(Ljava/lang/String;)V
    .locals 2
    .param p0, "contents"    # Ljava/lang/String;

    .line 108
    sget-object v0, Lcom/google/zxing/oned/OneDimensionalCodeWriter;->NUMERIC:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 111
    return-void

    .line 109
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Input should only contain digits 0-9"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static renderResult([ZIII)Lcom/google/zxing/common/BitMatrix;
    .locals 10
    .param p0, "code"    # [Z
    .param p1, "width"    # I
    .param p2, "height"    # I
    .param p3, "sidesMargin"    # I

    .line 85
    array-length v0, p0

    const/4 v1, 0x0

    .line 87
    .local v1, "inputWidth":I
    move v1, v0

    add-int/2addr v0, p3

    .line 88
    .local v0, "fullWidth":I
    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 89
    .local v2, "outputWidth":I
    const/4 v3, 0x1

    invoke-static {v3, p2}, Ljava/lang/Math;->max(II)I

    move-result v3

    .line 91
    .local v3, "outputHeight":I
    div-int v4, v2, v0

    .line 92
    .local v4, "multiple":I
    mul-int v5, v1, v4

    sub-int v5, v2, v5

    div-int/lit8 v5, v5, 0x2

    .line 94
    .local v5, "leftPadding":I
    new-instance v6, Lcom/google/zxing/common/BitMatrix;

    invoke-direct {v6, v2, v3}, Lcom/google/zxing/common/BitMatrix;-><init>(II)V

    .line 95
    .local v6, "output":Lcom/google/zxing/common/BitMatrix;
    const/4 v7, 0x0

    .local v7, "inputX":I
    move v8, v5

    .local v8, "outputX":I
    :goto_0
    if-ge v7, v1, :cond_1

    .line 96
    aget-boolean v9, p0, v7

    if-eqz v9, :cond_0

    .line 97
    const/4 v9, 0x0

    invoke-virtual {v6, v8, v9, v4, v3}, Lcom/google/zxing/common/BitMatrix;->setRegion(IIII)V

    .line 95
    :cond_0
    add-int/lit8 v7, v7, 0x1

    add-int/2addr v8, v4

    goto :goto_0

    .line 100
    .end local v7    # "inputX":I
    .end local v8    # "outputX":I
    :cond_1
    return-object v6
.end method


# virtual methods
.method public final encode(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;II)Lcom/google/zxing/common/BitMatrix;
    .locals 6
    .param p1, "contents"    # Ljava/lang/String;
    .param p2, "format"    # Lcom/google/zxing/BarcodeFormat;
    .param p3, "width"    # I
    .param p4, "height"    # I

    .line 38
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
    invoke-virtual/range {v0 .. v5}, Lcom/google/zxing/oned/OneDimensionalCodeWriter;->encode(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Lcom/google/zxing/common/BitMatrix;

    move-result-object p1

    return-object p1
.end method

.method public encode(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Lcom/google/zxing/common/BitMatrix;
    .locals 4
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

    .line 54
    .local p5, "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/EncodeHintType;*>;"
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3

    .line 58
    if-ltz p3, :cond_2

    if-ltz p4, :cond_2

    .line 62
    invoke-virtual {p0}, Lcom/google/zxing/oned/OneDimensionalCodeWriter;->getSupportedWriteFormats()Ljava/util/Collection;

    move-result-object v0

    const/4 v1, 0x0

    .line 63
    .local v1, "supportedFormats":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/google/zxing/BarcodeFormat;>;"
    move-object v1, v0

    if-eqz v0, :cond_0

    invoke-interface {v1, p2}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 64
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Can only encode "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", but got "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 68
    :cond_0
    invoke-virtual {p0}, Lcom/google/zxing/oned/OneDimensionalCodeWriter;->getDefaultMargin()I

    move-result v0

    .line 69
    .local v0, "sidesMargin":I
    if-eqz p5, :cond_1

    sget-object v2, Lcom/google/zxing/EncodeHintType;->MARGIN:Lcom/google/zxing/EncodeHintType;

    invoke-interface {p5, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 70
    sget-object v2, Lcom/google/zxing/EncodeHintType;->MARGIN:Lcom/google/zxing/EncodeHintType;

    invoke-interface {p5, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 73
    :cond_1
    invoke-virtual {p0, p1}, Lcom/google/zxing/oned/OneDimensionalCodeWriter;->encode(Ljava/lang/String;)[Z

    move-result-object v2

    .line 74
    invoke-static {v2, p3, p4, v0}, Lcom/google/zxing/oned/OneDimensionalCodeWriter;->renderResult([ZIII)Lcom/google/zxing/common/BitMatrix;

    move-result-object v2

    return-object v2

    .line 59
    .end local v0    # "sidesMargin":I
    .end local v1    # "supportedFormats":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/google/zxing/BarcodeFormat;>;"
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Negative size is not allowed. Input: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x78

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 55
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Found empty contents"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public abstract encode(Ljava/lang/String;)[Z
.end method

.method public getDefaultMargin()I
    .locals 1

    .line 136
    const/16 v0, 0xa

    return v0
.end method

.method protected getSupportedWriteFormats()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Lcom/google/zxing/BarcodeFormat;",
            ">;"
        }
    .end annotation

    .line 78
    const/4 v0, 0x0

    return-object v0
.end method
