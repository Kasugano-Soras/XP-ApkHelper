.class public Lcom/dsh/apkhelper/TransferActivity;
.super Landroid/app/Activity;
.source "TransferActivity.java"

# interfaces
.implements Lcom/dsh/apkhelper/HttpUploadServer$Listener;


# instance fields
.field private server:Lcom/dsh/apkhelper/HttpUploadServer;

.field private statusView:Landroid/widget/TextView;

.field private urlView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 31
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dsh/apkhelper/TransferActivity;)Landroid/widget/TextView;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/dsh/apkhelper/TransferActivity;->statusView:Landroid/widget/TextView;

    return-object p0
.end method

.method private dp(F)I
    .locals 1

    .line 129
    invoke-virtual {p0}, Lcom/dsh/apkhelper/TransferActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr p1, v0

    const/high16 v0, 0x3f000000    # 0.5f

    add-float/2addr p1, v0

    float-to-int p1, p1

    return p1
.end method

.method private localIp()Ljava/lang/String;
    .locals 5

    .line 155
    :try_start_0
    invoke-static {}, Ljava/net/NetworkInterface;->getNetworkInterfaces()Ljava/util/Enumeration;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->list(Ljava/util/Enumeration;)Ljava/util/ArrayList;

    move-result-object v0

    .line 157
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/net/NetworkInterface;

    .line 158
    invoke-virtual {v2}, Ljava/net/NetworkInterface;->isUp()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {v2}, Ljava/net/NetworkInterface;->isLoopback()Z

    move-result v3

    if-nez v3, :cond_0

    .line 159
    invoke-virtual {v2}, Ljava/net/NetworkInterface;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    const-string v4, "wlan"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    goto :goto_0

    .line 160
    :cond_1
    invoke-virtual {v2}, Ljava/net/NetworkInterface;->getInetAddresses()Ljava/util/Enumeration;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Collections;->list(Ljava/util/Enumeration;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/net/InetAddress;

    .line 161
    instance-of v4, v3, Ljava/net/Inet4Address;

    if-eqz v4, :cond_2

    invoke-virtual {v3}, Ljava/net/InetAddress;->isLoopbackAddress()Z

    move-result v4

    if-nez v4, :cond_2

    .line 162
    invoke-virtual {v3}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 164
    :cond_2
    goto :goto_1

    .line 165
    :cond_3
    goto :goto_0

    .line 166
    :cond_4
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_5
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/net/NetworkInterface;

    .line 167
    invoke-virtual {v1}, Ljava/net/NetworkInterface;->isUp()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-virtual {v1}, Ljava/net/NetworkInterface;->isLoopback()Z

    move-result v2

    if-nez v2, :cond_5

    invoke-virtual {v1}, Ljava/net/NetworkInterface;->isVirtual()Z

    move-result v2

    if-nez v2, :cond_5

    .line 168
    invoke-virtual {v1}, Ljava/net/NetworkInterface;->getName()Ljava/lang/String;

    move-result-object v2

    .line 169
    const-string v3, "rmnet"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_5

    const-string v3, "vgate"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_5

    const-string v3, "tun"

    .line 170
    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_5

    const-string v3, "dummy"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_5

    .line 171
    invoke-virtual {v1}, Ljava/net/NetworkInterface;->getInetAddresses()Ljava/util/Enumeration;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Collections;->list(Ljava/util/Enumeration;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_6
    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_9

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/net/InetAddress;

    .line 172
    instance-of v3, v2, Ljava/net/Inet4Address;

    if-eqz v3, :cond_6

    invoke-virtual {v2}, Ljava/net/InetAddress;->isLoopbackAddress()Z

    move-result v3

    if-nez v3, :cond_6

    .line 173
    invoke-virtual {v2}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v2

    .line 174
    const-string v3, "192.168."

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_8

    const-string v3, "10."

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_8

    const-string v3, "172."

    .line 175
    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v3, :cond_7

    goto :goto_4

    .line 178
    :cond_7
    goto :goto_3

    .line 176
    :cond_8
    :goto_4
    return-object v2

    .line 179
    :cond_9
    goto/16 :goto_2

    .line 181
    :cond_a
    goto :goto_5

    .line 180
    :catch_0
    move-exception v0

    .line 182
    :goto_5
    const-string v0, "127.0.0.1"

    return-object v0
.end method

.method private makeQr(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 8

    .line 134
    nop

    .line 135
    :try_start_0
    new-instance v0, Lcom/google/zxing/qrcode/QRCodeWriter;

    invoke-direct {v0}, Lcom/google/zxing/qrcode/QRCodeWriter;-><init>()V

    sget-object v1, Lcom/google/zxing/BarcodeFormat;->QR_CODE:Lcom/google/zxing/BarcodeFormat;

    .line 136
    const/16 v2, 0x1e0

    invoke-virtual {v0, p1, v1, v2, v2}, Lcom/google/zxing/qrcode/QRCodeWriter;->encode(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;II)Lcom/google/zxing/common/BitMatrix;

    move-result-object p1

    .line 137
    invoke-virtual {p1}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v3

    .line 138
    invoke-virtual {p1}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v7

    .line 139
    mul-int v0, v3, v7

    new-array v1, v0, [I

    .line 140
    const/4 v0, 0x0

    move v2, v0

    :goto_0
    if-ge v2, v7, :cond_2

    .line 141
    move v4, v0

    :goto_1
    if-ge v4, v3, :cond_1

    .line 142
    mul-int v5, v2, v3

    add-int/2addr v5, v4

    invoke-virtual {p1, v4, v2}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v6

    if-eqz v6, :cond_0

    const/high16 v6, -0x1000000

    goto :goto_2

    :cond_0
    const/4 v6, -0x1

    :goto_2
    aput v6, v1, v5

    .line 141
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 140
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 145
    :cond_2
    sget-object p1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v3, v7, p1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 146
    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v2, 0x0

    move v6, v3

    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Bitmap;->setPixels([IIIIIII)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 147
    return-object v0

    .line 148
    :catch_0
    move-exception v0

    .line 149
    const/4 p1, 0x0

    return-object p1
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 7

    .line 39
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 40
    invoke-virtual {p0}, Lcom/dsh/apkhelper/TransferActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/16 v0, 0x80

    invoke-virtual {p1, v0}, Landroid/view/Window;->addFlags(I)V

    .line 42
    new-instance p1, Landroid/widget/LinearLayout;

    invoke-direct {p1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 43
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 44
    const-string v1, "#101014"

    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 45
    const/16 v1, 0x20

    const/16 v2, 0x30

    invoke-virtual {p1, v2, v1, v2, v1}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 46
    const/16 v1, 0x10

    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 48
    new-instance v1, Landroid/widget/ImageView;

    invoke-direct {v1, p0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 49
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v4, 0x208

    invoke-direct {v3, v4, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 50
    iput v2, v3, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 51
    invoke-virtual {p1, v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 53
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 54
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 56
    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 57
    const-string v4, "\u626b\u7801\u4f20\u6587\u4ef6"

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 58
    const/high16 v4, 0x41f00000    # 30.0f

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextSize(F)V

    .line 59
    const/4 v4, -0x1

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 60
    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 62
    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lcom/dsh/apkhelper/TransferActivity;->urlView:Landroid/widget/TextView;

    .line 63
    iget-object v3, p0, Lcom/dsh/apkhelper/TransferActivity;->urlView:Landroid/widget/TextView;

    const/high16 v4, 0x41a00000    # 20.0f

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextSize(F)V

    .line 64
    iget-object v3, p0, Lcom/dsh/apkhelper/TransferActivity;->urlView:Landroid/widget/TextView;

    const-string v4, "#80CBC4"

    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 65
    iget-object v3, p0, Lcom/dsh/apkhelper/TransferActivity;->urlView:Landroid/widget/TextView;

    const/16 v4, 0x12

    invoke-virtual {v3, v0, v4, v0, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 66
    iget-object v3, p0, Lcom/dsh/apkhelper/TransferActivity;->urlView:Landroid/widget/TextView;

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 68
    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 69
    const/high16 v4, 0x41700000    # 15.0f

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextSize(F)V

    .line 70
    const-string v4, "#9AA0A6"

    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 71
    const-string v4, "1. \u624b\u673a\u8fde\u540c\u4e00\u4e2a Wi-Fi\n2. \u626b\u7801\u6253\u5f00\u7f51\u9875\n3. \u9009 APK \u4e0a\u4f20\uff0c\u6587\u4ef6\u4f1a\u5b58\u5230 Download\n4. \u56de\u5230\u4e0a\u4e00\u9875\u70b9\u5237\u65b0\uff0c\u5c31\u80fd\u76f4\u63a5\u5b89\u88c5"

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 72
    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 74
    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lcom/dsh/apkhelper/TransferActivity;->statusView:Landroid/widget/TextView;

    .line 75
    iget-object v3, p0, Lcom/dsh/apkhelper/TransferActivity;->statusView:Landroid/widget/TextView;

    const/high16 v4, 0x41800000    # 16.0f

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextSize(F)V

    .line 76
    iget-object v3, p0, Lcom/dsh/apkhelper/TransferActivity;->statusView:Landroid/widget/TextView;

    const-string v4, "#9CCC65"

    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 77
    iget-object v3, p0, Lcom/dsh/apkhelper/TransferActivity;->statusView:Landroid/widget/TextView;

    const/16 v4, 0x16

    invoke-virtual {v3, v0, v4, v0, v0}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 78
    iget-object v3, p0, Lcom/dsh/apkhelper/TransferActivity;->statusView:Landroid/widget/TextView;

    const-string v4, ""

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 79
    iget-object v3, p0, Lcom/dsh/apkhelper/TransferActivity;->statusView:Landroid/widget/TextView;

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 81
    new-instance v3, Landroid/widget/Button;

    invoke-direct {v3, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 82
    const-string v4, "\u8fd4\u56de\u9996\u9875"

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 83
    const/high16 v4, 0x41d00000    # 26.0f

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setTextSize(F)V

    .line 84
    invoke-virtual {v3, v0}, Landroid/widget/Button;->setAllCaps(Z)V

    .line 85
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    .line 86
    const/high16 v5, 0x43d20000    # 420.0f

    invoke-direct {p0, v5}, Lcom/dsh/apkhelper/TransferActivity;->dp(F)I

    move-result v5

    const/high16 v6, 0x42f00000    # 120.0f

    invoke-direct {p0, v6}, Lcom/dsh/apkhelper/TransferActivity;->dp(F)I

    move-result v6

    invoke-direct {v4, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 87
    const/high16 v5, 0x42200000    # 40.0f

    invoke-direct {p0, v5}, Lcom/dsh/apkhelper/TransferActivity;->dp(F)I

    move-result v5

    iput v5, v4, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 88
    new-instance v5, Lcom/dsh/apkhelper/TransferActivity$1;

    invoke-direct {v5, p0}, Lcom/dsh/apkhelper/TransferActivity$1;-><init>(Lcom/dsh/apkhelper/TransferActivity;)V

    invoke-virtual {v3, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 93
    invoke-virtual {v2, v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 95
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x2

    invoke-direct {v3, v4, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 98
    invoke-virtual {p0, p1}, Lcom/dsh/apkhelper/TransferActivity;->setContentView(Landroid/view/View;)V

    .line 100
    new-instance p1, Ljava/io/File;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v2

    const-string v3, "Download"

    invoke-direct {p1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 101
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {p1}, Ljava/io/File;->mkdirs()Z

    .line 103
    :cond_0
    invoke-direct {p0}, Lcom/dsh/apkhelper/TransferActivity;->localIp()Ljava/lang/String;

    move-result-object v2

    .line 105
    nop

    .line 106
    nop

    :goto_0
    const/4 v3, 0x5

    const/16 v4, 0x1f90

    if-ge v0, v3, :cond_1

    .line 108
    :try_start_0
    new-instance v3, Lcom/dsh/apkhelper/HttpUploadServer;

    add-int/2addr v4, v0

    invoke-direct {v3, p1, v4, p0}, Lcom/dsh/apkhelper/HttpUploadServer;-><init>(Ljava/io/File;ILcom/dsh/apkhelper/HttpUploadServer$Listener;)V

    iput-object v3, p0, Lcom/dsh/apkhelper/TransferActivity;->server:Lcom/dsh/apkhelper/HttpUploadServer;

    .line 109
    iget-object v3, p0, Lcom/dsh/apkhelper/TransferActivity;->server:Lcom/dsh/apkhelper/HttpUploadServer;

    invoke-virtual {v3}, Lcom/dsh/apkhelper/HttpUploadServer;->start()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 110
    nop

    .line 111
    goto :goto_1

    .line 112
    :catch_0
    move-exception v3

    .line 113
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/dsh/apkhelper/TransferActivity;->server:Lcom/dsh/apkhelper/HttpUploadServer;

    .line 106
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 117
    :cond_1
    :goto_1
    iget-object p1, p0, Lcom/dsh/apkhelper/TransferActivity;->server:Lcom/dsh/apkhelper/HttpUploadServer;

    if-nez p1, :cond_2

    .line 118
    iget-object p1, p0, Lcom/dsh/apkhelper/TransferActivity;->statusView:Landroid/widget/TextView;

    const-string v0, "\u542f\u52a8\u4e0a\u4f20\u670d\u52a1\u5931\u8d25\uff08\u7aef\u53e3\u88ab\u5360\u7528\uff1f\uff09"

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 119
    return-void

    .line 122
    :cond_2
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "http://"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, ":"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 123
    iget-object v0, p0, Lcom/dsh/apkhelper/TransferActivity;->urlView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 124
    iget-object v0, p0, Lcom/dsh/apkhelper/TransferActivity;->statusView:Landroid/widget/TextView;

    const-string v2, "\u7b49\u5f85\u4e0a\u4f20\u2026"

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 125
    invoke-direct {p0, p1}, Lcom/dsh/apkhelper/TransferActivity;->makeQr(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 126
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .line 203
    iget-object v0, p0, Lcom/dsh/apkhelper/TransferActivity;->server:Lcom/dsh/apkhelper/HttpUploadServer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/dsh/apkhelper/TransferActivity;->server:Lcom/dsh/apkhelper/HttpUploadServer;

    invoke-virtual {v0}, Lcom/dsh/apkhelper/HttpUploadServer;->stop()V

    .line 204
    :cond_0
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 205
    return-void
.end method

.method public onLog(Ljava/lang/String;)V
    .locals 1

    .line 194
    new-instance v0, Lcom/dsh/apkhelper/TransferActivity$3;

    invoke-direct {v0, p0, p1}, Lcom/dsh/apkhelper/TransferActivity$3;-><init>(Lcom/dsh/apkhelper/TransferActivity;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/dsh/apkhelper/TransferActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 199
    return-void
.end method

.method public onUploaded(Ljava/lang/String;)V
    .locals 1

    .line 186
    new-instance v0, Lcom/dsh/apkhelper/TransferActivity$2;

    invoke-direct {v0, p0, p1}, Lcom/dsh/apkhelper/TransferActivity$2;-><init>(Lcom/dsh/apkhelper/TransferActivity;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/dsh/apkhelper/TransferActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 191
    return-void
.end method
