@echo off
REM Stock Predictor - Installation Script for Windows (CMD)
echo ========================================
echo Stock Predictor Setup Script
echo ========================================
echo.

echo Checking Python installation...
python --version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Python not found. Please install Python 3.9-3.12
    pause
    exit /b 1
)

python --version
echo [OK] Python found
echo.

echo Upgrading pip...
python -m pip install --upgrade pip
echo.

echo Installing core dependencies...
pip install "numpy>=1.21.2,<2.0.0" "pandas>=1.3.0" "scipy>=1.7.0"
echo.

echo Installing all requirements...
echo This may take a few minutes...
pip install --upgrade -r requirements.txt
echo.

if errorlevel 1 (
    echo.
    echo [ERROR] Installation failed
    echo Please check error messages above
    echo.
    echo Try running:
    echo   pip install numpy pandas scipy
    echo   pip install -r requirements.txt
    echo.
    pause
    exit /b 1
)

echo Downloading NLTK data...
python -c "import nltk; nltk.download('vader_lexicon', quiet=True); nltk.download('punkt', quiet=True); print('[OK] NLTK data downloaded')"
echo.

echo ========================================
echo Setup Complete!
echo ========================================
echo.
echo To run the application, use:
echo   streamlit run stock_predictor.py
echo.
echo Note: pmdarima is excluded due to Python 3.13 compatibility.
echo       Standard ARIMA will be used instead.
echo.
pause
