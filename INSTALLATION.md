# Installation Guide - Stock Predictor

## Quick Start (Recommended)

### Option 1: Using the Setup Script (Easiest)

1. Open PowerShell in this directory
2. Run the setup script:
```powershell
.\setup.ps1
```

### Option 2: Manual Installation

1. **Install core dependencies first:**
```powershell
pip install "numpy>=1.21.2,<2.0.0" "pandas>=1.3.0" "scipy>=1.7.0"
```

2. **Install all requirements:**
```powershell
pip install --upgrade -r requirements.txt
```

3. **Download NLTK data:**
```powershell
python -c "import nltk; nltk.download('vader_lexicon'); nltk.download('punkt')"
```

4. **Run the application:**
```powershell
streamlit run stock_predictor.py
```

## Python Version Compatibility

### ✅ Recommended Python Versions:
- Python 3.9
- Python 3.10
- Python 3.11
- Python 3.12

### ⚠️ Not Recommended:
- **Python 3.13+**: Some packages (especially TensorFlow and others) may not have wheels available yet
- **Python 3.8 or older**: May work but not tested

## Troubleshooting

### Issue: pmdarima installation fails

**Solution:** pmdarima has been removed from requirements.txt because:
- It has compatibility issues with Python 3.13
- It requires complex build dependencies
- The app now uses statsmodels ARIMA instead (already included)

**What this means:** The app will use standard ARIMA from statsmodels, which works just as well for most use cases.

### Issue: TensorFlow installation fails

**Common on Python 3.13+**

**Solutions:**
1. **Downgrade to Python 3.11 or 3.12** (recommended)
   ```powershell
   # Download and install Python 3.12 from python.org
   # Then recreate your environment
   ```

2. **Use TensorFlow nightly build** (advanced)
   ```powershell
   pip install tf-nightly
   ```

3. **Skip TensorFlow** (will disable LSTM model but other models still work)
   - Edit requirements.txt and comment out tensorflow

### Issue: "No module named 'numpy'" during installation

**Solution:** Install numpy first before other packages
```powershell
pip install "numpy>=1.21.2,<2.0.0"
pip install -r requirements.txt
```

### Issue: Installation is very slow

**Solution:** Use a faster package installer
```powershell
# Option 1: Use pip with cache
pip install --cache-dir .cache -r requirements.txt

# Option 2: Install core packages separately first
pip install numpy pandas scipy scikit-learn
pip install -r requirements.txt
```

### Issue: "Microsoft Visual C++ 14.0 is required" (Windows)

**Solution:** Install Microsoft C++ Build Tools
1. Download from: https://visualstudio.microsoft.com/visual-cpp-build-tools/
2. Install "Desktop development with C++"
3. Retry installation

### Issue: Package conflicts

**Solution:** Use a virtual environment
```powershell
# Create virtual environment
python -m venv venv

# Activate it
.\venv\Scripts\Activate.ps1

# Install packages
pip install --upgrade -r requirements.txt
```

## Virtual Environment Setup (Recommended)

Using a virtual environment prevents package conflicts:

```powershell
# Create virtual environment
python -m venv venv

# Activate virtual environment
.\venv\Scripts\Activate.ps1

# Upgrade pip
python -m pip install --upgrade pip

# Install packages
pip install "numpy>=1.21.2,<2.0.0" "pandas>=1.3.0" "scipy>=1.7.0"
pip install -r requirements.txt

# Download NLTK data
python -c "import nltk; nltk.download('vader_lexicon'); nltk.download('punkt')"

# Run the app
streamlit run stock_predictor.py

# When done, deactivate
deactivate
```

## Package Notes

### Core Dependencies (Installed First)
- **numpy**: Must be installed before packages that depend on it
- **pandas**: Data manipulation
- **scipy**: Scientific computing

### Optional Dependencies
- **pmdarima**: Removed due to Python 3.13 incompatibility
  - Standard ARIMA from statsmodels is used instead
  - No functionality is lost

### Required API Keys
- **News API**: Already included in code (free tier)
- **No additional API keys needed**

## Verifying Installation

Run this command to verify all packages are installed:

```powershell
python -c "import streamlit, pandas, numpy, yfinance, sklearn, tensorflow; print('✓ All core packages imported successfully')"
```

## Running the Application

```powershell
streamlit run stock_predictor.py
```

The app will open in your default browser at `http://localhost:8501`

## Performance Tips

1. **First run will be slow**: Models need to download and train
2. **Use caching**: Streamlit caches results - don't clear cache unnecessarily
3. **Reduce training years**: In the code, default is 2 years (already optimized)
4. **Choose fewer models**: You can disable some models if prediction is too slow

## Getting Help

If you encounter issues:

1. Check this guide first
2. Verify Python version: `python --version`
3. Check installed packages: `pip list`
4. Look for error messages in the terminal
5. Try running with verbose output: `streamlit run stock_predictor.py --logger.level=debug`

## System Requirements

- **OS**: Windows 10/11, macOS, Linux
- **RAM**: 4GB minimum, 8GB recommended
- **Python**: 3.9-3.12
- **Internet**: Required for fetching stock data and news
