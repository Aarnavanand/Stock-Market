# Streamlit Cloud Deployment Guide

## Quick Deploy to Streamlit Cloud

### Prerequisites
- GitHub account
- Code pushed to GitHub repository

### Deployment Steps

1. **Go to Streamlit Cloud**
   - Visit: https://share.streamlit.io/
   - Sign in with GitHub

2. **Create New App**
   - Click "New app"
   - Select your repository: `Aarnavanand/Stock-Market`
   - Branch: `main`
   - Main file path: `stock_predictor.py`

3. **Advanced Settings (Important!)**
   - Python version: `3.11` (specified in runtime.txt)
   - Click "Deploy!"

### Configuration Files Included

✅ **runtime.txt** - Specifies Python 3.11 (avoids Python 3.13 compatibility issues)  
✅ **requirements.txt** - All dependencies with Python 3.11+ compatible versions  
✅ **packages.txt** - System-level dependencies  
✅ **.streamlit/config.toml** - Streamlit configuration  

### What's Different for Production

1. **TensorFlow Removed** ❌
   - Reason: Not compatible with Python 3.13, causes build failures
   - Impact: LSTM model won't run
   - Solution: Other 6 models still work perfectly (SVR, Random Forest, XGBoost, KNN, Gradient Boosting, ARIMA)

2. **pmdarima Removed** ❌
   - Reason: Build issues on Python 3.13
   - Impact: None - uses statsmodels ARIMA instead
   - Solution: Standard ARIMA from statsmodels (already included)

3. **Python 3.11 Locked** ✅
   - Streamlit Cloud defaults to Python 3.13
   - runtime.txt forces Python 3.11
   - All packages work smoothly

### Models Available in Production

✅ **SVR** (Support Vector Regression)  
✅ **Random Forest**  
✅ **XGBoost**  
✅ **KNN** (K-Nearest Neighbors)  
✅ **Gradient Boosting**  
✅ **ARIMA**  
✅ **Prophet** (Facebook's forecasting tool)  
❌ **LSTM** (TensorFlow-based - disabled in production)

**Total: 6-7 models** providing ensemble predictions

### Expected Build Time
- First deployment: 5-10 minutes
- Subsequent deployments: 2-5 minutes

### Monitoring Deployment

Watch the build logs for:
1. ✅ Python 3.11 selection
2. ✅ Package installation progress
3. ✅ NLTK data download
4. ✅ App startup

### Common Issues & Solutions

#### Issue: Build Fails with TensorFlow Error
**Solution:** Already fixed! TensorFlow is removed from requirements.txt

#### Issue: numpy version conflict
**Solution:** Already fixed! numpy version constraint removed for Python 3.11+

#### Issue: Build takes too long / times out
**Solution:** 
- Check if all files are pushed to GitHub
- Verify runtime.txt specifies python-3.11
- Clear Streamlit Cloud cache and redeploy

#### Issue: App runs but shows warnings
**Expected:** You may see "TensorFlow not available" - this is normal and won't affect functionality

### Post-Deployment Testing

Test these features:
1. ✅ Stock symbol input (e.g., AAPL, MSFT)
2. ✅ Historical data fetching
3. ✅ Technical indicators display
4. ✅ Model predictions (should show 6 models)
5. ✅ News sentiment analysis
6. ✅ Prophet forecast
7. ✅ Charts and visualizations

### Performance Tips for Production

1. **Cache Management**
   - App uses `@st.cache_data` for efficiency
   - Data is cached for 1 hour (stock data)
   - News cached for 5 minutes

2. **Resource Limits**
   - Streamlit Cloud free tier: 1GB RAM
   - If app crashes, reduce:
     - Training years (default: 2 years)
     - Forecast days (default: 30 days)
     - Number of technical indicators

3. **Speed Optimization**
   - Models already optimized (reduced epochs, trees)
   - Sequence length reduced to 30
   - Parallel processing where possible

### Environment Variables (Optional)

If you want to use your own News API key:

1. Go to Streamlit Cloud dashboard
2. Click on your app
3. Settings → Secrets
4. Add:
```toml
NEWS_API_KEY = "your_api_key_here"
```

5. Update code to use:
```python
NEWS_API_KEY = st.secrets.get("NEWS_API_KEY", "default_key")
```

### Updating the Deployment

To update your deployed app:

1. Make changes locally
2. Commit and push to GitHub:
```bash
git add .
git commit -m "Update: description"
git push origin main
```

3. Streamlit Cloud auto-detects changes and redeploys

### App URL

Your app will be available at:
```
https://share.streamlit.io/aarnavanand/stock-market/main/stock_predictor.py
```

Or a shorter custom URL (if configured in Streamlit Cloud settings).

### Support & Troubleshooting

If deployment fails:

1. **Check build logs** in Streamlit Cloud dashboard
2. **Verify all files** are in repository:
   - stock_predictor.py
   - requirements.txt
   - runtime.txt
   - packages.txt
   - .streamlit/config.toml

3. **Test locally first**:
```bash
streamlit run stock_predictor.py
```

4. **Common fixes**:
   - Delete app and redeploy
   - Clear browser cache
   - Check GitHub repository is public
   - Verify Python version in runtime.txt

### Production Checklist

Before deploying, ensure:

- [ ] All code changes committed to GitHub
- [ ] runtime.txt contains `python-3.11`
- [ ] requirements.txt doesn't include tensorflow or pmdarima
- [ ] .streamlit/config.toml exists
- [ ] packages.txt exists
- [ ] Code tested locally
- [ ] No hardcoded paths (use relative paths)
- [ ] API keys handled securely (use st.secrets if needed)

### Success Indicators

Your deployment is successful when:

✅ Build completes without errors  
✅ App loads without crashes  
✅ Stock data fetches correctly  
✅ Charts display properly  
✅ Predictions are generated  
✅ No critical errors in logs  

### Monitoring Usage

Streamlit Cloud provides:
- **Analytics** - Viewer count, session duration
- **Logs** - Runtime errors and warnings
- **Resource usage** - Memory and CPU

Access these from your Streamlit Cloud dashboard.

---

## Production is Ready! 🚀

Your stock predictor is now production-ready with:
- ✅ Python 3.11 compatibility
- ✅ All dependency conflicts resolved
- ✅ Optimized performance
- ✅ Graceful handling of missing packages
- ✅ Professional error messages
- ✅ Robust data fetching
- ✅ Multiple prediction models

Deploy with confidence!
