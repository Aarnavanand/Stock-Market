@echo off
echo Installing Stock Predictor dependencies...
echo.
python -m pip install --upgrade pip
python -m pip install streamlit yfinance pandas numpy scipy scikit-learn xgboost statsmodels matplotlib plotly prophet arch ta nltk textblob newsapi-python
echo.
echo Downloading NLTK data...
python -c "import nltk; nltk.download('punkt', quiet=True); nltk.download('vader_lexicon', quiet=True)"
echo.
echo ========================================
echo Installation Complete!
echo ========================================
echo.
echo To run the app:
echo   streamlit run stock_predictor.py
echo.
pause
