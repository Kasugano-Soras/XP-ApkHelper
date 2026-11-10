.class public final Lcom/google/zxing/datamatrix/detector/Detector;
.super Ljava/lang/Object;
.source "Detector.java"


# instance fields
.field private final image:Lcom/google/zxing/common/BitMatrix;

.field private final rectangleDetector:Lcom/google/zxing/common/detector/WhiteRectangleDetector;


# direct methods
.method public constructor <init>(Lcom/google/zxing/common/BitMatrix;)V
    .locals 1
    .param p1, "image"    # Lcom/google/zxing/common/BitMatrix;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-object p1, p0, Lcom/google/zxing/datamatrix/detector/Detector;->image:Lcom/google/zxing/common/BitMatrix;

    .line 39
    new-instance v0, Lcom/google/zxing/common/detector/WhiteRectangleDetector;

    invoke-direct {v0, p1}, Lcom/google/zxing/common/detector/WhiteRectangleDetector;-><init>(Lcom/google/zxing/common/BitMatrix;)V

    iput-object v0, p0, Lcom/google/zxing/datamatrix/detector/Detector;->rectangleDetector:Lcom/google/zxing/common/detector/WhiteRectangleDetector;

    .line 40
    return-void
.end method

.method private correctTopRight([Lcom/google/zxing/ResultPoint;)Lcom/google/zxing/ResultPoint;
    .locals 14
    .param p1, "points"    # [Lcom/google/zxing/ResultPoint;

    .line 207
    const/4 v0, 0x0

    aget-object v0, p1, v0

    .line 208
    .local v0, "pointA":Lcom/google/zxing/ResultPoint;
    const/4 v1, 0x1

    aget-object v1, p1, v1

    .line 209
    .local v1, "pointB":Lcom/google/zxing/ResultPoint;
    const/4 v2, 0x2

    aget-object v3, p1, v2

    .line 210
    .local v3, "pointC":Lcom/google/zxing/ResultPoint;
    const/4 v4, 0x3

    aget-object v4, p1, v4

    .line 213
    .local v4, "pointD":Lcom/google/zxing/ResultPoint;
    invoke-direct {p0, v0, v4}, Lcom/google/zxing/datamatrix/detector/Detector;->transitionsBetween(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)I

    move-result v5

    .line 214
    .local v5, "trTop":I
    invoke-direct {p0, v1, v4}, Lcom/google/zxing/datamatrix/detector/Detector;->transitionsBetween(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)I

    move-result v6

    .line 215
    .local v6, "trRight":I
    add-int/lit8 v7, v6, 0x1

    shl-int/2addr v7, v2

    invoke-static {v0, v1, v7}, Lcom/google/zxing/datamatrix/detector/Detector;->shiftPoint(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;I)Lcom/google/zxing/ResultPoint;

    move-result-object v7

    .line 216
    .local v7, "pointAs":Lcom/google/zxing/ResultPoint;
    add-int/lit8 v8, v5, 0x1

    shl-int/2addr v8, v2

    invoke-static {v3, v1, v8}, Lcom/google/zxing/datamatrix/detector/Detector;->shiftPoint(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;I)Lcom/google/zxing/ResultPoint;

    move-result-object v2

    .line 218
    .local v2, "pointCs":Lcom/google/zxing/ResultPoint;
    invoke-direct {p0, v7, v4}, Lcom/google/zxing/datamatrix/detector/Detector;->transitionsBetween(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)I

    move-result v5

    .line 219
    invoke-direct {p0, v2, v4}, Lcom/google/zxing/datamatrix/detector/Detector;->transitionsBetween(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)I

    move-result v6

    .line 221
    new-instance v8, Lcom/google/zxing/ResultPoint;

    .line 222
    invoke-virtual {v4}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v9

    invoke-virtual {v3}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v10

    invoke-virtual {v1}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v11

    sub-float/2addr v10, v11

    add-int/lit8 v11, v5, 0x1

    int-to-float v11, v11

    div-float/2addr v10, v11

    add-float/2addr v9, v10

    .line 223
    invoke-virtual {v4}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v10

    invoke-virtual {v3}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v11

    invoke-virtual {v1}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v12

    sub-float/2addr v11, v12

    add-int/lit8 v12, v5, 0x1

    int-to-float v12, v12

    div-float/2addr v11, v12

    add-float/2addr v10, v11

    invoke-direct {v8, v9, v10}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    .line 224
    .local v8, "candidate1":Lcom/google/zxing/ResultPoint;
    new-instance v9, Lcom/google/zxing/ResultPoint;

    .line 225
    invoke-virtual {v4}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v10

    invoke-virtual {v0}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v11

    invoke-virtual {v1}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v12

    sub-float/2addr v11, v12

    add-int/lit8 v12, v6, 0x1

    int-to-float v12, v12

    div-float/2addr v11, v12

    add-float/2addr v10, v11

    .line 226
    invoke-virtual {v4}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v11

    invoke-virtual {v0}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v12

    invoke-virtual {v1}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v13

    sub-float/2addr v12, v13

    add-int/lit8 v13, v6, 0x1

    int-to-float v13, v13

    div-float/2addr v12, v13

    add-float/2addr v11, v12

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    .line 228
    .local v9, "candidate2":Lcom/google/zxing/ResultPoint;
    invoke-direct {p0, v8}, Lcom/google/zxing/datamatrix/detector/Detector;->isValid(Lcom/google/zxing/ResultPoint;)Z

    move-result v10

    if-nez v10, :cond_1

    .line 229
    invoke-direct {p0, v9}, Lcom/google/zxing/datamatrix/detector/Detector;->isValid(Lcom/google/zxing/ResultPoint;)Z

    move-result v10

    if-eqz v10, :cond_0

    .line 230
    return-object v9

    .line 232
    :cond_0
    const/4 v10, 0x0

    return-object v10

    .line 234
    :cond_1
    invoke-direct {p0, v9}, Lcom/google/zxing/datamatrix/detector/Detector;->isValid(Lcom/google/zxing/ResultPoint;)Z

    move-result v10

    if-nez v10, :cond_2

    .line 235
    return-object v8

    .line 238
    :cond_2
    invoke-direct {p0, v7, v8}, Lcom/google/zxing/datamatrix/detector/Detector;->transitionsBetween(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)I

    move-result v10

    invoke-direct {p0, v2, v8}, Lcom/google/zxing/datamatrix/detector/Detector;->transitionsBetween(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)I

    move-result v11

    add-int/2addr v10, v11

    .line 239
    .local v10, "sumc1":I
    invoke-direct {p0, v7, v9}, Lcom/google/zxing/datamatrix/detector/Detector;->transitionsBetween(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)I

    move-result v11

    invoke-direct {p0, v2, v9}, Lcom/google/zxing/datamatrix/detector/Detector;->transitionsBetween(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)I

    move-result v12

    add-int/2addr v11, v12

    .line 241
    .local v11, "sumc2":I
    if-le v10, v11, :cond_3

    .line 242
    return-object v8

    .line 244
    :cond_3
    return-object v9
.end method

.method private detectSolid1([Lcom/google/zxing/ResultPoint;)[Lcom/google/zxing/ResultPoint;
    .locals 14
    .param p1, "cornerPoints"    # [Lcom/google/zxing/ResultPoint;

    .line 121
    const/4 v0, 0x0

    aget-object v1, p1, v0

    .line 122
    .local v1, "pointA":Lcom/google/zxing/ResultPoint;
    const/4 v2, 0x1

    aget-object v3, p1, v2

    .line 123
    .local v3, "pointB":Lcom/google/zxing/ResultPoint;
    const/4 v4, 0x3

    aget-object v5, p1, v4

    .line 124
    .local v5, "pointC":Lcom/google/zxing/ResultPoint;
    const/4 v6, 0x2

    aget-object v7, p1, v6

    .line 126
    .local v7, "pointD":Lcom/google/zxing/ResultPoint;
    invoke-direct {p0, v1, v3}, Lcom/google/zxing/datamatrix/detector/Detector;->transitionsBetween(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)I

    move-result v8

    .line 127
    .local v8, "trAB":I
    invoke-direct {p0, v3, v5}, Lcom/google/zxing/datamatrix/detector/Detector;->transitionsBetween(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)I

    move-result v9

    .line 128
    .local v9, "trBC":I
    invoke-direct {p0, v5, v7}, Lcom/google/zxing/datamatrix/detector/Detector;->transitionsBetween(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)I

    move-result v10

    .line 129
    .local v10, "trCD":I
    invoke-direct {p0, v7, v1}, Lcom/google/zxing/datamatrix/detector/Detector;->transitionsBetween(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)I

    move-result v11

    .line 134
    .local v11, "trDA":I
    move v12, v8

    .line 135
    .local v12, "min":I
    const/4 v13, 0x4

    new-array v13, v13, [Lcom/google/zxing/ResultPoint;

    aput-object v7, v13, v0

    aput-object v1, v13, v2

    aput-object v3, v13, v6

    aput-object v5, v13, v4

    .line 136
    .local v13, "points":[Lcom/google/zxing/ResultPoint;
    if-le v8, v9, :cond_0

    .line 137
    move v12, v9

    .line 138
    aput-object v1, v13, v0

    .line 139
    aput-object v3, v13, v2

    .line 140
    aput-object v5, v13, v6

    .line 141
    aput-object v7, v13, v4

    .line 143
    :cond_0
    if-le v12, v10, :cond_1

    .line 144
    move v12, v10

    .line 145
    aput-object v3, v13, v0

    .line 146
    aput-object v5, v13, v2

    .line 147
    aput-object v7, v13, v6

    .line 148
    aput-object v1, v13, v4

    .line 150
    :cond_1
    if-le v12, v11, :cond_2

    .line 151
    aput-object v5, v13, v0

    .line 152
    aput-object v7, v13, v2

    .line 153
    aput-object v1, v13, v6

    .line 154
    aput-object v3, v13, v4

    .line 157
    :cond_2
    return-object v13
.end method

.method private detectSolid2([Lcom/google/zxing/ResultPoint;)[Lcom/google/zxing/ResultPoint;
    .locals 13
    .param p1, "points"    # [Lcom/google/zxing/ResultPoint;

    .line 167
    const/4 v0, 0x0

    aget-object v1, p1, v0

    .line 168
    .local v1, "pointA":Lcom/google/zxing/ResultPoint;
    const/4 v2, 0x1

    aget-object v3, p1, v2

    .line 169
    .local v3, "pointB":Lcom/google/zxing/ResultPoint;
    const/4 v4, 0x2

    aget-object v5, p1, v4

    .line 170
    .local v5, "pointC":Lcom/google/zxing/ResultPoint;
    const/4 v6, 0x3

    aget-object v7, p1, v6

    .line 174
    .local v7, "pointD":Lcom/google/zxing/ResultPoint;
    invoke-direct {p0, v1, v7}, Lcom/google/zxing/datamatrix/detector/Detector;->transitionsBetween(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)I

    move-result v8

    .line 175
    .local v8, "tr":I
    add-int/lit8 v9, v8, 0x1

    shl-int/2addr v9, v4

    invoke-static {v3, v5, v9}, Lcom/google/zxing/datamatrix/detector/Detector;->shiftPoint(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;I)Lcom/google/zxing/ResultPoint;

    move-result-object v9

    .line 176
    .local v9, "pointBs":Lcom/google/zxing/ResultPoint;
    add-int/lit8 v10, v8, 0x1

    shl-int/2addr v10, v4

    invoke-static {v5, v3, v10}, Lcom/google/zxing/datamatrix/detector/Detector;->shiftPoint(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;I)Lcom/google/zxing/ResultPoint;

    move-result-object v10

    .line 177
    .local v10, "pointCs":Lcom/google/zxing/ResultPoint;
    invoke-direct {p0, v9, v1}, Lcom/google/zxing/datamatrix/detector/Detector;->transitionsBetween(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)I

    move-result v11

    .line 178
    .local v11, "trBA":I
    invoke-direct {p0, v10, v7}, Lcom/google/zxing/datamatrix/detector/Detector;->transitionsBetween(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)I

    move-result v12

    .line 183
    .local v12, "trCD":I
    if-ge v11, v12, :cond_0

    .line 185
    aput-object v1, p1, v0

    .line 186
    aput-object v3, p1, v2

    .line 187
    aput-object v5, p1, v4

    .line 188
    aput-object v7, p1, v6

    goto :goto_0

    .line 191
    :cond_0
    aput-object v3, p1, v0

    .line 192
    aput-object v5, p1, v2

    .line 193
    aput-object v7, p1, v4

    .line 194
    aput-object v1, p1, v6

    .line 197
    :goto_0
    return-object p1
.end method

.method private isValid(Lcom/google/zxing/ResultPoint;)Z
    .locals 3
    .param p1, "p"    # Lcom/google/zxing/ResultPoint;

    .line 304
    invoke-virtual {p1}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v0

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-ltz v0, :cond_0

    invoke-virtual {p1}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v0

    iget-object v2, p0, Lcom/google/zxing/datamatrix/detector/Detector;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v2}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v2

    int-to-float v2, v2

    cmpg-float v0, v0, v2

    if-gez v0, :cond_0

    invoke-virtual {p1}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    invoke-virtual {p1}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v0

    iget-object v1, p0, Lcom/google/zxing/datamatrix/detector/Detector;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v1}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v1

    int-to-float v1, v1

    cmpg-float v0, v0, v1

    if-gez v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method private static moveAway(Lcom/google/zxing/ResultPoint;FF)Lcom/google/zxing/ResultPoint;
    .locals 4
    .param p0, "point"    # Lcom/google/zxing/ResultPoint;
    .param p1, "fromX"    # F
    .param p2, "fromY"    # F

    .line 97
    invoke-virtual {p0}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v0

    .line 98
    .local v0, "x":F
    invoke-virtual {p0}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v1

    .line 100
    .local v1, "y":F
    cmpg-float v2, v0, p1

    const/high16 v3, 0x3f800000    # 1.0f

    if-gez v2, :cond_0

    .line 101
    sub-float/2addr v0, v3

    goto :goto_0

    .line 103
    :cond_0
    add-float/2addr v0, v3

    .line 106
    :goto_0
    cmpg-float v2, v1, p2

    if-gez v2, :cond_1

    .line 107
    sub-float/2addr v1, v3

    goto :goto_1

    .line 109
    :cond_1
    add-float/2addr v1, v3

    .line 112
    :goto_1
    new-instance v2, Lcom/google/zxing/ResultPoint;

    invoke-direct {v2, v0, v1}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    return-object v2
.end method

.method private static sampleGrid(Lcom/google/zxing/common/BitMatrix;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;II)Lcom/google/zxing/common/BitMatrix;
    .locals 21
    .param p0, "image"    # Lcom/google/zxing/common/BitMatrix;
    .param p1, "topLeft"    # Lcom/google/zxing/ResultPoint;
    .param p2, "bottomLeft"    # Lcom/google/zxing/ResultPoint;
    .param p3, "bottomRight"    # Lcom/google/zxing/ResultPoint;
    .param p4, "topRight"    # Lcom/google/zxing/ResultPoint;
    .param p5, "dimensionX"    # I
    .param p6, "dimensionY"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 315
    move/from16 v3, p5

    move/from16 v4, p6

    invoke-static {}, Lcom/google/zxing/common/GridSampler;->getInstance()Lcom/google/zxing/common/GridSampler;

    move-result-object v1

    .line 317
    int-to-float v0, v3

    const/high16 v2, 0x3f000000    # 0.5f

    sub-float v7, v0, v2

    int-to-float v0, v3

    sub-float v9, v0, v2

    int-to-float v0, v4

    sub-float v10, v0, v2

    int-to-float v0, v4

    sub-float v12, v0, v2

    .line 328
    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v13

    .line 329
    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v14

    .line 330
    invoke-virtual/range {p4 .. p4}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v15

    .line 331
    invoke-virtual/range {p4 .. p4}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v16

    .line 332
    invoke-virtual/range {p3 .. p3}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v17

    .line 333
    invoke-virtual/range {p3 .. p3}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v18

    .line 334
    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v19

    .line 335
    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v20

    .line 317
    const/high16 v5, 0x3f000000    # 0.5f

    const/high16 v6, 0x3f000000    # 0.5f

    const/high16 v8, 0x3f000000    # 0.5f

    const/high16 v11, 0x3f000000    # 0.5f

    move-object/from16 v2, p0

    invoke-virtual/range {v1 .. v20}, Lcom/google/zxing/common/GridSampler;->sampleGrid(Lcom/google/zxing/common/BitMatrix;IIFFFFFFFFFFFFFFFF)Lcom/google/zxing/common/BitMatrix;

    move-result-object v0

    return-object v0
.end method

.method private static shiftPoint(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;I)Lcom/google/zxing/ResultPoint;
    .locals 5
    .param p0, "point"    # Lcom/google/zxing/ResultPoint;
    .param p1, "to"    # Lcom/google/zxing/ResultPoint;
    .param p2, "div"    # I

    .line 91
    invoke-virtual {p1}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v0

    invoke-virtual {p0}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v1

    sub-float/2addr v0, v1

    add-int/lit8 v1, p2, 0x1

    int-to-float v1, v1

    div-float/2addr v0, v1

    .line 92
    .local v0, "x":F
    invoke-virtual {p1}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v1

    invoke-virtual {p0}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v2

    sub-float/2addr v1, v2

    add-int/lit8 v2, p2, 0x1

    int-to-float v2, v2

    div-float/2addr v1, v2

    .line 93
    .local v1, "y":F
    new-instance v2, Lcom/google/zxing/ResultPoint;

    invoke-virtual {p0}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v3

    add-float/2addr v3, v0

    invoke-virtual {p0}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v4

    add-float/2addr v4, v1

    invoke-direct {v2, v3, v4}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    return-object v2
.end method

.method private shiftToModuleCenter([Lcom/google/zxing/ResultPoint;)[Lcom/google/zxing/ResultPoint;
    .locals 19
    .param p1, "points"    # [Lcom/google/zxing/ResultPoint;

    .line 255
    move-object/from16 v0, p0

    const/4 v1, 0x0

    aget-object v2, p1, v1

    .line 256
    .local v2, "pointA":Lcom/google/zxing/ResultPoint;
    const/4 v3, 0x1

    aget-object v4, p1, v3

    .line 257
    .local v4, "pointB":Lcom/google/zxing/ResultPoint;
    const/4 v5, 0x2

    aget-object v6, p1, v5

    .line 258
    .local v6, "pointC":Lcom/google/zxing/ResultPoint;
    const/4 v7, 0x3

    aget-object v8, p1, v7

    .line 261
    .local v8, "pointD":Lcom/google/zxing/ResultPoint;
    invoke-direct {v0, v2, v8}, Lcom/google/zxing/datamatrix/detector/Detector;->transitionsBetween(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)I

    move-result v9

    add-int/2addr v9, v3

    .line 262
    .local v9, "dimH":I
    invoke-direct {v0, v6, v8}, Lcom/google/zxing/datamatrix/detector/Detector;->transitionsBetween(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)I

    move-result v10

    add-int/2addr v10, v3

    .line 265
    .local v10, "dimV":I
    shl-int/lit8 v11, v10, 0x2

    invoke-static {v2, v4, v11}, Lcom/google/zxing/datamatrix/detector/Detector;->shiftPoint(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;I)Lcom/google/zxing/ResultPoint;

    move-result-object v11

    .line 266
    .local v11, "pointAs":Lcom/google/zxing/ResultPoint;
    shl-int/lit8 v12, v9, 0x2

    invoke-static {v6, v4, v12}, Lcom/google/zxing/datamatrix/detector/Detector;->shiftPoint(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;I)Lcom/google/zxing/ResultPoint;

    move-result-object v12

    .line 269
    .local v12, "pointCs":Lcom/google/zxing/ResultPoint;
    invoke-direct {v0, v11, v8}, Lcom/google/zxing/datamatrix/detector/Detector;->transitionsBetween(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)I

    move-result v13

    add-int/2addr v13, v3

    .line 270
    .end local v9    # "dimH":I
    .local v13, "dimH":I
    invoke-direct {v0, v12, v8}, Lcom/google/zxing/datamatrix/detector/Detector;->transitionsBetween(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)I

    move-result v9

    add-int/2addr v9, v3

    .line 271
    .end local v10    # "dimV":I
    .local v9, "dimV":I
    and-int/lit8 v10, v13, 0x1

    if-ne v10, v3, :cond_0

    .line 272
    add-int/lit8 v13, v13, 0x1

    .line 274
    :cond_0
    and-int/lit8 v10, v9, 0x1

    if-ne v10, v3, :cond_1

    .line 275
    add-int/lit8 v9, v9, 0x1

    .line 280
    :cond_1
    invoke-virtual {v2}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v10

    invoke-virtual {v4}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v14

    add-float/2addr v10, v14

    invoke-virtual {v6}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v14

    add-float/2addr v10, v14

    invoke-virtual {v8}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v14

    add-float/2addr v10, v14

    const/high16 v14, 0x40800000    # 4.0f

    div-float/2addr v10, v14

    .line 281
    .local v10, "centerX":F
    invoke-virtual {v2}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v15

    invoke-virtual {v4}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v16

    add-float v15, v15, v16

    invoke-virtual {v6}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v16

    add-float v15, v15, v16

    invoke-virtual {v8}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v16

    add-float v15, v15, v16

    div-float/2addr v15, v14

    .line 282
    .local v15, "centerY":F
    invoke-static {v2, v10, v15}, Lcom/google/zxing/datamatrix/detector/Detector;->moveAway(Lcom/google/zxing/ResultPoint;FF)Lcom/google/zxing/ResultPoint;

    move-result-object v2

    .line 283
    invoke-static {v4, v10, v15}, Lcom/google/zxing/datamatrix/detector/Detector;->moveAway(Lcom/google/zxing/ResultPoint;FF)Lcom/google/zxing/ResultPoint;

    move-result-object v4

    .line 284
    invoke-static {v6, v10, v15}, Lcom/google/zxing/datamatrix/detector/Detector;->moveAway(Lcom/google/zxing/ResultPoint;FF)Lcom/google/zxing/ResultPoint;

    move-result-object v6

    .line 285
    invoke-static {v8, v10, v15}, Lcom/google/zxing/datamatrix/detector/Detector;->moveAway(Lcom/google/zxing/ResultPoint;FF)Lcom/google/zxing/ResultPoint;

    move-result-object v8

    .line 291
    shl-int/lit8 v14, v9, 0x2

    invoke-static {v2, v4, v14}, Lcom/google/zxing/datamatrix/detector/Detector;->shiftPoint(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;I)Lcom/google/zxing/ResultPoint;

    move-result-object v14

    .line 292
    move/from16 v16, v1

    shl-int/lit8 v1, v13, 0x2

    invoke-static {v14, v8, v1}, Lcom/google/zxing/datamatrix/detector/Detector;->shiftPoint(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;I)Lcom/google/zxing/ResultPoint;

    move-result-object v1

    .line 293
    .end local v11    # "pointAs":Lcom/google/zxing/ResultPoint;
    .local v1, "pointAs":Lcom/google/zxing/ResultPoint;
    shl-int/lit8 v11, v9, 0x2

    invoke-static {v4, v2, v11}, Lcom/google/zxing/datamatrix/detector/Detector;->shiftPoint(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;I)Lcom/google/zxing/ResultPoint;

    move-result-object v11

    const/4 v14, 0x0

    move-object/from16 v17, v14

    .line 294
    .local v17, "pointBs":Lcom/google/zxing/ResultPoint;
    move/from16 v18, v3

    shl-int/lit8 v3, v13, 0x2

    invoke-static {v11, v6, v3}, Lcom/google/zxing/datamatrix/detector/Detector;->shiftPoint(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;I)Lcom/google/zxing/ResultPoint;

    move-result-object v3

    .line 295
    .end local v17    # "pointBs":Lcom/google/zxing/ResultPoint;
    .local v3, "pointBs":Lcom/google/zxing/ResultPoint;
    shl-int/lit8 v11, v9, 0x2

    invoke-static {v6, v8, v11}, Lcom/google/zxing/datamatrix/detector/Detector;->shiftPoint(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;I)Lcom/google/zxing/ResultPoint;

    move-result-object v11

    .line 296
    move/from16 v17, v5

    shl-int/lit8 v5, v13, 0x2

    invoke-static {v11, v4, v5}, Lcom/google/zxing/datamatrix/detector/Detector;->shiftPoint(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;I)Lcom/google/zxing/ResultPoint;

    move-result-object v5

    .line 297
    .end local v12    # "pointCs":Lcom/google/zxing/ResultPoint;
    .local v5, "pointCs":Lcom/google/zxing/ResultPoint;
    shl-int/lit8 v11, v9, 0x2

    invoke-static {v8, v6, v11}, Lcom/google/zxing/datamatrix/detector/Detector;->shiftPoint(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;I)Lcom/google/zxing/ResultPoint;

    move-result-object v11

    .line 298
    .local v14, "pointDs":Lcom/google/zxing/ResultPoint;
    shl-int/lit8 v12, v13, 0x2

    invoke-static {v11, v2, v12}, Lcom/google/zxing/datamatrix/detector/Detector;->shiftPoint(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;I)Lcom/google/zxing/ResultPoint;

    move-result-object v11

    .line 300
    .end local v14    # "pointDs":Lcom/google/zxing/ResultPoint;
    .local v11, "pointDs":Lcom/google/zxing/ResultPoint;
    const/4 v12, 0x4

    new-array v12, v12, [Lcom/google/zxing/ResultPoint;

    aput-object v1, v12, v16

    aput-object v3, v12, v18

    aput-object v5, v12, v17

    aput-object v11, v12, v7

    return-object v12
.end method

.method private transitionsBetween(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)I
    .locals 18
    .param p1, "from"    # Lcom/google/zxing/ResultPoint;
    .param p2, "to"    # Lcom/google/zxing/ResultPoint;

    .line 343
    move-object/from16 v0, p0

    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v1

    float-to-int v1, v1

    .line 344
    .local v1, "fromX":I
    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v2

    float-to-int v2, v2

    .line 345
    .local v2, "fromY":I
    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v3

    float-to-int v3, v3

    .line 346
    .local v3, "toX":I
    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v4

    float-to-int v4, v4

    const/4 v5, 0x0

    move v6, v5

    .line 347
    .local v6, "toY":I
    move v6, v4

    sub-int/2addr v4, v2

    invoke-static {v4}, Ljava/lang/Math;->abs(I)I

    move-result v4

    sub-int v7, v3, v1

    invoke-static {v7}, Ljava/lang/Math;->abs(I)I

    move-result v7

    const/4 v8, 0x1

    if-le v4, v7, :cond_0

    move v4, v8

    goto :goto_0

    :cond_0
    const/4 v4, 0x0

    :goto_0
    move v7, v5

    .line 348
    .local v7, "steep":Z
    move v7, v4

    if-eqz v4, :cond_1

    .line 349
    move v4, v1

    .line 350
    .local v4, "temp":I
    move v1, v2

    .line 351
    move v2, v4

    .line 352
    move v4, v3

    .line 353
    move v3, v6

    .line 354
    move v6, v4

    .line 357
    .end local v4    # "temp":I
    :cond_1
    sub-int v4, v3, v1

    invoke-static {v4}, Ljava/lang/Math;->abs(I)I

    move-result v4

    .line 358
    .local v4, "dx":I
    sub-int v9, v6, v2

    invoke-static {v9}, Ljava/lang/Math;->abs(I)I

    move-result v9

    .line 359
    .local v9, "dy":I
    neg-int v10, v4

    div-int/lit8 v10, v10, 0x2

    .line 360
    .local v10, "error":I
    const/4 v11, -0x1

    if-ge v2, v6, :cond_2

    move v12, v8

    goto :goto_1

    :cond_2
    move v12, v11

    .line 361
    .local v12, "ystep":I
    :goto_1
    if-lt v1, v3, :cond_3

    move v8, v11

    .line 362
    .local v8, "xstep":I
    :cond_3
    const/4 v11, 0x0

    .line 363
    .local v11, "transitions":I
    iget-object v13, v0, Lcom/google/zxing/datamatrix/detector/Detector;->image:Lcom/google/zxing/common/BitMatrix;

    if-eqz v7, :cond_4

    move v14, v2

    goto :goto_2

    :cond_4
    move v14, v1

    :goto_2
    if-eqz v7, :cond_5

    move v15, v1

    goto :goto_3

    :cond_5
    move v15, v2

    :goto_3
    invoke-virtual {v13, v14, v15}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v13

    .line 364
    .local v13, "inBlack":Z
    move v14, v1

    .local v14, "x":I
    move v15, v2

    .local v15, "y":I
    :goto_4
    if-eq v14, v3, :cond_a

    .line 365
    move/from16 v16, v1

    .end local v1    # "fromX":I
    .local v16, "fromX":I
    iget-object v1, v0, Lcom/google/zxing/datamatrix/detector/Detector;->image:Lcom/google/zxing/common/BitMatrix;

    if-eqz v7, :cond_6

    move v0, v15

    goto :goto_5

    :cond_6
    move v0, v14

    :goto_5
    move/from16 v17, v2

    if-eqz v7, :cond_7

    move v2, v14

    goto :goto_6

    :cond_7
    move v2, v15

    .end local v2    # "fromY":I
    .local v17, "fromY":I
    :goto_6
    invoke-virtual {v1, v0, v2}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v0

    .line 366
    .local v5, "isBlack":Z
    move v5, v0

    if-eq v0, v13, :cond_8

    .line 367
    add-int/lit8 v11, v11, 0x1

    .line 368
    move v0, v5

    move v13, v0

    .line 370
    :cond_8
    add-int v0, v10, v9

    .line 371
    move v10, v0

    if-lez v0, :cond_9

    .line 372
    if-eq v15, v6, :cond_b

    .line 375
    add-int/2addr v15, v12

    .line 376
    sub-int/2addr v10, v4

    .line 364
    .end local v5    # "isBlack":Z
    :cond_9
    add-int/2addr v14, v8

    move-object/from16 v0, p0

    move/from16 v1, v16

    move/from16 v2, v17

    goto :goto_4

    .end local v16    # "fromX":I
    .end local v17    # "fromY":I
    .restart local v1    # "fromX":I
    .restart local v2    # "fromY":I
    :cond_a
    move/from16 v16, v1

    move/from16 v17, v2

    .line 379
    .end local v1    # "fromX":I
    .end local v2    # "fromY":I
    .end local v14    # "x":I
    .end local v15    # "y":I
    .restart local v16    # "fromX":I
    .restart local v17    # "fromY":I
    :cond_b
    return v11
.end method


# virtual methods
.method public detect()Lcom/google/zxing/common/DetectorResult;
    .locals 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 50
    iget-object v0, p0, Lcom/google/zxing/datamatrix/detector/Detector;->rectangleDetector:Lcom/google/zxing/common/detector/WhiteRectangleDetector;

    invoke-virtual {v0}, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->detect()[Lcom/google/zxing/ResultPoint;

    move-result-object v0

    .line 52
    .local v0, "cornerPoints":[Lcom/google/zxing/ResultPoint;
    invoke-direct {p0, v0}, Lcom/google/zxing/datamatrix/detector/Detector;->detectSolid1([Lcom/google/zxing/ResultPoint;)[Lcom/google/zxing/ResultPoint;

    move-result-object v1

    .line 53
    .local v1, "points":[Lcom/google/zxing/ResultPoint;
    invoke-direct {p0, v1}, Lcom/google/zxing/datamatrix/detector/Detector;->detectSolid2([Lcom/google/zxing/ResultPoint;)[Lcom/google/zxing/ResultPoint;

    move-result-object v2

    .line 54
    move-object v1, v2

    invoke-direct {p0, v1}, Lcom/google/zxing/datamatrix/detector/Detector;->correctTopRight([Lcom/google/zxing/ResultPoint;)Lcom/google/zxing/ResultPoint;

    move-result-object v3

    const/4 v4, 0x3

    aput-object v3, v2, v4

    .line 55
    aget-object v2, v1, v4

    if-eqz v2, :cond_3

    .line 58
    invoke-direct {p0, v1}, Lcom/google/zxing/datamatrix/detector/Detector;->shiftToModuleCenter([Lcom/google/zxing/ResultPoint;)[Lcom/google/zxing/ResultPoint;

    move-result-object v2

    .line 60
    move-object v1, v2

    const/4 v3, 0x0

    aget-object v6, v2, v3

    .line 61
    .local v6, "topLeft":Lcom/google/zxing/ResultPoint;
    const/4 v2, 0x1

    aget-object v7, v1, v2

    .line 62
    .local v7, "bottomLeft":Lcom/google/zxing/ResultPoint;
    const/4 v12, 0x2

    aget-object v8, v1, v12

    .line 63
    .local v8, "bottomRight":Lcom/google/zxing/ResultPoint;
    aget-object v9, v1, v4

    .line 65
    .local v9, "topRight":Lcom/google/zxing/ResultPoint;
    invoke-direct {p0, v6, v9}, Lcom/google/zxing/datamatrix/detector/Detector;->transitionsBetween(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)I

    move-result v5

    add-int/2addr v5, v2

    .line 66
    .local v5, "dimensionTop":I
    invoke-direct {p0, v8, v9}, Lcom/google/zxing/datamatrix/detector/Detector;->transitionsBetween(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)I

    move-result v10

    add-int/2addr v10, v2

    .line 67
    .local v10, "dimensionRight":I
    and-int/lit8 v11, v5, 0x1

    if-ne v11, v2, :cond_0

    .line 68
    add-int/lit8 v5, v5, 0x1

    .line 70
    :cond_0
    and-int/lit8 v11, v10, 0x1

    if-ne v11, v2, :cond_1

    .line 71
    add-int/lit8 v10, v10, 0x1

    .line 74
    :cond_1
    mul-int/lit8 v11, v5, 0x4

    mul-int/lit8 v13, v10, 0x7

    if-ge v11, v13, :cond_2

    mul-int/lit8 v11, v10, 0x4

    mul-int/lit8 v13, v5, 0x7

    if-ge v11, v13, :cond_2

    .line 76
    invoke-static {v5, v10}, Ljava/lang/Math;->max(II)I

    move-result v11

    move v10, v11

    move v5, v11

    move v10, v5

    goto :goto_0

    .line 79
    :cond_2
    move v11, v10

    move v10, v5

    .end local v5    # "dimensionTop":I
    .local v10, "dimensionTop":I
    .local v11, "dimensionRight":I
    :goto_0
    iget-object v5, p0, Lcom/google/zxing/datamatrix/detector/Detector;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-static/range {v5 .. v11}, Lcom/google/zxing/datamatrix/detector/Detector;->sampleGrid(Lcom/google/zxing/common/BitMatrix;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;II)Lcom/google/zxing/common/BitMatrix;

    move-result-object v5

    .line 87
    .local v5, "bits":Lcom/google/zxing/common/BitMatrix;
    new-instance v13, Lcom/google/zxing/common/DetectorResult;

    const/4 v14, 0x4

    new-array v14, v14, [Lcom/google/zxing/ResultPoint;

    aput-object v6, v14, v3

    aput-object v7, v14, v2

    aput-object v8, v14, v12

    aput-object v9, v14, v4

    invoke-direct {v13, v5, v14}, Lcom/google/zxing/common/DetectorResult;-><init>(Lcom/google/zxing/common/BitMatrix;[Lcom/google/zxing/ResultPoint;)V

    return-object v13

    .line 56
    .end local v5    # "bits":Lcom/google/zxing/common/BitMatrix;
    .end local v6    # "topLeft":Lcom/google/zxing/ResultPoint;
    .end local v7    # "bottomLeft":Lcom/google/zxing/ResultPoint;
    .end local v8    # "bottomRight":Lcom/google/zxing/ResultPoint;
    .end local v9    # "topRight":Lcom/google/zxing/ResultPoint;
    .end local v10    # "dimensionTop":I
    .end local v11    # "dimensionRight":I
    :cond_3
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v2

    throw v2
.end method
