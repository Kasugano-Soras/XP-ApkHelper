# 把工程改动提交并推送到 GitHub
# 用法：powershell -ExecutionPolicy Bypass -File .\sync.ps1
#      powershell -ExecutionPolicy Bypass -File .\sync.ps1 "改了首页列表去重"
param([string]$Message = "")

$ErrorActionPreference = "Stop"
Set-Location -LiteralPath $PSScriptRoot

if (-not (Test-Path -LiteralPath ".git")) { throw "当前目录不是 git 仓库" }
if (-not (git remote)) { throw "还没有配置远端，先执行：git remote add origin git@github.com:<用户名>/<仓库名>.git" }
if (-not $Message) { $Message = "sync " + (Get-Date -Format "yyyy-MM-dd HH:mm") }

git add -A
$changes = git status --porcelain
if (-not $changes) { Write-Output "没有改动，跳过提交。"; exit 0 }

git commit -m $Message
git push origin main
Write-Output "已提交并推送：$Message"
