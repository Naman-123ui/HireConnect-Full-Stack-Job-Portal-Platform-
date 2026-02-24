# Environment Variables Configuration Guide

This document explains all environment variables needed for the Job Portal deployment.

## Variables Required

### Supabase Variables

**VITE_SUPABASE_URL**
- What: Your Supabase project URL
- Where to get:
  1. Go to Supabase Dashboard: https://app.supabase.com
  2. Select your project
  3. Go to Settings > API
  4. Copy the "Project URL"
- Example: `https://fvtyeymnckxzjowlnskq.supabase.co`

**VITE_SUPABASE_PUBLISHABLE_DEFAULT_KEY**
- What: Your Supabase Anon/Public API Key
- Where to get:
  1. Same page as above (Settings > API)
  2. Look for "anon public" key
  3. Copy the key
- Example: `sb_publishable_xf4uJGSTGAbegMdKkQ7L2A__OmZx3Lc`

### Clerk Variables

**VITE_CLERK_PUBLISHABLE_KEY**
- What: Your Clerk publishable key for frontend authentication
- Where to get:
  1. Go to Clerk Dashboard: https://dashboard.clerk.com
  2. Select your application
  3. Go to API Keys
  4. Copy the "Publishable Key"
- Example: `pk_test_bm90ZWQtdHJvdXQtMS5jbGVyay5hY2NvdW50cy5kZXYk`

## Setting Variables in Different Platforms

### Vercel

1. Go to your project dashboard
2. Settings → Environment Variables
3. For each variable:
   - Name: `VITE_SUPABASE_URL` (exact case)
   - Value: Your value
   - Environment: Select Production and Development
4. Click "Save"
5. Redeploy with "Redeploy" button

### Netlify

1. Go to your site settings
2. Build & deploy → Environment
3. Click "Edit variables"
4. Add each variable
5. Trigger a new deploy

### Docker / Local

Create a `.env` file from `.env.example`:

```bash
cp .env.example .env
```

Then edit `.env` with your actual values.

## Security Best Practices

✅ **DO:**
- Store secrets in environment variables only
- Use different keys for development/production
- Rotate keys regularly
- Use strong, unique values
- Keep `.env` file in `.gitignore`

❌ **DON'T:**
- Commit `.env` file to git
- Share environment variables in chat/email
- Use development keys in production
- Hardcode secrets in source code
- Log environment variables

## Verification

After setting variables, verify they're loaded:

```javascript
// In browser console
console.log(import.meta.env.VITE_SUPABASE_URL)
```

Should show your Supabase URL, not `undefined`.

## Troubleshooting

### Variables show as "undefined"

- Redeploy the application
- Variables must be prefixed with `VITE_` for frontend
- Check variable names exactly match (case-sensitive)
- Wait a few minutes and refresh

### Supabase connection fails

- Verify VITE_SUPABASE_URL is correct
- Check VITE_SUPABASE_PUBLISHABLE_DEFAULT_KEY
- Ensure Row Level Security allows access
- Check Supabase dashboard for errors

### Clerk authentication fails

- Verify VITE_CLERK_PUBLISHABLE_KEY
- Add deployment domain to Clerk dashboard
  - Dashboard > Settings > URLs
  - Add your app URL to "Allowed Websites"
- Clear browser cache

## Production vs Development

For production, you might want separate Supabase/Clerk projects:

### Development (localhost)
- Supabase: Development project
- Clerk: Development application

### Production (deployed)
- Supabase: Production project
- Clerk: Production application

Use different keys for each environment.
