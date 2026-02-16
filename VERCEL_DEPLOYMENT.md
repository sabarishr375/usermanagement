# Vercel Deployment Guide

## 📦 What's Included

This project now has both:
- **Spring Boot Backend** (for local development)
- **Vercel Serverless Functions** (for production deployment)

## 🚀 Deploy to Vercel

### Option 1: Deploy via Vercel Dashboard (Recommended)

1. **Install Vercel CLI** (optional but helpful):
   ```bash
   npm install -g vercel
   ```

2. **Go to Vercel Dashboard**:
   - Visit https://vercel.com
   - Sign in with GitHub
   - Click "Add New Project"
   - Import your `usermanagement` repository

3. **Configure Environment Variables**:
   In Vercel project settings, add:
   
   ```
   DATABASE_URL=postgres://postgres.eidskpfgesrphcwfslap:bBWf5jjX8FX5UhHb@aws-1-ap-south-1.pooler.supabase.com:5432/postgres?sslmode=require
   ```

4. **Deploy**:
   - Click "Deploy"
   - Vercel will automatically detect the configuration
   - Your app will be live in minutes!

### Option 2: Deploy via CLI

1. **Install dependencies**:
   ```bash
   npm install
   ```

2. **Login to Vercel**:
   ```bash
   vercel login
   ```

3. **Deploy**:
   ```bash
   vercel
   ```

4. **Add environment variable**:
   ```bash
   vercel env add DATABASE_URL
   ```
   Paste your Supabase connection string when prompted.

5. **Deploy to production**:
   ```bash
   vercel --prod
   ```

## 📍 API Endpoints (Vercel)

Once deployed, your API will be available at:

```
https://your-project.vercel.app/api/user/create
https://your-project.vercel.app/api/user/getall
https://your-project.vercel.app/api/user/[id]
https://your-project.vercel.app/api/user/update
```

## 🌐 Frontend

The web interface will be available at:
```
https://your-project.vercel.app/
```

## 🔧 Project Structure for Vercel

```
├── api/                          # Serverless functions
│   ├── db.js                     # Database connection
│   └── user/
│       ├── create.js             # POST /api/user/create
│       ├── getall.js             # GET /api/user/getall
│       ├── [id].js               # GET/DELETE /api/user/[id]
│       └── update.js             # PUT /api/user/update
├── public/                       # Static files
│   └── index.html                # Frontend
├── vercel.json                   # Vercel configuration
└── package.json                  # Node.js dependencies
```

## 🔄 Continuous Deployment

Once connected to GitHub:
- Every push to `main` branch automatically deploys to production
- Pull requests create preview deployments
- Rollback to previous deployments anytime

## 🐛 Troubleshooting

### Database Connection Issues
- Verify DATABASE_URL is set in Vercel environment variables
- Check Supabase allows connections from Vercel IPs
- Ensure SSL mode is set to `require`

### API Not Working
- Check Vercel function logs in dashboard
- Verify CORS headers are set correctly
- Test endpoints individually

### Frontend Not Loading
- Ensure `public/index.html` exists
- Check browser console for errors
- Verify API_BASE_URL is set to relative path `/api/user`

## 📊 Monitoring

View logs and analytics in Vercel Dashboard:
- Function execution logs
- Error tracking
- Performance metrics
- Usage statistics

## 💰 Pricing

Vercel Free Tier includes:
- Unlimited deployments
- 100GB bandwidth/month
- Serverless function executions
- Custom domains

Perfect for this project!

## 🔐 Security

Environment variables are:
- Encrypted at rest
- Never exposed to frontend
- Accessible only to serverless functions

## 🎉 Success!

Your app is now deployed globally on Vercel's edge network with:
- ⚡ Fast response times
- 🌍 Global CDN
- 🔄 Auto-scaling
- 📈 Built-in analytics
