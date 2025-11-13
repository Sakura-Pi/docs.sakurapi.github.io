# Full deployment script - Prepare, Deploy, Cleanup

param(
    [string]$GitUser = $env:GIT_USER
)

# Check GIT_USER
if (-not $GitUser) {
    Write-Host "Error: Please set GIT_USER environment variable or use -GitUser parameter" -ForegroundColor Red
    Write-Host "Example: .\scripts\deploy.ps1 -GitUser xxx" -ForegroundColor Yellow
    exit 1
}

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Starting deployment process" -ForegroundColor Cyan
Write-Host "Git User: $GitUser" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# 1. Prepare files
Write-Host "[1/3] Preparing deployment files..." -ForegroundColor Cyan
& "$PSScriptRoot\prepare-deploy.ps1"
if ($LASTEXITCODE -ne 0) {
    Write-Host "Failed to prepare files!" -ForegroundColor Red
    exit 1
}
Write-Host ""

# 2. Deploy
Write-Host "[2/3] Deploying..." -ForegroundColor Cyan
$env:GIT_USER = $GitUser
npm run deploy
$deployResult = $LASTEXITCODE

Write-Host ""

# 3. Cleanup
Write-Host "[3/3] Cleaning up temporary files..." -ForegroundColor Cyan
& "$PSScriptRoot\cleanup-deploy.ps1"
Write-Host ""

# Check deployment result
if ($deployResult -eq 0) {
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "Deployment successful!" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
} else {
    Write-Host "========================================" -ForegroundColor Red
    Write-Host "Deployment failed!" -ForegroundColor Red
    Write-Host "========================================" -ForegroundColor Red
    exit $deployResult
}
