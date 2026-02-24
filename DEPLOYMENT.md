# Deployment Guide - Job Portal

This guide covers deploying the Job Portal application to multiple platforms.

## Prerequisites

Before deploying, ensure you have:
- Git repository initialized and pushed to GitHub
- Supabase account and database set up
- Clerk account and authentication configured
- Node.js 16+ installed locally

---

## Deployment Options

### Option 1: Vercel (Recommended - Easiest)

Vercel is optimized for Vite and React applications. It's the quickest option.

#### Steps:

1. **Push code to GitHub**
   ```bash
   git add .
   git commit -m "Ready for deployment"
   git push origin main
   ```

2. **Connect to Vercel**
   - Visit https://vercel.com
   - Click "Add New" → "Project"
   - Import your GitHub repository
   - Select "Job Portal" project

3. **Configure Environment Variables**
   - In Vercel dashboard, go to Settings → Environment Variables
   - Add the following variables:
     ```
     VITE_SUPABASE_URL
     VITE_SUPABASE_PUBLISHABLE_DEFAULT_KEY
     VITE_CLERK_PUBLISHABLE_KEY
     ```
   - Get values from your `.env` file
   - Apply to Production environment

4. **Deploy**
   - Click "Deploy" 
   - Vercel automatically builds and deploys
   - Your app will be live at `your-project.vercel.app`

5. **Configure Custom Domain** (Optional)
   - Go to Settings → Domains
   - Add your custom domain
   - Update DNS records as instructed

#### Key Points:
- ✅ Automatic deployments on git push to main
- ✅ Preview deployments for pull requests
- ✅ Free tier available
- ✅ Automatic HTTPS/SSL

---

### Option 2: Netlify

Great alternative with excellent Vite support.

#### Steps:

1. **Connect to Netlify**
   - Visit https://netlify.com
   - Click "Add new site" → "Import an existing project"
   - Connect GitHub account
   - Select your repository

2. **Configure Build Settings**
   - Build command: `npm run build`
   - Publish directory: `dist`

3. **Add Environment Variables**
   - Go to Site settings → Build & deploy → Environment
   - Add environment variables:
     ```
     VITE_SUPABASE_URL
     VITE_SUPABASE_PUBLISHABLE_DEFAULT_KEY
     VITE_CLERK_PUBLISHABLE_KEY
     ```

4. **Configure Routing**
   - Create `netlify.toml` file (already configured in your project)
   - This ensures React Router works correctly

5. **Deploy**
   - Click "Deploy site"
   - App will be live at `your-site.netlify.app`

#### Key Points:
- ✅ Free tier includes custom domains
- ✅ Easy environment variable management
- ✅ Automatic deployments
- ✅ Built-in analytics

---

### Option 3: AWS Amplify

For more advanced deployments and scalability.

#### Steps:

1. **Install and Configure Amplify CLI**
   ```bash
   npm install -g @aws-amplify/cli
   amplify configure
   ```

2. **Initialize Amplify Project**
   ```bash
   amplify init
   ```
   - Choose React as framework
   - Choose dist as build directory

3. **Deploy**
   ```bash
   amplify push
   ```

4. **Add Custom Domain**
   ```bash
   amplify add hosting
   amplify publish
   ```

---

### Option 4: Docker + Any Cloud Provider

For maximum flexibility (Heroku, DigitalOcean, AWS, GCP, etc.)

#### Create Dockerfile:

```dockerfile
FROM node:18-alpine

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm ci

# Copy source
COPY . .

# Build
RUN npm run build

# Expose port
EXPOSE 3000

# Install serve to run the app
RUN npm install -g serve

# Start app
CMD ["serve", "-s", "dist", "-l", "3000"]
```

#### Create .dockerignore:

```
node_modules
.git
.gitignore
README.md
.env
dist
```

#### Deploy Commands:

**Heroku:**
```bash
heroku login
heroku create your-app-name
git push heroku main
```

**DigitalOcean:**
```bash
# Create App Platform app and connect GitHub
# Configure in DigitalOcean dashboard
```

---

## Environment Variables Setup

### Required Variables:

```env
# Supabase
VITE_SUPABASE_URL=https://your-project.supabase.co
VITE_SUPABASE_PUBLISHABLE_DEFAULT_KEY=your_anon_key

# Clerk
VITE_CLERK_PUBLISHABLE_KEY=your_clerk_key
```

**⚠️ Important:** Never commit `.env` files with actual secrets. Use `.env.example` as template.

---

## Pre-Deployment Checklist

