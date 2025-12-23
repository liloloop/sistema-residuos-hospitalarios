# 🏥 Sistema de Gestión de Residuos Hospitalarios - Dashboard Piloto
**ESE Centro de Salud San Juan de Dios | Pital, Huila**

## Descripción

Sistema interactivo para análisis, visualización y predicción de residuos hospitalarios con propuesta de implementación de clasificación semiautomatizada mediante QR e IA.

## 📋 Características Principales

### ✅ 6 Pestañas Interactivas:
1. **📊 Vista General** - Métricas clave, gráficos de distribución, timeline
2. **♻️ Análisis Residuos** - Tabla detallada, sunburst, heatmaps
3. **📍 Por Área** - Desagregación por zona operativa, usuarios
4. **⚠️ Incidentes** - Detalle de problemas, plan de acción
5. **🔮 Predicciones QR** - Análisis de precisión, impacto proyectado
6. **📈 Comparativas** - Correlaciones, análisis temporal avanzado

### 📊 Visualizaciones:
- Gráficos de barras, líneas, scatter, pie, sunburst
- Heatmaps de correlación
- Evolución temporal
- Matrices de confusión
- Gráficos Plotly interactivos

### 💾 Funcionalidades:
- Carga dinámica de CSV y Excel
- Filtros por área y tipo de residuo
- Detección automática de incidentes
- Predicción de clasificación correcta (QR)
- Exportación de datos y reportes
- Cálculo automático de métricas

## 🚀 Instalación

### Opción 1: Instalación rápida (Recomendado)

```bash
# 1. Clonar o descargar el repositorio
cd tu_carpeta_proyecto

# 2. Crear entorno virtual
python -m venv venv

# 3. Activar entorno virtual
# En Windows:
venv\Scripts\activate
# En Mac/Linux:
source venv/bin/activate

# 4. Instalar dependencias
pip install -r requirements.txt

# 5. Ejecutar dashboard
streamlit run dashboard_residuos.py
```

### Opción 2: Instalación manual

```bash
pip install streamlit==1.28.1
pip install pandas==2.0.3
pip install numpy==1.24.3
pip install matplotlib==3.7.2
pip install seaborn==0.12.2
pip install plotly==5.17.0
pip install scikit-learn==1.3.0
pip install openpyxl==3.1.2
```

## 📊 Uso

### Paso 1: Preparar datos
El archivo CSV debe tener delimitador `;` con columnas:
```
Marca temporal | 1. USUARIO | 2. ÁREA | 3. TIPO DE RESIDUOS | COLOR DEL RECIPIENTE | Columna 12 | Columna 13
```

Ejemplo:
```
10/3/2025 18:37:51;MARIA ALEJANDRA FIESCO ROJAS;ODONTOLOGIA E HIGIENE ORAL;BIOSANITARIOS;ROJO;MEDIO (25% - 75%);DERRAME
```

### Paso 2: Ejecutar programa

```bash
streamlit run dashboard_residuos.py
```

Se abrirá en: `http://localhost:8501`

### Paso 3: Cargar datos

1. En el panel lateral: **Carga de Datos**
2. Click en **"Selecciona archivo CSV o Excel"**
3. Selecciona tu archivo
4. Sistema procesa automáticamente

### Paso 4: Explorar análisis

- **Usa las 6 pestañas** para navegar diferentes vistas
- **Aplica filtros** por Área y Tipo de Residuo
- **Descarga reportes** en CSV o TXT
- **Interactúa** con gráficos (zoom, pan, hover para detalles)

## 📈 Ejemplo de Datos

Se proporciona archivo de prueba con 80 registros:
- **Período**: Octubre-Noviembre 2025
- **Áreas**: Odontología (78.75%), Laboratorio (17.5%)
- **Usuarios**: 7 personas capacitadas
- **Incidentes**: 23 detectados (28.75%)

## 🔧 Estructura del Código

