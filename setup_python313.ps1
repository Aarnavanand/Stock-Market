# Stock Predictor - Python 3.13 Compatible Setup Script
# This version works with Python 3.13 but skips TensorFlow (LSTM model won't be available)

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Stock Predictor Setup (Python 3.13)" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Check Python version
Write-Host "Checking Python installation..." -ForegroundColor Yellow
try {
    $pythonVersion = python --version
    Write-Host "✓ Python found: $pythonVersion" -ForegroundColor Green
    
    $versionString = python -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')"
    $version = [decimal]$versionString
    
    if ($version -ge 3.13) {
        Write-Host "⚠ Python 3.13 detected - Running in compatibility mode" -ForegroundColor Yellow
        Write-Host "  Note: LSTM/TensorFlow model will NOT be available" -ForegroundColor Yellow
        Write-Host "  Note: Prophet may show warnings but should work" -ForegroundColor Yellow
        Write-Host "  Other models: SVR, Random Forest, XGBoost, KNN, GB, ARIMA will work fine" -ForegroundColor Green
        Write-Host ""
        Write-Host "  For full functionality with 8 models, use Python 3.11: .\setup_tensorflow.ps1" -ForegroundColor Cyan
        Write-Host ""
        
        $continue = Read-Host "Continue with 7 models? (Y/N)"
        if ($continue -ne "Y" -and $continue -ne "y") {
            Write-Host "Setup cancelled. Run .\setup_tensorflow.ps1 for Python 3.11 setup." -ForegroundColor Yellow
            exit 0
        }
    }
} catch {
    Write-Host "✗ Python not found. Please install Python." -ForegroundColor Red
    exit 1
}

# Upgrade pip
Write-Host ""
Write-Host "Upgrading pip..." -ForegroundColor Yellow
python -m pip install --upgrade pip

# Install numpy first
Write-Host ""
Write-Host "Installing core dependencies..." -ForegroundColor Yellow
python -m pip install 'numpy>=1.21.2,<2.0.0' 'pandas>=1.3.0' 'scipy>=1.7.0'

# Install packages one by one with error handling
Write-Host ""
Write-Host "Installing machine learning packages..." -ForegroundColor Yellow
$packages = @(
    'scikit-learn>=1.0.0',
    'statsmodels>=0.13.2',
    'streamlit>=1.28.0',
    'newsapi-python',
    'yfinance>=0.2.28',
    'matplotlib>=3.5.0',
    'plotly>=5.0.0',
    'xgboost>=1.5.0',
    'arch',
    'ta',
    'nltk>=3.6',
    'textblob'
)

foreach ($package in $packages) {
    Write-Host "  Installing $package..." -ForegroundColor Gray
    python -m pip install $package
    if ($LASTEXITCODE -ne 0) {
        Write-Host "  ⚠ Warning: Failed to install $package" -ForegroundColor Yellow
    }
}

# Install Prophet with special handling
Write-Host ""
Write-Host "Installing Prophet (may show warnings on Python 3.13)..." -ForegroundColor Yellow
python -m pip install prophet
if ($LASTEXITCODE -ne 0) {
    Write-Host "⚠ Prophet installation had issues - the app will work without it" -ForegroundColor Yellow
} else {
    Write-Host "✓ Prophet installed (ignore cmdstanpy warnings)" -ForegroundColor Green
}

# Download NLTK data
Write-Host ""
Write-Host "Downloading NLTK data..." -ForegroundColor Yellow
python -c "import nltk; nltk.download('punkt', quiet=True); nltk.download('vader_lexicon', quiet=True)"

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "✓ Setup Complete!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Available Models (7):" -ForegroundColor Yellow
Write-Host "  ✓ SVR" -ForegroundColor Green
Write-Host "  ✓ Random Forest" -ForegroundColor Green
Write-Host "  ✓ XGBoost" -ForegroundColor Green
Write-Host "  ✓ KNN" -ForegroundColor Green
Write-Host "  ✓ Gradient Boosting" -ForegroundColor Green
Write-Host "  ✓ ARIMA" -ForegroundColor Green
Write-Host "  ✓ Prophet (may have warnings)" -ForegroundColor Green
Write-Host ""
Write-Host "Not Available:" -ForegroundColor Yellow
Write-Host "  ✗ LSTM (requires TensorFlow/Python 3.11)" -ForegroundColor Red
Write-Host ""
Write-Host "To run the application:" -ForegroundColor Cyan
Write-Host "  streamlit run stock_predictor.py" -ForegroundColor White
Write-Host ""
Write-Host "For full 8-model support, run:" -ForegroundColor Cyan
Write-Host "  .\setup_tensorflow.ps1" -ForegroundColor White
Write-Host ""
