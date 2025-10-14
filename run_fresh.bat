@echo off
echo ========================================
echo Stock Predictor - Fresh Start
echo ========================================
echo.

echo [1/4] Stopping any running Streamlit processes...
taskkill /F /IM streamlit.exe /T 2>nul
taskkill /F /IM python.exe /T 2>nul
timeout /t 2 /nobreak >nul

echo [2/4] Clearing caches...
rmdir /S /Q .streamlit\cache 2>nul
rmdir /S /Q __pycache__ 2>nul
rmdir /S /Q .pytest_cache 2>nul
del /Q *.pyc 2>nul
echo   Cache cleared!

echo [3/4] Clearing user Streamlit cache...
rmdir /S /Q "%USERPROFILE%\.streamlit\cache" 2>nul
echo   User cache cleared!

echo [4/4] Starting Streamlit...
echo.
echo ========================================
echo App starting - watch for errors below
echo ========================================
echo.

streamlit run stock_predictor.py

pause
