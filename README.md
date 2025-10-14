# Multi-Algorithm Stock Predictor

[![Streamlit App](https://static.streamlit.io/badges/streamlit_badge_black_white.svg)](https://your-app-url.streamlit.app)

## 🚀 Overview
The Multi-Algorithm Stock Predictor is an advanced stock price prediction system that leverages multiple machine learning algorithms and technical indicators to generate ensemble predictions for stock market movements. Built with Streamlit, this application combines **6-7 different prediction models**, technical analysis, and real-time news sentiment to provide comprehensive trading insights.

## ⚠️ Disclaimer
Stock price prediction is inherently difficult and no model can consistently predict market movements accurately. This tool is for educational and informational purposes only. Always consult with a financial advisor before making investment decisions.

## ✨ Key Features
- **Ensemble predictions** from 6-7 ML algorithms (SVR, Random Forest, XGBoost, KNN, Gradient Boosting, ARIMA, Prophet)
- **Real-time stock data** integration via yfinance
- **Live news sentiment analysis** using NLP
- **Technical indicators** visualization (RSI, MACD, Bollinger Bands, etc.)
- **Risk assessment** and confidence scoring
- **Model consensus** analysis
- **Interactive web interface** with Streamlit
- **Customizable timeframe** analysis
- **Production-ready** deployment on Streamlit Cloud

## 🎯 Prediction Models

### Available Models:
1. **SVR** (Support Vector Regression) ✅
2. **Random Forest** ✅
3. **XGBoost** ✅
4. **K-Nearest Neighbors** ✅
5. **Gradient Boosting** ✅
6. **ARIMA** (Time Series) ✅
7. **Prophet** (Facebook's Forecasting) ✅
8. **LSTM** (Optional - requires TensorFlow) ⚠️

> **Note:** LSTM is disabled in Streamlit Cloud deployment due to TensorFlow compatibility issues with Python 3.13. The app works perfectly with the other 6 models.

### Moving Average Controls
1. Use the checkboxes in the Chart Controls section to toggle 20-day and 50-day moving averages
2. SMAs help identify trends - when price crosses above an SMA it may indicate bullish momentum, below may indicate bearish momentum
3. The 20-day SMA responds faster to price changes while the 50-day shows longer-term trends

### Prophet Forecast Controls
1. Use the "Forecast Horizon" slider to adjust how far into the future the model predicts (7-365 days)
2. View the forecast line (red dashed line) and confidence interval (shaded red area)
3. Expand the "Prophet Forecast Details" section to see:
   - 7-day and 30-day price targets with expected percentage changes
   - Trend direction (upward/downward)
   - Weekly pattern information showing which day of the week historically performs best
   - Seasonal factor analysis

Note: Accuracy varies based on market conditions, volatility, and the specific stock being analyzed.

## 🛠️ Setup and Installation

### Prerequisites
- Python 3.9, 3.10, 3.11, or 3.12 (Python 3.13+ not recommended due to package compatibility)
- Internet connection for fetching stock data

### Quick Installation

#### Windows - Using Setup Scripts (Recommended)

**Option 1: PowerShell**
```powershell
.\setup.ps1
```

**Option 2: Command Prompt**
```cmd
setup.bat
```

#### Manual Installation

1. **Install core dependencies:**
```bash
pip install "numpy>=1.21.2,<2.0.0" "pandas>=1.3.0" "scipy>=1.7.0"
```

2. **Install all requirements:**
```bash
pip install -r requirements.txt
```

3. **Download NLTK data:**
```bash
python -c "import nltk; nltk.download('vader_lexicon'); nltk.download('punkt')"
```

For detailed installation instructions and troubleshooting, see [INSTALLATION.md](INSTALLATION.md)

### Running the Application
```bash
streamlit run stock_predictor.py
```

The application will open in your default browser at `http://localhost:8501`

### Recent Fixes (October 2025)
- ✅ Fixed Chrome136 impersonation error with yfinance
- ✅ Fixed empty data array errors in forecasting
- ✅ Improved technical indicator calculations to preserve more data
- ✅ Made pmdarima optional (uses statsmodels ARIMA instead for Python 3.13 compatibility)
- ✅ Made TensorFlow optional (gracefully disables LSTM if not available)
- ✅ Enhanced error handling and validation throughout
- ✅ **Production-ready for Streamlit Cloud deployment**

See [FIXES_APPLIED.md](FIXES_APPLIED.md) for detailed information about fixes.

## 🌐 Deploy to Streamlit Cloud

### Quick Deploy (1-Click)

1. Fork this repository
2. Go to [share.streamlit.io](https://share.streamlit.io)
3. Sign in with GitHub
4. Click "New app" and select your forked repository
5. Set main file to `stock_predictor.py`
6. Click "Deploy!"

**See [DEPLOYMENT.md](DEPLOYMENT.md) for detailed deployment guide.**

### Production Configuration

The app includes all necessary configuration files:
- ✅ `runtime.txt` - Forces Python 3.11 (avoids 3.13 compatibility issues)
- ✅ `requirements.txt` - Production-ready dependencies
- ✅ `.streamlit/config.toml` - Streamlit configuration
- ✅ `packages.txt` - System dependencies

### What Works in Production

| Feature | Local | Streamlit Cloud |
|---------|-------|-----------------|
| SVR Model | ✅ | ✅ |
| Random Forest | ✅ | ✅ |
| XGBoost | ✅ | ✅ |
| KNN | ✅ | ✅ |
| Gradient Boosting | ✅ | ✅ |
| ARIMA | ✅ | ✅ |
| Prophet Forecasting | ✅ | ✅ |
| LSTM (TensorFlow) | ✅ | ❌ (Python 3.13 issue) |
| News Sentiment | ✅ | ✅ |
| Technical Indicators | ✅ | ✅ |
| Real-time Data | ✅ | ✅ |

## 💡 Usage Guidelines

### Best Practices
1. Use longer training periods (5+ years) for more stable predictions
2. Focus on liquid stocks with consistent trading history
3. Consider multiple timeframes for confirmation
4. Always combine predictions with fundamental analysis
5. Monitor prediction confidence scores and risk assessments

### Risk Management
- Use the confidence score to gauge prediction reliability
- Consider the prediction range (upper and lower bounds)
- Monitor the model consensus strength
- Check the risk assessment indicators
- Review news sentiment before making decisions

## 📈 Trading Signals

The system generates trading signals based on:
1. **Price Change Percentage**
   - Strong signals: >10% predicted change
   - Moderate signals: 3-10% predicted change
   - Weak signals: 1-3% predicted change
   - Hold signals: <1% predicted change

2. **Confidence Scores**
   - High confidence: >0.8
   - Medium confidence: 0.6-0.8
   - Low confidence: <0.6

## ⚠️ Limitations
1. Cannot predict black swan events or unexpected news
2. Less accurate during periods of extreme market volatility
3. Requires quality historical data for accurate predictions
4. May not capture fundamental company changes
5. Past performance doesn't guarantee future results

## 🔄 Future Improvements
1. Integration of sentiment analysis from social media (Twitter)
2. Addition of more sophisticated deep learning models
3. Enhanced feature engineering capabilities
4. Real-time market correlation analysis
5. Portfolio optimization recommendations
6. Market regime detection
7. Enhanced risk management features

---
⚠️ **Disclaimer**: This tool is for educational and research purposes only. Always conduct your own research and consider consulting with a financial advisor before making investment decisions.
