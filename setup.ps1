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
} catch {
    Write-Host "✗ Python not found. Please install Python 3.8 or higher." -ForegroundColor Red
    exit 1
}

# Upgrade pip
Write-Host ""
Write-Host "Upgrading pip..." -ForegroundColor Yellow
python -m pip install --upgrade pip

# Install/Upgrade requirements
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
    python -c "import nltk; nltk.download('vader_lexicon', quiet=True); nltk.download('punkt', quiet=True)"
    
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host "Setup Complete!" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "To run the application, use:" -ForegroundColor Yellow
    Write-Host "  streamlit run stock_predictor.py" -ForegroundColor White
    Write-Host ""
} else {
    Write-Host ""
    Write-Host "✗ Installation failed. Please check the error messages above." -ForegroundColor Red
    Write-Host "Try running: pip install --upgrade -r requirements.txt" -ForegroundColor Yellow
}
