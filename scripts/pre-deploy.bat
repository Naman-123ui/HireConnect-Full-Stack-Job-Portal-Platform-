@echo off
REM Pre-deployment checks and setup script for Windows

echo.
echo 🚀 Job Portal - Pre-Deployment Setup
echo ======================================

REM Check Node.js version
echo ✓ Checking Node.js version...
for /f "tokens=*" %%i in ('node -v') do set NODE_VERSION=%%i
for /f "tokens=*" %%i in ('npm -v') do set NPM_VERSION=%%i
echo   Node.js: %NODE_VERSION%
echo   npm: %NPM_VERSION%

REM Check if .env exists
echo.
echo ✓ Checking environment files...
if not exist .env (
    echo   ⚠️ .env file not found
    echo   Creating .env from .env.example...
    copy .env.example .env
    echo   ⚠️ IMPORTANT: Update .env with your actual values!
) else (
    echo   ✓ .env file exists
)

if not exist .env.example (
    echo   ⚠️ .env.example file not found
) else (
    echo   ✓ .env.example file exists
)

REM Install dependencies
echo.
echo ✓ Installing dependencies...
call npm install
if %errorlevel% neq 0 (
    echo   ❌ npm install failed
    exit /b 1
)

REM Run linter
echo.
echo ✓ Running linter...
call npm run lint
if %errorlevel% neq 0 (
    echo   ❌ Linting failed - fix errors before deployment
    exit /b 1
)
echo   ✓ Linting passed

REM Build application
echo.
echo ✓ Building application...
call npm run build
if %errorlevel% neq 0 (
    echo   ❌ Build failed
    exit /b 1
)
echo   ✓ Build successful

REM Check build output
echo.
echo ✓ Verifying build output...
if exist dist (
    echo   ✓ dist folder created
) else (
    echo   ❌ dist folder not found
    exit /b 1
)

echo.
echo ======================================
echo ✅ Pre-Deployment Checklist Complete!
echo ======================================
echo.
echo Next steps:
echo 1. Update environment variables in your deployment platform
echo 2. Ensure Clerk dashboard has correct redirect URLs
echo 3. Verify Supabase Row Level Security policies
echo 4. Push to GitHub: git push origin main
echo 5. Trigger deployment on Vercel/Netlify
echo.
