# Vercel Deployment Guide

## 🚀 Deploy to Vercel (Step by Step)

### Step 1: Push Code to GitHub

Your code is already on GitHub at: `https://github.com/sabarishr375/usermanagement`

### Step 2: Import Project to Vercel

1. Go to https://vercel.com
2. Click **"Add New Project"**
3. Click **"Import Git Repository"**
4. Select your `usermanagement` repository
5. Click **"Import"**

### Step 3: Configure Project

Vercel will auto-detect the configuration from `vercel.json`. Just click **"Deploy"** for now.

### Step 4: Add Environment Variable (IMPORTANT!)

After the first deployment (it may fail, that's okay):

1. Go to your project dashboard on Vercel
2. Click **"Settings"** tab
3. Click **"Environment Variables"** in the left sidebar
4. Add the following variable:

   **Variable Name:**
   ```
   DATABASE_URL
   ```

   **Variable Value:**
   ```
   postgres://postgres.eidskpfgesrphcwfslap:bBWf5jjX8FX5UhHb@aws-1-ap-south-1.pooler.supabase.com:5432/postgres?sslmode=require
   ```

   **Environment:** Select all (Production, Preview, Development)

5. Click **"Save"**

### Step 5: Redeploy

1. Go to **"Deployments"** tab
2. Click the three dots (...) on the latest deployment
3. Click **"Redeploy"**
4. Wait for deployment to complete

### Step 6: Test Your App

Your app will be live at: `https://usermanagement-[random].vercel.app`

Test the endpoints:
- Frontend: `https://your-app.vercel.app/`
- API: `https://your-app.vercel.app/api/user/getall`

## 📍 API Endpoints

```
POST   /api/user/create
GET    /api/user/getall
GET    /api/user/[id]
PUT    /api/user/update
DELETE /api/user/[id]
```

## 🔄 Automatic Deployments

Once set up:
- Every push to `main` branch → Auto-deploys to production
- Pull requests → Create preview deployments

## 🔐 Security Notes

- Environment variables are encrypted
- Never commit `.env` files
- DATABASE_URL is only accessible to serverless functions
- Not exposed to frontend/browser

## 🐛 Troubleshooting

### Deployment Fails
- Check you added `DATABASE_URL` environment variable
- Verify the connection string is correct
- Check Vercel function logs for errors

### Database Connection Error
- Ensure Supabase allows connections from any IP (0.0.0.0/0)
- Verify SSL mode is set to `require`
- Test connection string locally first

### API Returns 500 Error
- Check Vercel function logs in dashboard
- Verify database table `users` exists
- Ensure table has correct columns (id, username, name, email, created_at, updated_at)

## 📊 View Logs

1. Go to Vercel Dashboard
2. Select your project
3. Click **"Logs"** or **"Functions"** tab
4. View real-time logs and errors

## 💡 Tips

- Use Vercel CLI for faster deployments: `npm i -g vercel`
- Test locally: `vercel dev`
- View analytics in Vercel dashboard
- Set up custom domain in project settings

## ✅ Checklist

- [ ] Code pushed to GitHub
- [ ] Project imported to Vercel
- [ ] DATABASE_URL environment variable added
- [ ] Redeployed after adding env variable
- [ ] Tested frontend at your-app.vercel.app
- [ ] Tested API endpoints

## 🎉 Success!

Your app is now live on Vercel with:
- ⚡ Global CDN
- 🔄 Auto-scaling
- 📈 Analytics
- 🌍 Edge network