```
dashboard_residuos.py
├── Importaciones y configuración Streamlit
├── Funciones auxiliares:
│   ├── cargar_datos()        # Carga CSV/Excel
│   ├── procesar_datos()      # Limpieza y detección de incidentes
│   ├── calcular_metricas()   # Estadísticas clave
│   ├── crear_prediccion_qr() # Modelo QR predictivo
│   └── generar_reporte_pdf() # Exportación reportes
├── Sidebar: Carga de datos y filtros
├── 6 Tabs con análisis interactivos
└── Footer con información

requirements.txt
├── Streamlit (interfaz)
├── Pandas (manejo de datos)
├── Plotly (gráficos interactivos)
├── Scikit-learn (ML simple)
├── Matplotlib/Seaborn (visualización)
└── Librerías auxiliares
```

## 🎯 Propuesta QR Semiautomatizada

### Cómo funciona:
1. **Cada contenedor** tiene código QR personalizado
2. **Trabajador escanea** QR + ingresa tipo y peso de residuo
3. **Sistema valida** si recipiente soporta volumen
4. **Si > 75% llenado** → Genera alerta de recolección
5. **Registra historial** completo del contenedor

### Impacto proyectado:
- ✅ Reducción incidentes segregación: **85%**
- ✅ Aumento precisión clasificación: **+27%**
- ✅ Optimización rutas: **15-20%**
- ✅ Cumplimiento normativo: **98%**

## 📊 Métricas Clave Calculadas

- **Total Registros**: Cantidad de inspecciones realizadas
- **Usuarios Activos**: Personal capacitado
- **Áreas Monitoreadas**: Zonas operativas
- **Incidentes**: Problemas de segregación, falta de bolsa, derrames
- **% Incidentes**: Porcentaje de registros con problemas
- **Residuos Peligrosos**: Cortopunzantes y químicos

## ⚙️ Configuración Avanzada

### Modificar colores del tema:

En `dashboard_residuos.py`, línea ~100:
```python
--color-primary: #2180a8;      # Azul principal
--color-success: #208084;      # Verde éxito
--color-warning: #a84b2f;      # Naranja advertencia
--color-error: #c0152f;        # Rojo error
```

### Agregar más tipos de residuos:

En función `crear_prediccion_qr()`, línea ~280:
```python
mapeo_recipiente = {
    'NUEVO_TIPO_RESIDUO': 'COLOR_RECIPIENTE',
    ...
}
```

## 📄 Exportación de Datos

### Formato CSV:
- Descargable desde sidebar
- Delimitador: `;`
- Codificación: UTF-8

### Formato Reporte TXT:
- Incluye resumen ejecutivo
- Análisis detallado
- Recomendaciones por tipo de residuo
- Propuesta QR especificaciones

## 🐛 Solución de Problemas

### Problema: "ModuleNotFoundError: No module named 'streamlit'"
**Solución**: Ejecutar `pip install -r requirements.txt`

### Problema: "UnicodeDecodeError: 'utf-8' codec can't decode"
**Solución**: Asegurar que CSV use delimitador `;` y encoding UTF-8

### Problema: Gráficos no se cargan
**Solución**: Actualizar Plotly: `pip install --upgrade plotly`

### Problema: El archivo es muy grande (lentitud)
**Solución**: Filtrar datos en sidebar antes de visualizar

## 📞 Soporte

- **Documentación**: Ver secciones arriba
- **Propuesta Completa**: Revisar `PROPUESTA DAYANAN ALEXANDRA PAJOY 29 DE ENERO (2).pdf`
- **Contacto**: Equipo de TI ESE San Juan de Dios

## 📜 Licencia

Este proyecto es propiedad de ESE Centro de Salud San Juan de Dios - Pital, Huila.
Uso exclusivo para análisis de residuos hospitalarios.

## 🎓 Créditos

Desarrollado como propuesta de optimización de Sistema de Gestión Integral de Residuos (PGIRASA)
Versión 1.0 - Diciembre 2025

---

**Última actualización**: 01/12/2025
**Estado**: Piloto Activo ✅
**Próximas mejoras**: Sistema QR completo, integración en tiempo real, mobile app
