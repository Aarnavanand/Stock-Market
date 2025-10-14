# Stock Predictor - Installation and Setup Script for Windows
# Run this script in PowerShell

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Stock Predictor Setup Script" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Check if Python is installed
Write-Host "Checking Python installation..." -ForegroundColor Yellow
try {
    $pythonVersion = python --version
    Write-Host "✓ Python found: $pythonVersion" -ForegroundColor Green
    
    # Check Python version
    $versionString = python -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')"
    $version = [decimal]$versionString
    
    if ($version -ge 3.13) {
        Write-Host "⚠ Warning: Python 3.13+ detected. Some packages may have compatibility issues." -ForegroundColor Yellow
        Write-Host "  Recommended: Python 3.9, 3.10, 3.11, or 3.12" -ForegroundColor Yellow
        Write-Host ""
    }
} catch {
    Write-Host "✗ Python not found. Please install Python 3.9-3.12." -ForegroundColor Red
    exit 1
}

# Upgrade pip
Write-Host ""
Write-Host "Upgrading pip..." -ForegroundColor Yellow
python -m pip install --upgrade pip

# Install numpy first (required for building other packages)
Write-Host ""
Write-Host "Installing core dependencies (numpy, pandas, scipy)..." -ForegroundColor Yellow
pip install "numpy>=1.21.2,<2.0.0" "pandas>=1.3.0" "scipy>=1.7.0"

# Install/Upgrade remaining requirements
Write-Host ""
Write-Host "Installing/Upgrading required packages..." -ForegroundColor Yellow
Write-Host "This may take a few minutes..." -ForegroundColor Gray
pip install --upgrade -r requirements.txt

# Check if installation was successful
if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "✓ All packages installed successfully!" -ForegroundColor Green
    
    # Download NLTK data
    Write-Host ""
    Write-Host "Downloading NLTK data..." -ForegroundColor Yellow
    python -c "import nltk; nltk.download('vader_lexicon', quiet=True); nltk.download('punkt', quiet=True); print('✓ NLTK data downloaded')"
    
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host "Setup Complete!" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "To run the application, use:" -ForegroundColor Yellow
    Write-Host "  streamlit run stock_predictor.py" -ForegroundColor White
    Write-Host ""
    Write-Host "Note: pmdarima is optional and excluded due to Python 3.13 compatibility." -ForegroundColor Gray
    Write-Host "      Standard ARIMA from statsmodels will be used instead." -ForegroundColor Gray
    Write-Host ""
} else {
    Write-Host ""
    Write-Host "✗ Installation failed. Please check the error messages above." -ForegroundColor Red
    Write-Host ""
    Write-Host "Troubleshooting steps:" -ForegroundColor Yellow
    Write-Host "1. Make sure you have Python 3.9-3.12 installed" -ForegroundColor White
    Write-Host "2. Try installing packages individually:" -ForegroundColor White
    Write-Host "   pip install numpy pandas scipy" -ForegroundColor Gray
    Write-Host "   pip install -r requirements.txt" -ForegroundColor Gray
    Write-Host "3. If using Python 3.13, consider downgrading to 3.12" -ForegroundColor White
    Write-Host ""
}
