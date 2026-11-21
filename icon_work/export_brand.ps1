param(
    [string]$Chrome = "C:\Program Files\Google\Chrome\Application\chrome.exe"
)

$ErrorActionPreference = "Stop"
Add-Type -AssemblyName System.Drawing
$brand = Join-Path $PSScriptRoot "brand"
$project = Split-Path -Parent $PSScriptRoot
$scratch = Join-Path ([IO.Path]::GetTempPath()) ("xp-apkhelper-logo-" + [guid]::NewGuid().ToString("N"))
New-Item -ItemType Directory -Path $scratch | Out-Null

function Export-Svg([string]$source, [string]$target) {
    $url = [uri]::new($source).AbsoluteUri
    $profile = Join-Path $scratch "chrome"
    $arguments = @(
        "--headless", "--disable-gpu", "--disable-background-networking", "--no-first-run",
        "--hide-scrollbars", "--force-device-scale-factor=1", "--window-size=1024,1024",
        "--default-background-color=00000000", ('--user-data-dir="{0}"' -f $profile),
        ('--screenshot="{0}"' -f $target), $url
    )
    $process = Start-Process -FilePath $Chrome -ArgumentList $arguments -WindowStyle Hidden -PassThru -Wait
    if ($process.ExitCode -ne 0 -or !(Test-Path -LiteralPath $target)) {
        throw "Could not render $source"
    }
}

function Export-Size([Drawing.Image]$source, [int]$size, [string]$target) {
    $bitmap = [Drawing.Bitmap]::new($size, $size, [Drawing.Imaging.PixelFormat]::Format32bppArgb)
    $graphics = [Drawing.Graphics]::FromImage($bitmap)
    try {
        $graphics.InterpolationMode = [Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
        $graphics.PixelOffsetMode = [Drawing.Drawing2D.PixelOffsetMode]::Half
        $graphics.DrawImage($source, [Drawing.Rectangle]::new(0, 0, $size, $size))
        $bitmap.Save($target, [Drawing.Imaging.ImageFormat]::Png)
    } finally {
        $graphics.Dispose()
        $bitmap.Dispose()
    }
}

try {
    $source = Join-Path $brand "logo.svg"
    [xml]$transparent = Get-Content -Raw -LiteralPath $source
    $background = $transparent.SelectSingleNode("//*[@id='background']")
    [void]$background.ParentNode.RemoveChild($background)
    $transparentSvg = Join-Path $scratch "transparent.svg"
    $transparent.Save($transparentSvg)
    $rounded = Join-Path $scratch "rounded.png"
    $mark = Join-Path $scratch "transparent.png"
    Export-Svg $source $rounded
    Export-Svg $transparentSvg $mark

    $roundedImage = [Drawing.Bitmap]::new($rounded)
    $markImage = [Drawing.Bitmap]::new($mark)
    try {
        $white = [Drawing.Color]::White.ToArgb()
        if ($roundedImage.Width -ne 1024 -or $roundedImage.Height -ne 1024 -or
            $roundedImage.GetPixel(0, 0).A -ne 0 -or $roundedImage.GetPixel(20, 512).A -ne 255 -or
            $markImage.GetPixel(20, 512).A -ne 0 -or $markImage.GetPixel(512, 245).A -ne 255 -or
            $markImage.GetPixel(512, 718).ToArgb() -ne $white -or
            $markImage.GetPixel(448, 744).ToArgb() -ne $white -or
            $markImage.GetPixel(512, 838).ToArgb() -ne $white -or
            $markImage.GetPixel(512, 792).A -ne 0) {
            throw "Logo render failed size or alpha checks"
        }
        Copy-Item -LiteralPath $rounded -Destination (Join-Path $brand "logo-rounded.png")
        Copy-Item -LiteralPath $mark -Destination (Join-Path $brand "logo-transparent.png")
        Export-Size $roundedImage 512 (Join-Path $brand "about_logo.png")
        Export-Size $roundedImage 96 (Join-Path $project "web-src\brand-logo.png")
        $densities = [ordered]@{ mdpi = 48; hdpi = 72; xhdpi = 96; xxhdpi = 144; xxxhdpi = 192 }
        foreach ($density in $densities.Keys) {
            $folder = Join-Path $brand "mipmap-$density"
            New-Item -ItemType Directory -Path $folder -Force | Out-Null
            Export-Size $roundedImage $densities[$density] (Join-Path $folder "ic_launcher.png")
        }
    } finally {
        $roundedImage.Dispose()
        $markImage.Dispose()
    }
} finally {
    $tempRoot = [IO.Path]::GetFullPath([IO.Path]::GetTempPath())
    $resolved = (Resolve-Path -LiteralPath $scratch).Path
    if ($resolved.StartsWith($tempRoot, [StringComparison]::OrdinalIgnoreCase) -and
        (Split-Path -Leaf $resolved) -match '^xp-apkhelper-logo-[a-f0-9]{32}$') {
        Remove-Item -LiteralPath $resolved -Recurse -Force
    }
}
