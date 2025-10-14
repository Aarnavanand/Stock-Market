# Quick Git Push Commands

## Push All Fixes to GitHub

```bash
# Navigate to your project directory
cd "c:\Users\aarna\Downloads\stock-predictor-main\stock-predictor-main"

# Check what files changed
git status

# Add all changes
git add .

# Commit with descriptive message
git commit -m "Fix all errors: Prophet NaN, Volume_Rate, Streamlit Cloud Python 3.11"

# Push to GitHub
git push origin main
```

## If Git Asks for Credentials

### Option 1: GitHub Token (Recommended)
1. Go to GitHub.com → Settings → Developer settings → Personal access tokens
2. Generate new token (classic)
3. Select scopes: `repo`
4. Copy the token
5. Use token as password when pushing

### Option 2: GitHub Desktop
1. Open GitHub Desktop
2. It will show all changes
3. Add commit message
4. Click "Commit to main"
5. Click "Push origin"

## After Pushing

1. Go to https://share.streamlit.io
2. Sign in with GitHub
3. Click "New app"
4. Select repository: `Aarnavanand/Stock-Market`
5. Set main file: `stock_predictor.py`
6. Click "Deploy"

## Verify Deployment

Check logs for:
```
✅ Using Python 3.11.11 environment at /home/adminuser/venv
✅ Installing from requirements.txt...
✅ Successfully installed all packages
✅ Starting Streamlit app...
```

## If You See Errors

Check `STREAMLIT_CLOUD_FIX.md` for troubleshooting steps.

---

**All files are ready - just push and deploy!** 🚀