- [ ] All environment variables configured
- [ ] Local build successful: `npm run build`
- [ ] No lint errors: `npm run lint`
- [ ] Test preview build: `npm run preview`
- [ ] Update `.env.example` (no secrets)
- [ ] README.md updated with deployment info
- [ ] Database migrations completed in Supabase
- [ ] Clerk settings configured (allowed origins, URLs)
- [ ] Git repository clean and pushed

---

## Post-Deployment Verification

After deployment, verify:

1. **URL is accessible**
   - Visit your deployed URL in browser
   - Check for HTTPS/SSL

2. **Environment Variables Loaded**
   - Open browser console (F12)
   - Check no "undefined" errors related to API keys

3. **Authentication Works**
   - Click Login button
   - Verify Clerk sign-in works

4. **Database Connection**
   - Browse to /jobs (if logged in)
   - Verify jobs load from Supabase

5. **File Uploads**
   - Test file upload functionality
   - Verify images/resumes upload to Supabase storage

6. **Performance**
   - Use Lighthouse (Chrome DevTools)
   - Check Core Web Vitals

---

## Troubleshooting

### Build Fails
```bash
# Clear cache and rebuild
rm -rf node_modules dist
npm install
npm run build
```

### Environment Variables Not Loading
- Check variable names match exactly (case-sensitive)
- Ensure variables prefixed with `VITE_` for client-side
- Rebuild after adding variables

### Clerk Not Working
- Verify VITE_CLERK_PUBLISHABLE_KEY is correct
- Check Clerk dashboard for allowed origins
- Add deployment URL to Clerk dashboard

### Supabase Connection Issues
- Verify VITE_SUPABASE_URL is correct
- Check VITE_SUPABASE_PUBLISHABLE_DEFAULT_KEY
- Ensure Row Level Security (RLS) policies allow access

### Images Not Loading
- Check if `public` folder assets exist
- Verify asset paths in code
- Ensure Supabase storage buckets are public if using Supabase

---

## Auto-Deployment Configuration

### Vercel (Automatic)
- Deploys on every push to main branch
- Preview deployments on pull requests
- Rollback available in dashboard

### Netlify (Automatic)
- Same as Vercel
- Check deploy logs: Site → Deploys

### GitHub Actions (Manual Setup)

Create `.github/workflows/deploy.yml`:

```yaml
name: Deploy to Production

on:
  push:
    branches: [main]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: actions/setup-node@v3
        with:
          node-version: 18
      
      - run: npm ci
      - run: npm run build
      - run: npm run lint
      
      # Deploy step (depends on platform)
      # Example for Vercel:
      - uses: vercel/action@master
        with:
          vercel-token: ${{ secrets.VERCEL_TOKEN }}
          vercel-org-id: ${{ secrets.VERCEL_ORG_ID }}
          vercel-project-id: ${{ secrets.VERCEL_PROJECT_ID }}
```

---

## Domain Configuration

### Update Clerk Settings
1. Go to Clerk Dashboard
2. Settings → URLs
3. Add your production domain to:
   - Allowed redirect URLs
   - Allowed sign-in URLs
   - Sign-out URL

### Update Supabase (if needed)
1. Supabase Dashboard
2. Settings → API
3. Verify CORS settings allow your domain

---

## Performance Optimization

Already configured:
- ✅ Vite for fast builds
- ✅ React code splitting
- ✅ Tailwind CSS purging
- ✅ Image optimization in public folder

Additional recommendations:
- Enable Gzip compression (automatic on Vercel/Netlify)
- Use CDN for static assets
- Monitor Core Web Vitals
- Set up error tracking (Sentry)

---

## Security Best Practices

- ✅ Never commit `.env` file
- ✅ Rotate API keys regularly
- ✅ Use environment-specific keys
- ✅ Enable HTTPS (automatic on Vercel/Netlify)
- ✅ Configure CORS properly
- ✅ Use Row Level Security on Supabase
- ✅ Keep dependencies updated
- ✅ Monitor for vulnerabilities: `npm audit`

---

## Monitoring & Logging

### Vercel
- Dashboard → Analytics
- Real-time error tracking
- Performance metrics

### Netlify
- Site → Analytics
- Logs available via CLI
- Error monitoring integration

### Custom Monitoring
```bash
# Monitor build logs locally
npm run build -- --debug
```

---

## Support & Documentation

- **Vite:** https://vitejs.dev
- **React:** https://react.dev
- **Vercel:** https://vercel.com/docs
- **Netlify:** https://docs.netlify.com
- **Supabase:** https://supabase.com/docs
- **Clerk:** https://clerk.com/docs

---

Need help? Check the troubleshooting section or refer to the platform-specific documentation.
