# setup-portfolio.ps1
$ErrorActionPreference = 'SilentlyContinue'
Set-Location 'C:\Users\user\Desktop\3d-show'

# 1) create img dir
if (-not (Test-Path 'img')) { New-Item -ItemType Directory -Path 'img' | Out-Null }

# 2) download HTML
curl.exe -sL "https://www.coze.cn/s/BuTQ9M-tKRY/" -o "index.html"
Write-Output ("index.html: {0} bytes" -f (Get-Item index.html).Length)

# 3) download 9 images
$urls = [ordered]@{
  "stage_1_imeik_mainstage.jpg" = "https://www.coze.cn/s/x-Ba4m6nEVo/"
  "stage_2_yuanyuan.jpg"        = "https://www.coze.cn/s/yA58R16Bp6Y/"
  "stage_3_hutox.jpg"           = "https://www.coze.cn/s/yoaXqaErm9U/"
  "stage_4_hishaperf.jpg"       = "https://www.coze.cn/s/yDE4gS6jy4I/"
  "stage_5_imeik_reception.jpg" = "https://www.coze.cn/s/uxFgehpy4E4/"
  "stage_6_scnu.jpg"            = "https://www.coze.cn/s/s5Uzu5a7_AI/"
  "stage_7_fosun.jpg"           = "https://www.coze.cn/s/yBKB8FW3DlE/"
  "stage_8_sfexpress.jpg"       = "https://www.coze.cn/s/CABZck95Xzo/"
  "stage_9_lightshow.jpg"       = "https://www.coze.cn/s/9t5PF1aAALU/"
}
foreach ($name in $urls.Keys) {
  curl.exe -sL $urls[$name] -o "img\$name"
  Write-Output ("{0,-35} {1} bytes" -f $name, (Get-Item "img\$name").Length)
}

# 4) commit and push
git add .
git commit -m "feat: localize image resources"
git push origin HEAD:main
