
# 💼 Job Portal - Full-Stack Job Management Platform

<div align="center">

![React](https://img.shields.io/badge/React-18.3.1-61DAFB?style=flat-square&logo=react)
![Vite](https://img.shields.io/badge/Vite-Latest-646CFF?style=flat-square&logo=vite)
![Tailwind CSS](https://img.shields.io/badge/Tailwind_CSS-3.4.7-06B6D4?style=flat-square&logo=tailwindcss)
![Supabase](https://img.shields.io/badge/Supabase-Database-3ECF8E?style=flat-square&logo=supabase)
![Clerk](https://img.shields.io/badge/Clerk-Auth-6C47FF?style=flat-square&logo=clerk)

A modern, full-stack job portal application built with React and powered by Supabase, enabling users to discover opportunities, post jobs, and manage applications seamlessly.

[Demo](#-live-demo) • [Features](#-features) • [Tech Stack](#-tech-stack) • [Installation](#-installation) • [Usage](#-usage)

</div>

---

## 🎯 Overview

**Job Portal** is a comprehensive job management platform that bridges the gap between job seekers and employers. Built with modern web technologies, it provides an intuitive interface for browsing jobs, managing applications, and posting opportunities with real-time updates powered by Supabase.

---

## ✨ Features

### 🔐 **Authentication & Authorization**
- Secure sign-up and login with **Clerk**
- Role-based access control (Job Seeker / Employer)
- Protected routes and user sessions
- Onboarding flow for new users

### 💼 **Job Seeker Features**
- ⭐ **Browse & Search Jobs** - Explore detailed job listings with filters
- 🔖 **Save Jobs** - Bookmark your favorite opportunities
- 📝 **Apply to Jobs** - One-click application submission
- 📊 **Track Applications** - Monitor status of all submissions
- 👤 **User Profile** - Manage personal and professional information

### 🏢 **Employer Features**
- ➕ **Post Jobs** - Create and publish job listings easily
- 📋 **Manage Jobs** - Edit, update, or delete posted positions
- 👥 **View Applications** - See all received applications with candidate details
- 📈 **Job Analytics** - Track job performance and engagement
- 🏷️ **Company Management** - Add and manage company information

### 🎨 **User Experience**
- 🌙 **Dark & Light Mode** - Theme switcher for comfortable viewing
- 📱 **Fully Responsive** - Optimized for all devices (mobile, tablet, desktop)
- ⚡ **Real-time Updates** - Instant data synchronization with Supabase
- 🚀 **Fast Performance** - Built with Vite for lightning-fast load times
- 🎪 **Interactive Carousel** - Featured companies showcase
- ❓ **FAQ Section** - Helpful information for users

---

## 🛠️ Tech Stack

### **Frontend**
- **React 18.3.1** - Modern UI library with hooks
- **Vite** - Next-generation build tool
- **Tailwind CSS 3.4.7** - Utility-first CSS framework
- **Shadcn/ui** - High-quality React components
- **React Router v6** - Client-side routing
- **React Hook Form** - Efficient form management
- **Zod** - TypeScript-first schema validation

### **Backend & Database**
- **Supabase** - PostgreSQL database with real-time capabilities
- **Supabase Auth** - Row-level security policies

### **Authentication**
- **Clerk** - Modern authentication and user management

### **Additional Libraries**
- **Lucide React** - Beautiful icon set
- **Embla Carousel** - Carousel component with autoplay
- **React MD Editor** - Markdown editor for rich text
- **React Spinners** - Loading animations
- **Country State City** - Location data

---

## 📁 Project Structure

```
job-portal/
├── public/
│   └── companies/              # Company logos and assets
├── src/
│   ├── api/                    # API integration layer
│   │   ├── apiApplication.js   # Application endpoints
│   │   ├── apiCompanies.js     # Company endpoints
│   │   └── apiJobs.js          # Job endpoints
│   ├── components/
│   │   ├── ui/                 # Reusable UI components
│   │   ├── header.jsx          # Navigation header
│   │   ├── protected-route.jsx # Route protection
│   │   ├── theme-provider.jsx  # Dark/light mode
│   │   └── ...
│   ├── pages/                  # Page components
│   │   ├── landing.jsx         # Home page
│   │   ├── jobListing.jsx      # Jobs browse page
│   │   ├── job.jsx             # Job detail page
│   │   ├── post-job.jsx        # Post job form
│   │   ├── my-jobs.jsx         # Employer jobs list
│   │   ├── saved-jobs.jsx      # Saved jobs
│   │   └── onboarding.jsx      # User setup
│   ├── hooks/
│   │   └── use-fetch.js        # Custom fetch hook
│   ├── lib/
│   │   ├── utils.js            # Utility functions
│   │   └── supabase.js         # Supabase client
│   ├── layouts/
│   │   └── app-layout.jsx      # Main layout wrapper
│   ├── data/
│   │   ├── companies.json      # Companies data
│   │   └── faq.json            # FAQ content
│   ├── App.jsx                 # Root component
│   └── main.jsx                # Entry point
├── package.json
├── vite.config.js
├── tailwind.config.js
└── postcss.config.js
```

---

## 🚀 Getting Started

### Prerequisites
- **Node.js** 16+ and npm/yarn
- **Git** for version control
- A **Supabase** account (free tier available)
- A **Clerk** account (free tier available)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/job-portal.git
   cd job-portal
   ```

2. **Install dependencies**
   ```bash
   npm install
   # or
   yarn install
   ```

3. **Create `.env` file**
   
   Create a `.env` file in the project root with the following variables:
   ```env
   VITE_SUPABASE_URL=your_supabase_url
   VITE_SUPABASE_ANON_KEY=your_supabase_anon_key
   VITE_CLERK_PUBLISHABLE_KEY=your_clerk_publishable_key
   ```

   **How to get these credentials:**
   - **Supabase**: 
     1. Go to [supabase.com](https://supabase.com) and create a project
     2. Navigate to Settings → API → Copy your URL and anon key
   
   - **Clerk**:
     1. Visit [clerk.com](https://clerk.com) and create an application
     2. Go to API Keys and copy your publishable key

4. **Start development server**
   ```bash
   npm run dev
   ```
   The application will be available at `http://localhost:5173`

---

## 📖 Usage Guide

### For Job Seekers

1. **Sign Up** - Create your account using email, Google, or GitHub
2. **Complete Onboarding** - Set your role and preferences
3. **Browse Jobs** - Search and filter jobs by location, company, and salary
4. **Save Jobs** - Click the heart icon to save your favorites
5. **Apply** - Submit your application directly from the job detail page
6. **Track Applications** - View all your submissions in the "My Applications" section

### For Employers

1. **Sign Up** - Create an employer account
2. **Add Company** - Complete your company profile
3. **Post Job** - Create and publish job listings with rich descriptions
4. **Manage Jobs** - Edit, promote, or close job listings
5. **View Applications** - Review candidate applications and resumes
6. **Track Performance** - Monitor job views and applications

---

## 🎨 Customization

### Tailwind Configuration
Customize colors, fonts, and spacing in [tailwind.config.js](tailwind.config.js)

### Component Styling
All UI components are in `src/components/ui/` and use Tailwind CSS classes

### Theme
Toggle between dark and light modes using the theme provider in the header

---

## 🔗 Environment Variables Reference

| Variable | Description | Example |
|----------|-------------|---------|
| `VITE_SUPABASE_URL` | Your Supabase project URL | `https://xxxxx.supabase.co` |
| `VITE_SUPABASE_ANON_KEY` | Supabase anonymous key | `eyJhbGc...` |
| `VITE_CLERK_PUBLISHABLE_KEY` | Clerk publishable key | `pk_test_...` |

---

## 📦 Build & Deployment

### Build for Production
```bash
npm run build
```
Output will be in the `dist/` directory

### Preview Production Build
```bash
npm run preview
```

### Deploy to Vercel (Recommended)
```bash
npm install -g vercel
vercel
```

The project includes `vercel.json` configuration for automatic deployment.

---

## 🧪 Testing

### Run Linter
```bash
npm run lint
```

---

## 📚 Key Components

### `useFetch` Hook
Custom hook for API calls with loading and error handling
```javascript
const { data, loading, error } = useFetch(apiFunction, dependency);
```

### Protected Routes
Ensures only authenticated users can access certain pages
```javascript
<ProtectedRoute>
  <JobListing />
</ProtectedRoute>
```

### Theme Provider
Manages light/dark mode across the application

---

## 🤝 Contributing

Contributions are welcome! Here's how to get started:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 🐛 Troubleshooting

### Common Issues

**Issue**: "Cannot find module" errors
```bash
# Solution: Reinstall dependencies
rm -rf node_modules package-lock.json
npm install
```

**Issue**: Environment variables not loading
```bash
# Solution: Restart dev server
npm run dev
```

**Issue**: Supabase connection errors
- Verify your `.env` file has correct credentials
- Check Supabase project is active
- Ensure Row Level Security (RLS) policies are configured

---

## 📈 Performance Optimizations

- ✅ **Code Splitting** - Routes are lazy-loaded
- ✅ **Image Optimization** - Optimized company logos
- ✅ **Caching** - Supabase real-time sync
- ✅ **Bundle Optimization** - Vite's tree-shaking
- ✅ **CSS Purging** - Tailwind removes unused styles

---

## 🎓 Learning Resources

- [React Documentation](https://react.dev)
- [Vite Guide](https://vitejs.dev)
- [Tailwind CSS Docs](https://tailwindcss.com/docs)
- [Supabase Docs](https://supabase.com/docs)
- [Clerk Documentation](https://clerk.com/docs)
- [React Router Docs](https://reactrouter.com)

---



## 🙏 Acknowledgments

- Thanks to [Shadcn](https://ui.shadcn.com) for the UI components
- [Supabase](https://supabase.com) for the backend infrastructure
- [Clerk](https://clerk.com) for authentication
- All open-source contributors

---


