# 部署后清理脚本 - 删除临时复制的文件

Write-Host "Starting cleanup..." -ForegroundColor Green

# Clean docs directory
Write-Host "Cleaning docs directory..." -ForegroundColor Yellow

# sakurapi-rk3308b
Remove-Item -Recurse -Force "docs\article\sakurapi-rk3308b\img" -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force "docs\article\sakurapi-rk3308b\assets" -ErrorAction SilentlyContinue

# sakurapi-rk3308b playground
$playgroundDirs = @("boost-to-1.3ghz", "connect-to-joycon", "rgb-display", "voron-klipper", "ws2812-leds")
foreach($dir in $playgroundDirs) {
    Remove-Item -Recurse -Force "docs\article\sakurapi-rk3308b\playground\$dir" -ErrorAction SilentlyContinue
}

# sakurapi-elara-1
Remove-Item -Recurse -Force "docs\article\sakurapi-elara-1\img" -ErrorAction SilentlyContinue

# Clean i18n/en directory
Write-Host "Cleaning i18n/en directory..." -ForegroundColor Yellow

# sakurapi-rk3308b
Remove-Item -Recurse -Force "i18n\en\docusaurus-plugin-content-docs\current\article\sakurapi-rk3308b\img" -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force "i18n\en\docusaurus-plugin-content-docs\current\article\sakurapi-rk3308b\assets" -ErrorAction SilentlyContinue

# sakurapi-rk3308b playground
foreach($dir in $playgroundDirs) {
    Remove-Item -Recurse -Force "i18n\en\docusaurus-plugin-content-docs\current\article\sakurapi-rk3308b\playground\$dir" -ErrorAction SilentlyContinue
}

# sakurapi-elara-1
Remove-Item -Recurse -Force "i18n\en\docusaurus-plugin-content-docs\current\article\sakurapi-elara-1\img" -ErrorAction SilentlyContinue

# _common assets
Remove-Item -Recurse -Force "i18n\en\docusaurus-plugin-content-docs\current\article\_common\assets" -ErrorAction SilentlyContinue

# sponsors
Remove-Item -Recurse -Force "i18n\en\docusaurus-plugin-content-docs\current\img" -ErrorAction SilentlyContinue

Write-Host "Cleanup completed!" -ForegroundColor Green
