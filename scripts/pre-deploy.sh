#!/bin/bash

# Pre-deployment checks and setup script
echo "🚀 Job Portal - Pre-Deployment Setup"
echo "======================================"

# Check Node.js version
echo "✓ Checking Node.js version..."
NODE_VERSION=$(node -v)
NPM_VERSION=$(npm -v)
echo "  Node.js: $NODE_VERSION"
echo "  npm: $NPM_VERSION"

# Check if .env exists
echo ""
echo "✓ Checking environment files..."
if [ ! -f .env ]; then
    echo "  ⚠️ .env file not found"
    echo "  Creating .env from .env.example..."
    cp .env.example .env
    echo "  ⚠️ IMPORTANT: Update .env with your actual values!"
else
    echo "  ✓ .env file exists"
fi

if [ ! -f .env.example ]; then
    echo "  ⚠️ .env.example file not found"
else
    echo "  ✓ .env.example file exists"
fi

# Install dependencies
echo ""
echo "✓ Installing dependencies..."
npm install

# Run linter
echo ""
echo "✓ Running linter..."
npm run lint
if [ $? -eq 0 ]; then
    echo "  ✓ Linting passed"
else
    echo "  ❌ Linting failed - fix errors before deployment"
    exit 1
fi

# Build application
echo ""
echo "✓ Building application..."
npm run build
if [ $? -eq 0 ]; then
    echo "  ✓ Build successful"
else
    echo "  ❌ Build failed"
    exit 1
fi

# Check build output
echo ""
echo "✓ Verifying build output..."
if [ -d dist ]; then
    echo "  ✓ dist folder created"
    echo "  Build size: $(du -sh dist | cut -f1)"
else
    echo "  ❌ dist folder not found"
    exit 1
fi

# Preview build
echo ""
echo "✓ Testing preview build..."
npm run preview &
PREVIEW_PID=$!
sleep 3

# Test if server is running
if lsof -i :4173 >/dev/null 2>&1; then
    echo "  ✓ Preview server started successfully"
    kill $PREVIEW_PID 2>/dev/null
else
    echo "  ⚠️ Preview server failed to start"
    kill $PREVIEW_PID 2>/dev/null
fi

# Final checklist
echo ""
echo "======================================"
echo "✅ Pre-Deployment Checklist Complete!"
echo "======================================"
echo ""
echo "Next steps:"
echo "1. Update environment variables in your deployment platform"
echo "2. Ensure Clerk dashboard has correct redirect URLs"
echo "3. Verify Supabase Row Level Security policies"
echo "4. Push to GitHub: git push origin main"
echo "5. Trigger deployment on Vercel/Netlify"
echo ""
