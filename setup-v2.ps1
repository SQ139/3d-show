# setup-portfolio-v2.ps1
$ErrorActionPreference = 'SilentlyContinue'
Set-Location 'C:\Users\user\Desktop\3d-show'

if (-not (Test-Path 'img')) { New-Item -ItemType Directory -Path 'img' | Out-Null }

# CORRECT mapping: filename -> Coze short URL
$urls = [ordered]@{
  "stage_1_imeik_mainstage.jpg" = "https://www.coze.cn/s/uxFgehpy4E4/"
  "stage_2_yuanyuan.jpg"        = "https://www.coze.cn/s/yDE4gS6jy4I/"
  "stage_3_hutox.jpg"           = "https://www.coze.cn/s/yoaXqaErm9U/"
  "stage_4_hishaperf.jpg"       = "https://www.coze.cn/s/ym-3MEmLJH8/"
  "stage_5_imeik_reception.jpg" = "https://www.coze.cn/s/x-Ba4m6nEVo/"
  "stage_6_scnu.jpg"            = "https://www.coze.cn/s/s5Uzu5a7_AI/"
  "stage_7_fosun.jpg"           = "https://www.coze.cn/s/yA58R16Bp6Y/"
  "stage_8_sfexpress.jpg"       = "https://www.coze.cn/s/xfUUQ9YPy_M/"
  "stage_9_lightshow.jpg"       = "https://www.coze.cn/s/yBKB8FW3DlE/"
}
foreach ($name in $urls.Keys) {
  curl.exe -sL $urls[$name] -o "img\$name"
  $len = (Get-Item "img\$name").Length
  Write-Output ("{0,-35} {1} bytes" -f $name, $len)
}

git add img
git commit -m "fix: correct 9 image url mapping"
git push origin HEAD:main
