#!/bin/bash
# Script de instalación automática - Dashboard Residuos

echo "=========================================="
echo "🏥 INSTALACIÓN - Sistema de Gestión de Residuos"
echo "ESE Centro de Salud San Juan de Dios"
echo "=========================================="
echo ""

# Verificar Python
if ! command -v python3 &> /dev/null; then
    echo "❌ Python 3 no encontrado. Por favor instala Python 3.8+"
    exit 1
fi

echo "✓ Python detectado: $(python3 --version)"
echo ""

# Crear entorno virtual
echo "📦 Creando entorno virtual..."
python3 -m venv venv

# Activar entorno
echo "🔧 Activando entorno..."
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
    source venv/Scripts/activate
else
    source venv/bin/activate
fi

# Instalar dependencias
echo "📥 Instalando dependencias..."
pip install --upgrade pip
pip install -r requirements.txt

echo ""
echo "✅ ¡Instalación completada!"
echo ""
echo "Para ejecutar el dashboard:"
echo "  1. Ejecuta: source venv/bin/activate (Mac/Linux) o venv\Scripts\activate (Windows)"
echo "  2. Ejecuta: streamlit run dashboard_residuos.py"
echo ""
echo "Se abrirá en: http://localhost:8501"
echo ""
