.class public Lcom/dsh/apkhelper/ToolsActivity;
.super Landroid/app/Activity;
.source "ToolsActivity.java"


# static fields
.field private static final C_BG:I = -0xf1f1ee

.field private static final C_CARD:I = -0xe2e2da

.field private static final C_GREEN:I = -0xd182ce

.field private static final C_RED:I = -0x39d7d8

.field private static final C_SUB:I = -0x716d67

.field private static final C_TEXT:I = -0x1

.field private static final OTA_PKG:Ljava/lang/String; = "com.xiaopeng.ota"


# instance fields
.field private blocked:Z

.field private busy:Z

.field private stateText:Landroid/widget/TextView;

.field private toggle:Landroid/widget/Button;

.field private final ui:Landroid/os/Handler;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 20
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 33
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/dsh/apkhelper/ToolsActivity;->blocked:Z

    .line 34
    iput-boolean v0, p0, Lcom/dsh/apkhelper/ToolsActivity;->busy:Z

    .line 35
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/dsh/apkhelper/ToolsActivity;->ui:Landroid/os/Handler;

    return-void
.end method

.method static synthetic access$000(Lcom/dsh/apkhelper/ToolsActivity;)Z
    .locals 0

    .line 20
    iget-boolean p0, p0, Lcom/dsh/apkhelper/ToolsActivity;->busy:Z

    return p0
.end method

.method static synthetic access$002(Lcom/dsh/apkhelper/ToolsActivity;Z)Z
    .locals 0

    .line 20
    iput-boolean p1, p0, Lcom/dsh/apkhelper/ToolsActivity;->busy:Z

    return p1
.end method

.method static synthetic access$100(Lcom/dsh/apkhelper/ToolsActivity;)Z
    .locals 0

    .line 20
    iget-boolean p0, p0, Lcom/dsh/apkhelper/ToolsActivity;->blocked:Z

    return p0
.end method

.method static synthetic access$102(Lcom/dsh/apkhelper/ToolsActivity;Z)Z
    .locals 0

    .line 20
    iput-boolean p1, p0, Lcom/dsh/apkhelper/ToolsActivity;->blocked:Z

    return p1
.end method

.method static synthetic access$200(Lcom/dsh/apkhelper/ToolsActivity;Z)V
    .locals 0

    .line 20
    invoke-direct {p0, p1}, Lcom/dsh/apkhelper/ToolsActivity;->apply(Z)V

    return-void
.end method

.method static synthetic access$300(Lcom/dsh/apkhelper/ToolsActivity;)V
    .locals 0

    .line 20
    invoke-direct {p0}, Lcom/dsh/apkhelper/ToolsActivity;->render()V

    return-void
.end method

.method static synthetic access$400(Lcom/dsh/apkhelper/ToolsActivity;)Landroid/os/Handler;
    .locals 0

    .line 20
    iget-object p0, p0, Lcom/dsh/apkhelper/ToolsActivity;->ui:Landroid/os/Handler;

    return-object p0
.end method

.method static synthetic access$500(Lcom/dsh/apkhelper/ToolsActivity;)Landroid/widget/Button;
    .locals 0

    .line 20
    iget-object p0, p0, Lcom/dsh/apkhelper/ToolsActivity;->toggle:Landroid/widget/Button;

    return-object p0
.end method

.method static synthetic access$600(Lcom/dsh/apkhelper/ToolsActivity;)Landroid/widget/TextView;
    .locals 0

    .line 20
    iget-object p0, p0, Lcom/dsh/apkhelper/ToolsActivity;->stateText:Landroid/widget/TextView;

    return-object p0
.end method

.method static synthetic access$700(Lcom/dsh/apkhelper/ToolsActivity;)V
    .locals 0

    .line 20
    invoke-direct {p0}, Lcom/dsh/apkhelper/ToolsActivity;->refresh()V

    return-void
.end method

.method private apply(Z)V
    .locals 2

    .line 127
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/dsh/apkhelper/ToolsActivity;->busy:Z

    .line 128
    iget-object v0, p0, Lcom/dsh/apkhelper/ToolsActivity;->toggle:Landroid/widget/Button;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 129
    iget-object v0, p0, Lcom/dsh/apkhelper/ToolsActivity;->stateText:Landroid/widget/TextView;

    if-eqz p1, :cond_0

    const-string v1, "\u6b63\u5728\u5c4f\u853d\u2026"

    goto :goto_0

    :cond_0
    const-string v1, "\u6b63\u5728\u6062\u590d\u2026"

    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 130
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/dsh/apkhelper/ToolsActivity$3;

    invoke-direct {v1, p0, p1}, Lcom/dsh/apkhelper/ToolsActivity$3;-><init>(Lcom/dsh/apkhelper/ToolsActivity;Z)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 153
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 154
    return-void
.end method

