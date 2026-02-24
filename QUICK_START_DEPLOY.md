# Quick Start Deployment Guide

## 🚀 5-Minute Deployment to Vercel (Recommended)

### Step 1: Prepare Your Repository
```bash
# Ensure you have git configured
git config --global user.email "your-email@example.com"
git config --global user.name "Your Name"

# Push code to GitHub (create repo first on github.com)
git add .
git commit -m "Ready for deployment"
git push origin main
```

### Step 2: Deploy to Vercel
1. Visit https://vercel.com/signup
2. Sign up with GitHub account
3. Click "Add New" → "Project"
4. Select your "job-portal" repository
5. Click "Import"

### Step 3: Configure Environment Variables
In Vercel dashboard:
1. Click on your project
2. Go to **Settings** → **Environment Variables**
3. Add these variables:

| Name | Value |
|------|-------|
| `VITE_SUPABASE_URL` | From Supabase Settings > API |
| `VITE_SUPABASE_PUBLISHABLE_DEFAULT_KEY` | From Supabase Settings > API |
| `VITE_CLERK_PUBLISHABLE_KEY` | From Clerk Dashboard > API Keys |

4. Click **Save** for each variable
5. Set environment to: **Production** and **Development**

### Step 4: Deploy
- Click **Deploy** button
- Wait for build to complete (2-3 minutes)
- Visit your deployment at `your-project.vercel.app`

✅ **Done!** Your app is live.

---

## 📋 Pre-Deployment Checklist

Before deploying, ensure you have:

###1. Supabase Setup
- [ ] Supabase account created
- [ ] Database project created
- [ ] Tables created (jobs, companies, applications, saved_jobs, etc.)
- [ ] Row Level Security policies configured
- [ ] Anon API key copied

### 2. Clerk Setup
- [ ] Clerk account created
- [ ] Application created
- [ ] Publishable key copied
- [ ] Clerk dashboard > Settings > URLs > Add allowed domain

### 3. Local Testing
- [ ] Run `npm install`
- [ ] Run `npm run build` (succeeds)
- [ ] Run `npm run lint` (no errors)
- [ ] Run `npm run preview` (works locally)
- [ ] Test login with Clerk
- [ ] Test job listing from Supabase

### 4. Repository
- [ ] Code pushed to GitHub main branch
- [ ] `.env` file in `.gitignore`
- [ ] `.env.example` file updated
- [ ] README.md updated

### 5. Environment Variables
- [ ] Copied all 3 environment variables
- [ ] Variables are correct (no typos)
- [ ] No sensitive data in code

---

## 🔧 Environment Variables Reference

### Get Supabase Values
1. Go to https://app.supabase.com
2. Select your project
3. Click **Settings** (gear icon, bottom left)
4. Click **API**
5. Copy:
   - **Project URL** → `VITE_SUPABASE_URL`
   - **anon public** key → `VITE_SUPABASE_PUBLISHABLE_DEFAULT_KEY`

### Get Clerk Values
1. Go to https://dashboard.clerk.com
2. Select your app
3. Click **API Keys** (left sidebar)
4. Copy **Publishable Key** → `VITE_CLERK_PUBLISHABLE_KEY`

---

## 📱 Alternative Deployment Options

### Netlify
1. Connect GitHub at https://netlify.com
2. Build command: `npm run build`
3. Publish directory: `dist`
4. Add same environment variables
5. Deploy

### Docker
```bash
docker build -t job-portal .
docker run -p 3000:3000 -e VITE_SUPABASE_URL=... job-portal
```

### Heroku
```bash
heroku login
heroku create your-app-name
git push heroku main
heroku config:set VITE_SUPABASE_URL=...
heroku config:set VITE_SUPABASE_PUBLISHABLE_DEFAULT_KEY=...
heroku config:set VITE_CLERK_PUBLISHABLE_KEY=...
```

---

## ✅ Post-Deployment Verification

After deployment, test these:

1. **Visit your deployment URL** - App should load
2. **Check browser console** (F12) - No error messages
3. **Test login flow**
   - Click "Login"
   - Clerk modal appears
   - Able to sign up/login
4. **Test job listing**
   - Navigate to /jobs
   - Jobs load from Supabase
   - Able to view job details
5. **Check HTTPS** - URL shows 🔒 icon
6. **Monitor deployment**
   - Vercel: Dashboard > Deployments
   - Netlify: Site > Deploys

---

## 🐛 Common Issues & Solutions

### Issue: Build Fails
**Solution:**
```bash
rm -rf node_modules dist
npm install
npm run build
```

### Issue: "Cannot find module @/..."
**Solution:** Check vite.config.js has path alias configured (already done)

### Issue: Environment variables undefined
**Solution:**
- Redeploy application
- Clear browser cache
- Variables must start with `VITE_`

### Issue: Clerk login not working
**Solution:**
1. Go to Clerk Dashboard
2. Settings → URLs
3. Add your deployment URL to "Allowed Websites"
4. Redeploy

### Issue: Jobs not loading
**Solution:**
1. Check Supabase Row Level Security policies
2. Verify database tables exist with correct names
3. Check browser console for Supabase error messages

---

## 📊 Deployment Monitoring

### Vercel Analytics
- Dashboard shows request metrics
- Error tracking available
- Performance insights
- Logs available in "Logs" tab

### Optimize Performance
- Vite already configured for optimization
- Enable compression in Vercel settings
- Use CDN (automatic)
- Monitor Core Web Vitals

---

## 🔄 Continuous Deployment

After initial deployment:

1. **Automatic deploys** enabled
2. Push to main branch: `git push origin main`
3. Vercel automatically rebuilds and deploys
4. Preview deployments for pull requests

---

## 📚 Detailed Guides

For more information, see:
- [DEPLOYMENT.md](./DEPLOYMENT.md) - Comprehensive deployment guide
- [ENV_SETUP.md](./ENV_SETUP.md) - Environment variables explained
- [Vercel Docs](https://vercel.com/docs)
- [Netlify Docs](https://docs.netlify.com)

---

## 🆘 Need Help?

1. **Can't find values?** See ENV_SETUP.md
2. **Deployment failing?** Check DEPLOYMENT.md troubleshooting
3. **Local issues?** Run `npm run build` to debug

**You got this! 🚀**
