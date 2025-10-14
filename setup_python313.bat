@echo off
REM Stock Predictor - Python 3.13 Compatible Setup
REM This version skips TensorFlow (LSTM model won't be available)

echo ========================================
echo Stock Predictor Setup (Python 3.13)
echo ========================================
echo.

REM Check Python
echo Checking Python installation...
python --version
if errorlevel 1 (
    echo ERROR: Python not found. Please install Python.
    pause
    exit /b 1
)

echo.
echo WARNING: Python 3.13 detected
echo   - LSTM/TensorFlow model will NOT be available
echo   - Prophet may show warnings but should work
echo   - 7 models will work fine: SVR, RF, XGBoost, KNN, GB, ARIMA, Prophet
echo.
echo For full 8-model support, run: setup_tensorflow.ps1
echo.
pause

REM Upgrade pip
echo.
echo Upgrading pip...
python -m pip install --upgrade pip

REM Install core dependencies
echo.
echo Installing core dependencies...
python -m pip install "numpy>=1.21.2,<2.0.0" "pandas>=1.3.0" "scipy>=1.7.0"

REM Install ML packages
echo.
echo Installing machine learning packages...
python -m pip install "scikit-learn>=1.0.0"
python -m pip install "statsmodels>=0.13.2"
python -m pip install "streamlit>=1.28.0"
python -m pip install "newsapi-python"
python -m pip install "yfinance>=0.2.28"
python -m pip install "matplotlib>=3.5.0"
python -m pip install "plotly>=5.0.0"
python -m pip install "xgboost>=1.5.0"
python -m pip install arch
python -m pip install ta
python -m pip install "nltk>=3.6"
python -m pip install textblob

REM Install Prophet
echo.
echo Installing Prophet (may show warnings)...
python -m pip install prophet

REM Download NLTK data
echo.
echo Downloading NLTK data...
python -c "import nltk; nltk.download('punkt', quiet=True); nltk.download('vader_lexicon', quiet=True)"

echo.
echo ========================================
echo Setup Complete!
echo ========================================
echo.
echo Available Models (7):
echo   - SVR
echo   - Random Forest
echo   - XGBoost
echo   - KNN
echo   - Gradient Boosting
echo   - ARIMA
echo   - Prophet
echo.
echo Not Available:
echo   - LSTM (requires TensorFlow/Python 3.11)
echo.
echo To run the application:
echo   streamlit run stock_predictor.py
echo.
pause
