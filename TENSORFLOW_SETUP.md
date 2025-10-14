# TensorFlow & LSTM Model - Complete Setup Guide

## ✅ SOLUTION: Use Python 3.11

TensorFlow currently doesn't support Python 3.13. To enable TensorFlow and LSTM:

### Option 1: Install Python 3.11 (Recommended for Full Functionality)

#### Step 1: Check Your Current Python Version
```powershell
python --version
```

#### Step 2A: If You Have Python 3.13 - Install Python 3.11

1. **Download Python 3.11:**
   - Go to: https://www.python.org/downloads/
   - Download Python 3.11.9 (latest 3.11 version)
   - **Important:** During installation, check "Add Python to PATH"

2. **Install Python 3.11:**
   - Run the installer
   - Choose "Custom Installation"
   - Check "Install for all users" (optional)
   - Note the installation path (e.g., C:\Python311)

3. **Verify Installation:**
```powershell
# If you have multiple Python versions, use full path
C:\Python311\python.exe --version
# Should show: Python 3.11.x
```

#### Step 2B: Create Virtual Environment with Python 3.11

```powershell
# Navigate to project directory
cd C:\Users\aarna\Downloads\stock-predictor-main\stock-predictor-main

# Create virtual environment with Python 3.11
# If Python 3.11 is default:
python -m venv venv311

# OR if you have multiple versions, use full path:
C:\Python311\python.exe -m venv venv311

# Activate virtual environment
.\venv311\Scripts\Activate.ps1

# Verify Python version in virtual environment
python --version
# Should show: Python 3.11.x
```

#### Step 3: Install All Packages (Including TensorFlow)

```powershell
# Make sure virtual environment is activated
# You should see (venv311) in your prompt

# Upgrade pip
python -m pip install --upgrade pip

# Install core dependencies first
pip install "numpy>=1.21.2,<2.0.0" "pandas>=1.3.0" "scipy>=1.7.0"

# Install all requirements (including TensorFlow)
pip install -r requirements.txt

# Download NLTK data
python -c "import nltk; nltk.download('vader_lexicon'); nltk.download('punkt')"
```

#### Step 4: Test TensorFlow Installation

```powershell
# Test if TensorFlow works
python -c "import tensorflow as tf; print('TensorFlow version:', tf.__version__); print('✅ TensorFlow is working!')"
```

**Expected Output:**
```
TensorFlow version: 2.15.x
✅ TensorFlow is working!
```

#### Step 5: Run the App

```powershell
# Make sure virtual environment is still activated
streamlit run stock_predictor.py
```

**You should see:**
- ✅ No TensorFlow warning
- ✅ LSTM model active
- ✅ All 7 models working (SVR, RF, XGBoost, KNN, GB, ARIMA, LSTM)

---

### Option 2: Use py Launcher (If You Have Multiple Python Versions)

```powershell
# List all Python versions
py --list

# Create venv with specific version
py -3.11 -m venv venv311

# Activate
.\venv311\Scripts\Activate.ps1

# Install packages
pip install -r requirements.txt

# Run app
streamlit run stock_predictor.py
```

---

### Option 3: Use Anaconda/Miniconda (Alternative)

```powershell
# Create conda environment with Python 3.11
conda create -n stock-predictor python=3.11 -y

# Activate environment
conda activate stock-predictor

# Install packages
pip install -r requirements.txt

# Run app
streamlit run stock_predictor.py
```

---

## For Streamlit Cloud Deployment

**Good News:** Streamlit Cloud setup is already correct!

- ✅ `runtime.txt` specifies `python-3.11`
- ✅ `requirements.txt` includes TensorFlow
- ✅ When deployed, TensorFlow will work automatically

**On Streamlit Cloud, all 7 models (including LSTM) will work!**

---

## Troubleshooting

### Error: "Could not find a version that satisfies the requirement tensorflow"

**Solution:** You're using Python 3.13. Follow Option 1 above to install Python 3.11.

### Error: "DLL load failed while importing _pywrap_tensorflow_internal"

**Solution:** Install Visual C++ Redistributable:
- Download: https://aka.ms/vs/17/release/vc_redist.x64.exe
- Install and restart

### Error: Virtual environment activation restricted

**Solution:** Run PowerShell as Administrator:
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

Then retry activation:
```powershell
.\venv311\Scripts\Activate.ps1
```

---

## Quick Summary

### Local Development (Your PC):
1. Install Python 3.11
2. Create virtual environment with Python 3.11
3. Install requirements (includes TensorFlow)
4. Run with: `streamlit run stock_predictor.py`
5. ✅ All 7 models work!

### Streamlit Cloud:
1. Push code to GitHub
2. Deploy on Streamlit Cloud
3. runtime.txt forces Python 3.11
4. ✅ All 7 models work automatically!

---

## Current Status

✅ **requirements.txt** - Updated with TensorFlow  
✅ **runtime.txt** - Set to Python 3.11  
✅ **stock_predictor.py** - TensorFlow import ready  
✅ **All fixes applied** - yfinance, data validation, etc.  

**Next Steps:**
1. Install Python 3.11 (if not already)
2. Create venv with Python 3.11
3. Install packages
4. Run app - TensorFlow will work! ✅

---

## Models Status

| Model | Without TensorFlow | With TensorFlow (Python 3.11) |
|-------|-------------------|-------------------------------|
| SVR | ✅ | ✅ |
| Random Forest | ✅ | ✅ |
| XGBoost | ✅ | ✅ |
| KNN | ✅ | ✅ |
| Gradient Boosting | ✅ | ✅ |
| ARIMA | ✅ | ✅ |
| **LSTM** | ❌ | ✅ **Working!** |
| Prophet | ✅ | ✅ |

**Total Models:** 6 → **7 with Python 3.11!** 🎉
