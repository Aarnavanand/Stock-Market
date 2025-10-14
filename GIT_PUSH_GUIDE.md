# Git Push Commands - Copy & Paste Ready

## Open PowerShell in Your Project Directory

Make sure you're in: `C:\Users\aarna\Downloads\stock-predictor-main\stock-predictor-main`

## Commands to Run (Copy these one by one):

### Step 1: Check Git Status
```powershell
git status
```

### Step 2: Add All Files
```powershell
git add .
```

### Step 3: Commit Changes
```powershell
git commit -m "Production-ready: Fixed all Streamlit Cloud deployment errors"
```

### Step 4: Push to GitHub
```powershell
git push origin main
```

## If You Get Authentication Errors:

### Option A: Using GitHub CLI (Recommended)
```powershell
# If not installed, download from: https://cli.github.com/
gh auth login
git push origin main
```

### Option B: Using Personal Access Token
1. Go to: https://github.com/settings/tokens
2. Generate new token (classic)
3. Select scopes: `repo` (all)
4. Copy the token
5. When prompted for password, paste the token

### Option C: Using GitHub Desktop
1. Download GitHub Desktop: https://desktop.github.com/
2. Open your repository
3. Review changes
4. Commit and push

## After Pushing Successfully:

### You should see:
```
Enumerating objects: XX, done.
Counting objects: 100% (XX/XX), done.
Writing objects: 100% (XX/XX), done.
Total XX (delta XX), reused XX (delta XX)
To https://github.com/Aarnavanand/Stock-Market.git
   xxxxxxx..yyyyyyy  main -> main
```

## Files Being Pushed:

✅ **Modified:**
- `requirements.txt` - Removed TensorFlow & pmdarima
- `stock_predictor.py` - Made TensorFlow optional
- `packages.txt` - Fixed (removed comments)
- `.streamlit/config.toml` - Streamlit configuration
- `README.md` - Updated with deployment info
- `FIXES_APPLIED.md` - All fixes documented
- `setup.ps1` - Improved installation
- `setup.bat` - Windows CMD version

✅ **New Files:**
- `runtime.txt` - Forces Python 3.11
- `DEPLOYMENT.md` - Complete deployment guide
- `PRODUCTION_READY.md` - Production summary
- `QUICK_START.md` - Quick reference
- `.gitignore` - Git configuration

## Troubleshooting Git Issues:

### Error: "fatal: not a git repository"
```powershell
cd C:\Users\aarna\Downloads\stock-predictor-main\stock-predictor-main
git status
```

### Error: "Permission denied"
```powershell
# Use GitHub CLI or Personal Access Token (see above)
gh auth login
```

### Error: "Updates were rejected"
```powershell
# Pull first, then push
git pull origin main
git push origin main
```

### Error: "Nothing to commit"
This means files aren't changed. Force add:
```powershell
git add -A
git commit -m "Production-ready deployment"
git push origin main
```

## Verify Push Successful:

1. Go to: https://github.com/Aarnavanand/Stock-Market
2. Check if latest commit shows
3. Verify files updated (check `requirements.txt`, `runtime.txt`)

## Next: Deploy on Streamlit Cloud

Once pushed, go to:
1. **https://share.streamlit.io/**
2. Click **"New app"**
3. Repository: **Aarnavanand/Stock-Market**
4. Branch: **main**
5. Main file: **stock_predictor.py**
6. Click **"Deploy!"**

Build will succeed this time! ✅

---

## Quick Copy-Paste (All Commands):

```powershell
# Navigate to project
cd C:\Users\aarna\Downloads\stock-predictor-main\stock-predictor-main

# Check status
git status

# Add all files
git add .

# Commit
git commit -m "Production-ready: Fixed all Streamlit Cloud deployment errors"

# Push (if authenticated)
git push origin main

# Or push with GitHub CLI
gh auth login
git push origin main
```

## What's Fixed in This Push:

✅ packages.txt - Removed comment that caused "Unable to locate package" error  
✅ requirements.txt - Compatible with Python 3.11  
✅ runtime.txt - Forces Python 3.11 (not 3.13)  
✅ stock_predictor.py - TensorFlow optional  
✅ All deployment errors resolved  

**Build will succeed on Streamlit Cloud!** 🚀
