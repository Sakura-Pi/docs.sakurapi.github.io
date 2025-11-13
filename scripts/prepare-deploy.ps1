# Prepare deployment - Copy symlinked files

Write-Host "Preparing deployment files..." -ForegroundColor Green

# Copy docs directory files
Write-Host "Copying docs images and assets..." -ForegroundColor Yellow

# sakurapi-rk3308b
Copy-Item -Recurse -Force "static\dl\product\sakurapi-rk3308b\img" "docs\article\sakurapi-rk3308b\img"
Copy-Item -Recurse -Force "static\dl\product\sakurapi-rk3308b\assets" "docs\article\sakurapi-rk3308b\assets"

# sakurapi-rk3308b playground
$playgroundDirs = @("boost-to-1.3ghz", "connect-to-joycon", "rgb-display", "voron-klipper", "ws2812-leds")
foreach($dir in $playgroundDirs) {
    Copy-Item -Recurse -Force "static\dl\product\sakurapi-rk3308b\playground\$dir" "docs\article\sakurapi-rk3308b\playground\$dir"
}

# sakurapi-elara-1
Copy-Item -Recurse -Force "static\dl\product\sakurapi-elara-1\img" "docs\article\sakurapi-elara-1\img"

# Copy i18n/en directory files
Write-Host "Copying i18n/en images and assets..." -ForegroundColor Yellow

# sakurapi-rk3308b
Copy-Item -Recurse -Force "static\dl\product\sakurapi-rk3308b\img" "i18n\en\docusaurus-plugin-content-docs\current\article\sakurapi-rk3308b\img"
Copy-Item -Recurse -Force "static\dl\product\sakurapi-rk3308b\assets" "i18n\en\docusaurus-plugin-content-docs\current\article\sakurapi-rk3308b\assets"

# sakurapi-rk3308b playground
foreach($dir in $playgroundDirs) {
    Copy-Item -Recurse -Force "static\dl\product\sakurapi-rk3308b\playground\$dir" "i18n\en\docusaurus-plugin-content-docs\current\article\sakurapi-rk3308b\playground\$dir"
}

# sakurapi-elara-1
Copy-Item -Recurse -Force "static\dl\product\sakurapi-elara-1\img" "i18n\en\docusaurus-plugin-content-docs\current\article\sakurapi-elara-1\img"

# _common assets
Copy-Item -Recurse -Force "docs\article\_common\assets" "i18n\en\docusaurus-plugin-content-docs\current\article\_common\assets"

# sponsors
New-Item -ItemType Directory -Force -Path "i18n\en\docusaurus-plugin-content-docs\current\img\sponsors" | Out-Null
Copy-Item -Force "docs\img\sponsors\100ask.net.jpg" "i18n\en\docusaurus-plugin-content-docs\current\img\sponsors\100ask.net.jpg"

Write-Host "Files prepared successfully!" -ForegroundColor Green
