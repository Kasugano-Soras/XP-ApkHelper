.class public Lcom/dsh/apkhelper/MainActivity;
.super Landroid/app/Activity;
.source "MainActivity.java"


# static fields
.field private static final C_BG:I = -0xf1f1ee

.field private static final C_BTN:I = -0xd5d5ca

.field private static final C_CARD:I = -0xe2e2da

.field private static final C_GREEN:I = -0xd182ce

.field private static final C_RED:I = -0x10acb0

.field private static final C_SUB:I = -0x716d67

.field private static final C_TEXT:I = -0x1

.field private static final SCAN_DIRS:[Ljava/lang/String;


# instance fields
.field private listBox:Landroid/widget/LinearLayout;

.field private shown:Ljava/util/Set;

.field private statusText:Landroid/widget/TextView;

.field private static sMerging:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 31
    const-string v0, "/storage/emulated/0/Download"

    const-string v1, "/sdcard"

    const-string v2, "/sdcard/Download"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/dsh/apkhelper/MainActivity;->SCAN_DIRS:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 29
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dsh/apkhelper/MainActivity;)V
    .locals 0

    .line 29
    invoke-direct {p0}, Lcom/dsh/apkhelper/MainActivity;->load()V

    return-void
.end method

.method static synthetic access$100(Lcom/dsh/apkhelper/MainActivity;Ljava/io/File;)V
    .locals 0

    .line 29
    invoke-direct {p0, p1}, Lcom/dsh/apkhelper/MainActivity;->install(Ljava/io/File;)V

    return-void
.end method

.method static synthetic access$200(Lcom/dsh/apkhelper/MainActivity;Ljava/io/File;)V
    .locals 0

    .line 29
    invoke-direct {p0, p1}, Lcom/dsh/apkhelper/MainActivity;->confirmDelete(Ljava/io/File;)V

    return-void
.end method

.method static synthetic access$300(Lcom/dsh/apkhelper/MainActivity;)Landroid/widget/TextView;
    .locals 0

    .line 29
    iget-object p0, p0, Lcom/dsh/apkhelper/MainActivity;->statusText:Landroid/widget/TextView;

    return-object p0
.end method