.method private dp(I)I
    .locals 1

    .line 164
    int-to-float p1, p1

    invoke-virtual {p0}, Lcom/dsh/apkhelper/ToolsActivity;->getResources()Landroid/content/res/Resources;

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

.method private refresh()V
    .locals 2

    .line 96
    iget-object v0, p0, Lcom/dsh/apkhelper/ToolsActivity;->stateText:Landroid/widget/TextView;

    const-string v1, "\u8bfb\u53d6\u72b6\u6001\u2026"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 97
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/dsh/apkhelper/ToolsActivity$2;

    invoke-direct {v1, p0}, Lcom/dsh/apkhelper/ToolsActivity$2;-><init>(Lcom/dsh/apkhelper/ToolsActivity;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 108
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 109
    return-void
.end method

.method private render()V
    .locals 3

    .line 112
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/dsh/apkhelper/ToolsActivity;->busy:Z

    .line 113
    iget-boolean v0, p0, Lcom/dsh/apkhelper/ToolsActivity;->blocked:Z

    const/16 v1, 0xe

    if-eqz v0, :cond_0

    .line 114
    iget-object v0, p0, Lcom/dsh/apkhelper/ToolsActivity;->stateText:Landroid/widget/TextView;

    const-string v2, "\u5f53\u524d\u72b6\u6001\uff1a\u5df2\u5c4f\u853d"

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 115
    iget-object v0, p0, Lcom/dsh/apkhelper/ToolsActivity;->stateText:Landroid/widget/TextView;

    const v2, -0x106566

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 116
    iget-object v0, p0, Lcom/dsh/apkhelper/ToolsActivity;->toggle:Landroid/widget/Button;

    const-string v2, "\u6062\u590d\u7cfb\u7edf\u66f4\u65b0"

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 117
    iget-object v0, p0, Lcom/dsh/apkhelper/ToolsActivity;->toggle:Landroid/widget/Button;

    const v2, -0xd182ce

    invoke-direct {p0, v2, v1}, Lcom/dsh/apkhelper/ToolsActivity;->round(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 119
    :cond_0
    iget-object v0, p0, Lcom/dsh/apkhelper/ToolsActivity;->stateText:Landroid/widget/TextView;

    const-string v2, "\u5f53\u524d\u72b6\u6001\uff1a\u6b63\u5e38\uff08\u4f1a\u6536\u5230\u66f4\u65b0\uff09"

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 120
    iget-object v0, p0, Lcom/dsh/apkhelper/ToolsActivity;->stateText:Landroid/widget/TextView;

    const v2, -0x63339b

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 121
    iget-object v0, p0, Lcom/dsh/apkhelper/ToolsActivity;->toggle:Landroid/widget/Button;

    const-string v2, "\u5c4f\u853d\u7cfb\u7edf\u66f4\u65b0"

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 122
    iget-object v0, p0, Lcom/dsh/apkhelper/ToolsActivity;->toggle:Landroid/widget/Button;

    const v2, -0x39d7d8

    invoke-direct {p0, v2, v1}, Lcom/dsh/apkhelper/ToolsActivity;->round(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 124
    :goto_0
    return-void
.end method

.method private round(II)Landroid/graphics/drawable/GradientDrawable;
    .locals 1

    .line 157
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 158
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 159
    invoke-direct {p0, p2}, Lcom/dsh/apkhelper/ToolsActivity;->dp(I)I

    move-result p1

    int-to-float p1, p1

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 160
    return-object v0
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 8

    .line 39
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 41
    new-instance p1, Landroid/widget/LinearLayout;

    invoke-direct {p1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 42
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 43
    const v1, -0xf1f1ee

    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 44
    const/16 v1, 0x34

    invoke-direct {p0, v1}, Lcom/dsh/apkhelper/ToolsActivity;->dp(I)I

    move-result v2

    const/16 v3, 0x22

    invoke-direct {p0, v3}, Lcom/dsh/apkhelper/ToolsActivity;->dp(I)I

    move-result v4

    invoke-direct {p0, v1}, Lcom/dsh/apkhelper/ToolsActivity;->dp(I)I

    move-result v1

    const/16 v5, 0x18

    invoke-direct {p0, v5}, Lcom/dsh/apkhelper/ToolsActivity;->dp(I)I

    move-result v5

    invoke-virtual {p1, v2, v4, v1, v5}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 46
    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 47
    const-string v2, "\u5de5\u5177"

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 48
    const/high16 v2, 0x42080000    # 34.0f

    const/4 v4, 0x2

    invoke-virtual {v1, v4, v2}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 49
    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 50
    const/4 v5, 0x0

    invoke-virtual {v1, v5, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 51
    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 53
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 54
    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 55
    const v0, -0xe2e2da

    const/16 v5, 0x12

    invoke-direct {p0, v0, v5}, Lcom/dsh/apkhelper/ToolsActivity;->round(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 56
    invoke-direct {p0, v3}, Lcom/dsh/apkhelper/ToolsActivity;->dp(I)I

    move-result v0

    const/16 v6, 0x1a

    invoke-direct {p0, v6}, Lcom/dsh/apkhelper/ToolsActivity;->dp(I)I

    move-result v7

    invoke-direct {p0, v3}, Lcom/dsh/apkhelper/ToolsActivity;->dp(I)I

    move-result v3

    invoke-direct {p0, v6}, Lcom/dsh/apkhelper/ToolsActivity;->dp(I)I

    move-result v6

    invoke-virtual {v1, v0, v7, v3, v6}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 57
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x2

    invoke-direct {v0, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 59
    const/16 v3, 0x1c

    invoke-direct {p0, v3}, Lcom/dsh/apkhelper/ToolsActivity;->dp(I)I

    move-result v3

    iput v3, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 60
    invoke-virtual {p1, v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 62
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 63
    const-string v3, "\u7cfb\u7edf\u66f4\u65b0"

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 64
    const/high16 v3, 0x41c00000    # 24.0f

    invoke-virtual {v0, v4, v3}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 65
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 66
    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 68
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 69
    const-string v3, "\u5c4f\u853d\u540e\u8f66\u673a\u4e0d\u518d\u68c0\u67e5\u3001\u4e0b\u8f7d\u3001\u63d0\u793a OTA \u66f4\u65b0\u3002\u968f\u65f6\u53ef\u4ee5\u6062\u590d\u3002"

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 70
    const/high16 v3, 0x41700000    # 15.0f

    invoke-virtual {v0, v4, v3}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 71
    const v3, -0x716d67

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 72
    const/16 v3, 0x8

    invoke-direct {p0, v3}, Lcom/dsh/apkhelper/ToolsActivity;->dp(I)I

    move-result v3

    const/4 v6, 0x0

    invoke-virtual {v0, v6, v3, v6, v6}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 73
    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 75
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/dsh/apkhelper/ToolsActivity;->stateText:Landroid/widget/TextView;

    .line 76
    iget-object v0, p0, Lcom/dsh/apkhelper/ToolsActivity;->stateText:Landroid/widget/TextView;

    const/high16 v3, 0x41900000    # 18.0f

    invoke-virtual {v0, v4, v3}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 77
    iget-object v0, p0, Lcom/dsh/apkhelper/ToolsActivity;->stateText:Landroid/widget/TextView;

    invoke-direct {p0, v5}, Lcom/dsh/apkhelper/ToolsActivity;->dp(I)I

    move-result v3

    invoke-direct {p0, v5}, Lcom/dsh/apkhelper/ToolsActivity;->dp(I)I

    move-result v5

    invoke-virtual {v0, v6, v3, v6, v5}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 78
    iget-object v0, p0, Lcom/dsh/apkhelper/ToolsActivity;->stateText:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 80
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/dsh/apkhelper/ToolsActivity;->toggle:Landroid/widget/Button;

    .line 81
    iget-object v0, p0, Lcom/dsh/apkhelper/ToolsActivity;->toggle:Landroid/widget/Button;

    invoke-virtual {v0, v6}, Landroid/widget/Button;->setAllCaps(Z)V

    .line 82
    iget-object v0, p0, Lcom/dsh/apkhelper/ToolsActivity;->toggle:Landroid/widget/Button;

    const/high16 v3, 0x41a80000    # 21.0f

    invoke-virtual {v0, v4, v3}, Landroid/widget/Button;->setTextSize(IF)V

    .line 83
    iget-object v0, p0, Lcom/dsh/apkhelper/ToolsActivity;->toggle:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setTextColor(I)V

    .line 84
    iget-object v0, p0, Lcom/dsh/apkhelper/ToolsActivity;->toggle:Landroid/widget/Button;

    new-instance v2, Lcom/dsh/apkhelper/ToolsActivity$1;

    invoke-direct {v2, p0}, Lcom/dsh/apkhelper/ToolsActivity$1;-><init>(Lcom/dsh/apkhelper/ToolsActivity;)V

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 89
    iget-object v0, p0, Lcom/dsh/apkhelper/ToolsActivity;->toggle:Landroid/widget/Button;

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v3, 0x140

    invoke-direct {p0, v3}, Lcom/dsh/apkhelper/ToolsActivity;->dp(I)I

    move-result v3

    const/16 v4, 0x60

    invoke-direct {p0, v4}, Lcom/dsh/apkhelper/ToolsActivity;->dp(I)I

    move-result v4

    invoke-direct {v2, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 91
    invoke-virtual {p0, p1}, Lcom/dsh/apkhelper/ToolsActivity;->setContentView(Landroid/view/View;)V

    .line 92
    invoke-direct {p0}, Lcom/dsh/apkhelper/ToolsActivity;->refresh()V

    .line 93
    return-void
.end method
