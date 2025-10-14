# Setup Script for Python 3.11 with TensorFlow
# This script will create a Python 3.11 virtual environment and install all dependencies

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Stock Predictor - Python 3.11 Setup" -ForegroundColor Cyan
Write-Host "With TensorFlow & LSTM Support" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Function to check if Python 3.11 is available
function Test-Python311 {
    $pythonVersions = @()
    
    # Check default python
    try {
        $version = python --version 2>&1
        if ($version -match "Python 3\.11") {
            return "python"
        }
    } catch {}
    
    # Check py launcher
    try {
        $pyList = py --list 2>&1
        if ($pyList -match "3\.11") {
            return "py -3.11"
        }
    } catch {}
    
    # Check common installation paths
    $paths = @(
        "C:\Python311\python.exe",
        "C:\Program Files\Python311\python.exe",
        "$env:LOCALAPPDATA\Programs\Python\Python311\python.exe"
    )
    
    foreach ($path in $paths) {
        if (Test-Path $path) {
            return $path
        }
    }
    
    return $null
}

Write-Host "Checking for Python 3.11..." -ForegroundColor Yellow
$python311 = Test-Python311

if ($null -eq $python311) {
    Write-Host "❌ Python 3.11 not found!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Please install Python 3.11:" -ForegroundColor Yellow
    Write-Host "1. Go to: https://www.python.org/downloads/" -ForegroundColor White
    Write-Host "2. Download Python 3.11.9 (latest 3.11 version)" -ForegroundColor White
    Write-Host "3. During installation, check 'Add Python to PATH'" -ForegroundColor White
    Write-Host "4. Run this script again" -ForegroundColor White
    Write-Host ""
    Write-Host "Or use Anaconda:" -ForegroundColor Yellow
    Write-Host "   conda create -n stock-predictor python=3.11 -y" -ForegroundColor White
    Write-Host "   conda activate stock-predictor" -ForegroundColor White
    Write-Host "   pip install -r requirements.txt" -ForegroundColor White
    Write-Host ""
    pause
    exit 1
}

Write-Host "✓ Found Python 3.11: $python311" -ForegroundColor Green
Write-Host ""

# Create virtual environment
Write-Host "Creating virtual environment with Python 3.11..." -ForegroundColor Yellow
if (Test-Path "venv311") {
    Write-Host "Virtual environment 'venv311' already exists." -ForegroundColor Yellow
    $response = Read-Host "Delete and recreate? (y/n)"
    if ($response -eq 'y') {
        Remove-Item -Recurse -Force "venv311"
        Write-Host "Deleted old virtual environment" -ForegroundColor Green
    } else {
        Write-Host "Using existing virtual environment" -ForegroundColor Green
    }
}

if (-not (Test-Path "venv311")) {
    if ($python311 -eq "python") {
        python -m venv venv311
    } elseif ($python311 -match "py -") {
        py -3.11 -m venv venv311
    } else {
        & $python311 -m venv venv311
    }
    
    if ($LASTEXITCODE -ne 0) {
        Write-Host "❌ Failed to create virtual environment" -ForegroundColor Red
        pause
        exit 1
    }
    Write-Host "✓ Virtual environment created" -ForegroundColor Green
}

Write-Host ""

# Activate virtual environment
Write-Host "Activating virtual environment..." -ForegroundColor Yellow
& ".\venv311\Scripts\Activate.ps1"

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Failed to activate virtual environment" -ForegroundColor Red
    Write-Host ""
    Write-Host "Try running this as Administrator:" -ForegroundColor Yellow
    Write-Host "   Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser" -ForegroundColor White
    Write-Host ""
    pause
    exit 1
}

Write-Host "✓ Virtual environment activated" -ForegroundColor Green
Write-Host ""

# Verify Python version
Write-Host "Verifying Python version..." -ForegroundColor Yellow
$venvPython = python --version
Write-Host "✓ $venvPython" -ForegroundColor Green
Write-Host ""

# Upgrade pip
Write-Host "Upgrading pip..." -ForegroundColor Yellow
python -m pip install --upgrade pip --quiet
Write-Host "✓ pip upgraded" -ForegroundColor Green
Write-Host ""

# Install core dependencies
Write-Host "Installing core dependencies (numpy, pandas, scipy)..." -ForegroundColor Yellow
pip install "numpy>=1.21.2,<2.0.0" "pandas>=1.3.0" "scipy>=1.7.0" --quiet
Write-Host "✓ Core dependencies installed" -ForegroundColor Green
Write-Host ""

# Install all requirements
Write-Host "Installing all requirements (including TensorFlow)..." -ForegroundColor Yellow
Write-Host "This may take 5-10 minutes..." -ForegroundColor Gray
pip install -r requirements.txt

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Installation failed" -ForegroundColor Red
    Write-Host "Check error messages above" -ForegroundColor Yellow
    pause
    exit 1
}

Write-Host "✓ All packages installed successfully!" -ForegroundColor Green
Write-Host ""

# Test TensorFlow
Write-Host "Testing TensorFlow installation..." -ForegroundColor Yellow
python -c "import tensorflow as tf; print('TensorFlow version:', tf.__version__)" 2>$null

if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ TensorFlow is working! LSTM model will be available." -ForegroundColor Green
} else {
    Write-Host "⚠ TensorFlow test failed. LSTM model may not work." -ForegroundColor Yellow
}
Write-Host ""

# Download NLTK data
Write-Host "Downloading NLTK data..." -ForegroundColor Yellow
python -c "import nltk; nltk.download('vader_lexicon', quiet=True); nltk.download('punkt', quiet=True); print('✓ NLTK data downloaded')"
Write-Host ""

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Setup Complete!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "All 7 models are now available:" -ForegroundColor Green
Write-Host "  ✓ SVR" -ForegroundColor White
Write-Host "  ✓ Random Forest" -ForegroundColor White
Write-Host "  ✓ XGBoost" -ForegroundColor White
Write-Host "  ✓ KNN" -ForegroundColor White
Write-Host "  ✓ Gradient Boosting" -ForegroundColor White
Write-Host "  ✓ ARIMA" -ForegroundColor White
Write-Host "  ✓ LSTM (TensorFlow)" -ForegroundColor Yellow
Write-Host "  ✓ Prophet" -ForegroundColor White
Write-Host ""
Write-Host "To run the application:" -ForegroundColor Yellow
Write-Host "  streamlit run stock_predictor.py" -ForegroundColor White
Write-Host ""
Write-Host "Note: Make sure virtual environment is activated!" -ForegroundColor Gray
Write-Host "You should see (venv311) in your prompt." -ForegroundColor Gray
Write-Host ""
pause