.method private confirmDelete(Ljava/io/File;)V
    .locals 3

    .line 234
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 235
    const-string v1, "\u5220\u9664\u5b89\u88c5\u5305"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 236
    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n\n\u5220\u6389\u540e\u6587\u4ef6\u5c31\u6ca1\u4e86\uff0c\u786e\u5b9a\uff1f"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lcom/dsh/apkhelper/MainActivity$7;

    invoke-direct {v1, p0, p1}, Lcom/dsh/apkhelper/MainActivity$7;-><init>(Lcom/dsh/apkhelper/MainActivity;Ljava/io/File;)V

    .line 237
    const-string p1, "\u5220\u9664"

    invoke-virtual {v0, p1, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    .line 246
    const-string v0, "\u53d6\u6d88"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    .line 247
    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 248
    return-void
.end method

.method private dp(I)I
    .locals 1

    .line 275
    int-to-float p1, p1

    invoke-virtual {p0}, Lcom/dsh/apkhelper/MainActivity;->getResources()Landroid/content/res/Resources;

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

.method private install(Ljava/io/File;)V
    .locals 2

    .line 251
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p1

    .line 252
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "am start -n com.android.packageinstaller/.PackageInstallerActivity -d file://"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " -t application/vnd.android.package-archive"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 255
    iget-object v0, p0, Lcom/dsh/apkhelper/MainActivity;->statusText:Landroid/widget/TextView;

    const-string v1, "\u6b63\u5728\u8c03\u8d77\u7cfb\u7edf\u5b89\u88c5\u5668\u2026"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 256
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/dsh/apkhelper/MainActivity$8;

    invoke-direct {v1, p0, p1}, Lcom/dsh/apkhelper/MainActivity$8;-><init>(Lcom/dsh/apkhelper/MainActivity;Ljava/lang/String;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 271
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 272
    return-void
.end method

.method private load()V
    .locals 9

    .line 123
    iget-object v0, p0, Lcom/dsh/apkhelper/MainActivity;->listBox:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 124
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/dsh/apkhelper/MainActivity;->shown:Ljava/util/Set;

    .line 125
    nop

    .line 127
    const/4 v1, 0x0

    move v2, v1

    move v3, v2

    :goto_0
    sget-object v4, Lcom/dsh/apkhelper/MainActivity;->SCAN_DIRS:[Ljava/lang/String;

    array-length v4, v4

    if-ge v2, v4, :cond_5

    .line 128
    new-instance v4, Ljava/io/File;

    sget-object v5, Lcom/dsh/apkhelper/MainActivity;->SCAN_DIRS:[Ljava/lang/String;

    aget-object v5, v5, v2

    invoke-direct {v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 129
    invoke-virtual {v4}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v4

    .line 130
    if-nez v4, :cond_0

    goto :goto_4

    .line 131
    :cond_0
    new-instance v5, Lcom/dsh/apkhelper/MainActivity$4;

    invoke-direct {v5, p0}, Lcom/dsh/apkhelper/MainActivity$4;-><init>(Lcom/dsh/apkhelper/MainActivity;)V

    invoke-static {v4, v5}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 136
    move v5, v1

    :goto_1
    array-length v6, v4

    if-ge v5, v6, :cond_4

    .line 137
    aget-object v6, v4, v5

    .line 138
    invoke-virtual {v6}, Ljava/io/File;->isFile()Z

    move-result v7

    if-nez v7, :cond_1

    goto :goto_3

    .line 139
    :cond_1
    invoke-virtual {v6}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v7

    const-string v8, ".apk"

    invoke-virtual {v7, v8}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_2

    goto :goto_3

    .line 142
    :cond_2
    :try_start_0
    invoke-virtual {v6}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v7
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 145
    goto :goto_2

    .line 143
    :catch_0
    move-exception v7

    .line 144
    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    .line 146
    :goto_2
    invoke-interface {v0, v7}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_3

    goto :goto_3

    .line 147
    :cond_3
    add-int/lit8 v3, v3, 0x1

    .line 148
    iget-object v7, p0, Lcom/dsh/apkhelper/MainActivity;->listBox:Landroid/widget/LinearLayout;

    invoke-direct {p0, v6}, Lcom/dsh/apkhelper/MainActivity;->makeRow(Ljava/io/File;)Landroid/view/View;

    move-result-object v6

    invoke-virtual {v7, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 136
    :goto_3
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 127
    :cond_4
    :goto_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 152
    :cond_5
    if-nez v3, :cond_6

    .line 153
    iget-object v0, p0, Lcom/dsh/apkhelper/MainActivity;->statusText:Landroid/widget/TextView;

    const-string v1, "\u6ca1\u627e\u5230 APK\u3002\u53ef\u4ee5\u70b9\u201c\u626b\u7801\u4f20\u6587\u4ef6\u201d\u4ece\u624b\u673a\u4f20\u4e00\u4e2a\u4e0a\u6765\u3002"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_5

    .line 155
    :cond_6
    iget-object v0, p0, Lcom/dsh/apkhelper/MainActivity;->statusText:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u5171 "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " \u4e2a\u5b89\u88c5\u5305"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 157
    :goto_5
    invoke-direct {p0}, Lcom/dsh/apkhelper/MainActivity;->mergeAdb()V

    return-void
.end method

.method private mergeAdb()V
    .locals 3

    sget-boolean v0, Lcom/dsh/apkhelper/MainActivity;->sMerging:Z

    if-nez v0, :done

    const/4 v0, 0x1

    sput-boolean v0, Lcom/dsh/apkhelper/MainActivity;->sMerging:Z

    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/dsh/apkhelper/MainActivity$9;

    invoke-direct {v1, p0}, Lcom/dsh/apkhelper/MainActivity$9;-><init>(Lcom/dsh/apkhelper/MainActivity;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    :done
    return-void
.end method

.method public addAdbListing(Ljava/lang/String;)V
    .locals 12

    const/4 v0, 0x0

    sput-boolean v0, Lcom/dsh/apkhelper/MainActivity;->sMerging:Z

    if-eqz p1, :done

    const-string v0, "ERR"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :done

    const-string v0, "\n"

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :loop
    array-length v3, v0

    if-ge v1, v3, :count

    aget-object v3, v0, v1

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v4

    const-string v5, ".apk"

    invoke-virtual {v4, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :next

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "/sdcard/Download/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    new-instance v9, Ljava/io/File;

    invoke-direct {v9, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    :try_start_1
    invoke-virtual {v9}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v10
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :can_ok

    :catch_1
    move-exception v10

    move-object v10, v5

    :can_ok
    iget-object v6, p0, Lcom/dsh/apkhelper/MainActivity;->shown:Ljava/util/Set;

    if-eqz v6, :nodup

    invoke-interface {v6, v10}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :next

    invoke-interface {v6, v10}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    :nodup
    iget-object v8, p0, Lcom/dsh/apkhelper/MainActivity;->listBox:Landroid/widget/LinearLayout;

    if-eqz v8, :next

    new-instance v9, Ljava/io/File;

    invoke-direct {v9, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v9}, Lcom/dsh/apkhelper/MainActivity;->makeRow(Ljava/io/File;)Landroid/view/View;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :next
    add-int/lit8 v1, v1, 0x1

    goto :loop

    :count
    iget-object v0, p0, Lcom/dsh/apkhelper/MainActivity;->listBox:Landroid/widget/LinearLayout;

    if-eqz v0, :done

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    if-lez v0, :done

    iget-object v1, p0, Lcom/dsh/apkhelper/MainActivity;->statusText:Landroid/widget/TextView;

    if-eqz v1, :done

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u5171 "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " \u4e2a\u5b89\u88c5\u5305"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :done
    return-void
.end method

.method private makeButton(Ljava/lang/String;III)Landroid/widget/Button;
    .locals 2

    .line 214
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 215
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 216
    const/4 p1, 0x0

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setAllCaps(Z)V

    .line 217
    const/4 v1, 0x2

    int-to-float p4, p4

    invoke-virtual {v0, v1, p4}, Landroid/widget/Button;->setTextSize(IF)V

    .line 218
    invoke-virtual {v0, p3}, Landroid/widget/Button;->setTextColor(I)V

    .line 219
    const/16 p3, 0xe

    invoke-direct {p0, p2, p3}, Lcom/dsh/apkhelper/MainActivity;->round(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p2

    invoke-virtual {v0, p2}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 220
    invoke-virtual {v0, p1, p1, p1, p1}, Landroid/widget/Button;->setPadding(IIII)V

    .line 221
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinWidth(I)V

    .line 222
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinHeight(I)V

    .line 223
    return-object v0
.end method

.method private makeRow(Ljava/io/File;)Landroid/view/View;
    .locals 14

    .line 160
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 161
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 162
    const/16 v2, 0x10

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 163
    const v3, -0xe2e2da

    const/16 v4, 0x12

    invoke-direct {p0, v3, v4}, Lcom/dsh/apkhelper/MainActivity;->round(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 164
    const/16 v3, 0x1e

    invoke-direct {p0, v3}, Lcom/dsh/apkhelper/MainActivity;->dp(I)I

    move-result v3

    const/16 v5, 0x14

    invoke-direct {p0, v5}, Lcom/dsh/apkhelper/MainActivity;->dp(I)I

    move-result v6

    const/16 v7, 0x16

    invoke-direct {p0, v7}, Lcom/dsh/apkhelper/MainActivity;->dp(I)I

    move-result v7

    invoke-direct {p0, v5}, Lcom/dsh/apkhelper/MainActivity;->dp(I)I

    move-result v5

    invoke-virtual {v0, v3, v6, v7, v5}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 166
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x1

    const/4 v6, -0x2

    invoke-direct {v3, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 168
    invoke-direct {p0, v4}, Lcom/dsh/apkhelper/MainActivity;->dp(I)I

    move-result v7

    iput v7, v3, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 169
    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 171
    new-instance v3, Landroid/widget/LinearLayout;

    invoke-direct {v3, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 172
    const/4 v7, 0x1

    invoke-virtual {v3, v7}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 174
    new-instance v7, Landroid/widget/TextView;

    invoke-direct {v7, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 175
    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 176
    const/high16 v8, 0x41b80000    # 23.0f

    const/4 v9, 0x2

    invoke-virtual {v7, v9, v8}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 177
    invoke-virtual {v7, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 178
    invoke-virtual {v3, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 180
    new-instance v7, Landroid/widget/TextView;

    invoke-direct {v7, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 181
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v10

    const-wide/16 v12, 0x400

    div-long/2addr v10, v12

    div-long/2addr v10, v12

    invoke-virtual {v8, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v10, " MB  \u00b7  "

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {p1}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 182
    const/high16 v8, 0x41600000    # 14.0f

    invoke-virtual {v7, v9, v8}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 183
    const v8, -0x716d67

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 184
    const/4 v8, 0x6

    invoke-direct {p0, v8}, Lcom/dsh/apkhelper/MainActivity;->dp(I)I

    move-result v8

    invoke-virtual {v7, v1, v8, v1, v1}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 185
    invoke-virtual {v3, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 187
    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v8, 0x3f800000    # 1.0f

    invoke-direct {v7, v1, v6, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, v3, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 190
    const-string v1, "\u5b89\u88c5"

    const v3, -0xd182ce

    const/16 v6, 0x15

    invoke-direct {p0, v1, v3, v5, v6}, Lcom/dsh/apkhelper/MainActivity;->makeButton(Ljava/lang/String;III)Landroid/widget/Button;

    move-result-object v1

    .line 191
    new-instance v3, Lcom/dsh/apkhelper/MainActivity$5;

    invoke-direct {v3, p0, p1}, Lcom/dsh/apkhelper/MainActivity$5;-><init>(Lcom/dsh/apkhelper/MainActivity;Ljava/io/File;)V

    invoke-virtual {v1, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 196
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v5, 0xaa

    invoke-direct {p0, v5}, Lcom/dsh/apkhelper/MainActivity;->dp(I)I

    move-result v5

    const/16 v7, 0x60

    invoke-direct {p0, v7}, Lcom/dsh/apkhelper/MainActivity;->dp(I)I

    move-result v8

    invoke-direct {v3, v5, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 197
    invoke-direct {p0, v4}, Lcom/dsh/apkhelper/MainActivity;->dp(I)I

    move-result v4

    iput v4, v3, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 198
    invoke-virtual {v0, v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 200
    const v1, -0xd5d5ca

    const v3, -0x10acb0

    const-string v4, "\u5220\u9664"

    invoke-direct {p0, v4, v1, v3, v6}, Lcom/dsh/apkhelper/MainActivity;->makeButton(Ljava/lang/String;III)Landroid/widget/Button;

    move-result-object v1

    .line 201
    new-instance v3, Lcom/dsh/apkhelper/MainActivity$6;

    invoke-direct {v3, p0, p1}, Lcom/dsh/apkhelper/MainActivity$6;-><init>(Lcom/dsh/apkhelper/MainActivity;Ljava/io/File;)V

    invoke-virtual {v1, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 206
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v3, 0x96

    invoke-direct {p0, v3}, Lcom/dsh/apkhelper/MainActivity;->dp(I)I

    move-result v3

    invoke-direct {p0, v7}, Lcom/dsh/apkhelper/MainActivity;->dp(I)I

    move-result v4

    invoke-direct {p1, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 207
    invoke-direct {p0, v2}, Lcom/dsh/apkhelper/MainActivity;->dp(I)I

    move-result v2

    iput v2, p1, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 208
    invoke-virtual {v0, v1, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 210
    return-object v0
.end method

.method private round(II)Landroid/graphics/drawable/GradientDrawable;
    .locals 1

    .line 227
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 228
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 229
    invoke-direct {p0, p2}, Lcom/dsh/apkhelper/MainActivity;->dp(I)I

    move-result p1

    int-to-float p1, p1

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 230
    return-object v0
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 11

    .line 50
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 52
    new-instance p1, Landroid/widget/LinearLayout;

    invoke-direct {p1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 53
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 54
    const v1, -0xf1f1ee

    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 55
    const/16 v1, 0x34

    invoke-direct {p0, v1}, Lcom/dsh/apkhelper/MainActivity;->dp(I)I

    move-result v2

    const/16 v3, 0x22

    invoke-direct {p0, v3}, Lcom/dsh/apkhelper/MainActivity;->dp(I)I

    move-result v3

    invoke-direct {p0, v1}, Lcom/dsh/apkhelper/MainActivity;->dp(I)I

    move-result v1

    const/16 v4, 0x10

    invoke-direct {p0, v4}, Lcom/dsh/apkhelper/MainActivity;->dp(I)I

    move-result v4

    invoke-virtual {p1, v2, v3, v1, v4}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 57
    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 58
    const-string v2, "\u5b89\u88c5\u52a9\u624b"

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 59
    const/high16 v2, 0x42080000    # 34.0f

    const/4 v3, 0x2

    invoke-virtual {v1, v3, v2}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 60
    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 61
    const/4 v4, 0x0

    invoke-virtual {v1, v4, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 62
    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 64
    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/dsh/apkhelper/MainActivity;->statusText:Landroid/widget/TextView;

    .line 65
    iget-object v1, p0, Lcom/dsh/apkhelper/MainActivity;->statusText:Landroid/widget/TextView;

    const/high16 v4, 0x41880000    # 17.0f

    invoke-virtual {v1, v3, v4}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 66
    iget-object v1, p0, Lcom/dsh/apkhelper/MainActivity;->statusText:Landroid/widget/TextView;

    const v3, -0x716d67

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 67
    iget-object v1, p0, Lcom/dsh/apkhelper/MainActivity;->statusText:Landroid/widget/TextView;

    const/16 v3, 0xa

    invoke-direct {p0, v3}, Lcom/dsh/apkhelper/MainActivity;->dp(I)I

    move-result v3

    const/16 v4, 0x16

    invoke-direct {p0, v4}, Lcom/dsh/apkhelper/MainActivity;->dp(I)I

    move-result v5

    const/4 v6, 0x0

    invoke-virtual {v1, v6, v3, v6, v5}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 68
    iget-object v1, p0, Lcom/dsh/apkhelper/MainActivity;->statusText:Landroid/widget/TextView;

    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 70
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 71
    invoke-virtual {v1, v6}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 73
    const-string v3, "\u5237\u65b0\u5217\u8868"

    const v5, -0xd5d5ca

    invoke-direct {p0, v3, v5, v2, v4}, Lcom/dsh/apkhelper/MainActivity;->makeButton(Ljava/lang/String;III)Landroid/widget/Button;

    move-result-object v3

    .line 74
    new-instance v7, Lcom/dsh/apkhelper/MainActivity$1;

    invoke-direct {v7, p0}, Lcom/dsh/apkhelper/MainActivity$1;-><init>(Lcom/dsh/apkhelper/MainActivity;)V

    invoke-virtual {v3, v7}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 79
    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v8, 0xfa

    invoke-direct {p0, v8}, Lcom/dsh/apkhelper/MainActivity;->dp(I)I

    move-result v8

    const/16 v9, 0x68

    invoke-direct {p0, v9}, Lcom/dsh/apkhelper/MainActivity;->dp(I)I

    move-result v10

    invoke-direct {v7, v8, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 80
    const/16 v8, 0x1c

    invoke-direct {p0, v8}, Lcom/dsh/apkhelper/MainActivity;->dp(I)I

    move-result v8

    iput v8, v7, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 81
    invoke-virtual {v1, v3, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 83
    const-string v3, "\u626b\u7801\u4f20\u6587\u4ef6"

    const v7, -0xd182ce

    invoke-direct {p0, v3, v7, v2, v4}, Lcom/dsh/apkhelper/MainActivity;->makeButton(Ljava/lang/String;III)Landroid/widget/Button;

    move-result-object v3

    .line 84
    new-instance v7, Lcom/dsh/apkhelper/MainActivity$2;

    invoke-direct {v7, p0}, Lcom/dsh/apkhelper/MainActivity$2;-><init>(Lcom/dsh/apkhelper/MainActivity;)V

    invoke-virtual {v3, v7}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 89
    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v8, 0x12c

    invoke-direct {p0, v8}, Lcom/dsh/apkhelper/MainActivity;->dp(I)I

    move-result v8

    invoke-direct {p0, v9}, Lcom/dsh/apkhelper/MainActivity;->dp(I)I

    move-result v10

    invoke-direct {v7, v8, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 90
    const/16 v8, 0x1a

    invoke-direct {p0, v8}, Lcom/dsh/apkhelper/MainActivity;->dp(I)I

    move-result v10

    iput v10, v7, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 91
    invoke-virtual {v1, v3, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 93
    const-string v3, "\u5de5\u5177"

    invoke-direct {p0, v3, v5, v2, v4}, Lcom/dsh/apkhelper/MainActivity;->makeButton(Ljava/lang/String;III)Landroid/widget/Button;

    move-result-object v3

    .line 94
    new-instance v4, Lcom/dsh/apkhelper/MainActivity$3;

    invoke-direct {v4, p0}, Lcom/dsh/apkhelper/MainActivity$3;-><init>(Lcom/dsh/apkhelper/MainActivity;)V

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 99
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v5, 0xb4

    invoke-direct {p0, v5}, Lcom/dsh/apkhelper/MainActivity;->dp(I)I

    move-result v5

    invoke-direct {p0, v9}, Lcom/dsh/apkhelper/MainActivity;->dp(I)I

    move-result v7

    invoke-direct {v4, v5, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 101
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x2

    invoke-direct {v3, v4, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 104
    new-instance v1, Landroid/widget/ScrollView;

    invoke-direct {v1, p0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .line 105
    new-instance v3, Landroid/widget/LinearLayout;

    invoke-direct {v3, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lcom/dsh/apkhelper/MainActivity;->listBox:Landroid/widget/LinearLayout;

    .line 106
    iget-object v3, p0, Lcom/dsh/apkhelper/MainActivity;->listBox:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 107
    iget-object v0, p0, Lcom/dsh/apkhelper/MainActivity;->listBox:Landroid/widget/LinearLayout;

    invoke-direct {p0, v8}, Lcom/dsh/apkhelper/MainActivity;->dp(I)I

    move-result v3

    const/16 v4, 0x14

    invoke-direct {p0, v4}, Lcom/dsh/apkhelper/MainActivity;->dp(I)I

    move-result v4

    invoke-virtual {v0, v6, v3, v6, v4}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 108
    iget-object v0, p0, Lcom/dsh/apkhelper/MainActivity;->listBox:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 109
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v2, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 112
    invoke-virtual {p0, p1}, Lcom/dsh/apkhelper/MainActivity;->setContentView(Landroid/view/View;)V

    .line 113
    invoke-direct {p0}, Lcom/dsh/apkhelper/MainActivity;->load()V

    .line 114
    return-void
.end method

.method protected onResume()V
    .locals 1

    .line 118
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 119
    iget-object v0, p0, Lcom/dsh/apkhelper/MainActivity;->listBox:Landroid/widget/LinearLayout;

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/dsh/apkhelper/MainActivity;->load()V

    .line 120
    :cond_0
    return-void
.end method
