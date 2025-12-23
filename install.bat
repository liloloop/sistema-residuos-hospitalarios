@echo off
REM Script de instalación automática - Windows

echo.
echo ==========================================
echo Hospital Waste Management System
echo Installation Script
echo ==========================================
echo.

REM Verificar Python
python --version >nul 2>&1
if errorlevel 1 (
    echo Error: Python no encontrado. Instala Python 3.8+
    pause
    exit /b 1
)

echo Python detectado: 
python --version
echo.

REM Crear entorno virtual
echo Creating virtual environment...
python -m venv venv

REM Activar entorno
echo Activating environment...
call venv\Scripts\activate.bat

REM Instalar dependencias
echo Installing dependencies...
pip install --upgrade pip
pip install -r requirements.txt

echo.
echo Installation completed!
echo.
echo To run the dashboard:
echo   1. Execute: venv\Scripts\activate.bat
echo   2. Execute: streamlit run dashboard_residuos.py
echo.
echo Open in browser: http://localhost:8501
echo.
pause
