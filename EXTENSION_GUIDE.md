# 📚 GUÍA DE EXTENSIÓN - Dashboard de Residuos

## Cómo agregar nuevas funcionalidades

### 1. Agregar una nueva pestaña

```python
# En la sección de TABS
tab1, tab2, tab3, tab4, tab5, tab6, tab7 = st.tabs([
    "📊 Vista General",
    "♻️ Análisis Residuos",
    ...
    "🆕 Mi Nueva Pestaña"  # Nueva pestaña
])

with tab7:
    st.header("🆕 Mi Nueva Pestaña")
    st.write("Tu contenido aquí")
```

### 2. Agregar un nuevo gráfico

```python
import plotly.express as px

fig = px.bar(
    data_frame=df,
    x='columna_x',
    y='columna_y',
    title='Mi Nuevo Gráfico',
    color='columna_color'
)
st.plotly_chart(fig, use_container_width=True)
```

### 3. Agregar un nuevo tipo de residuo

En función crear_prediccion_qr():

```python
mapeo_recipiente = {
    'BIOSANITARIOS': 'ROJO',
    'NUEVO_RESIDUO': 'COLOR_RECIPIENTE',
    ...
}
```

### 4. Agregar filtros personalizados

```python
filtro_personalizado = st.multiselect(
    "Mi Filtro",
    options=df['mi_columna'].unique(),
    default=df['mi_columna'].unique()
)

if filtro_personalizado:
    df = df[df['mi_columna'].isin(filtro_personalizado)]
```

### 5. Agregar exportación Excel

```python
import openpyxl
from io import BytesIO

with BytesIO() as buffer:
    df.to_excel(buffer, sheet_name='Residuos', index=False)
    st.download_button(
        label="📊 Descargar Excel",
        data=buffer.getvalue(),
        file_name=f"residuos_{datetime.now().strftime('%Y%m%d')}.xlsx",
        mime="application/vnd.ms-excel"
    )
```

### 6. Agregar predicción Machine Learning

```python
from sklearn.ensemble import RandomForestClassifier

def entrenar_modelo(df):
    X = df[['hora', 'dia_semana']].values
    y = df['incidente'].values

    modelo = RandomForestClassifier(n_estimators=100)
    modelo.fit(X, y)
    return modelo

modelo = entrenar_modelo(df)
prediccion = modelo.predict([[8, 1]])
```

### 7. Agregar gráfico en tiempo real

```python
chart_placeholder = st.empty()

while True:
    df_actualizado = cargar_datos_nuevos()
    with chart_placeholder.container():
        st.plotly_chart(crear_grafico(df_actualizado))
    time.sleep(5)
```

### 8. Agregar API para QR

```python
from fastapi import FastAPI

app = FastAPI()

@app.post("/api/registrar_residuo/")
def registrar_residuo(qr_code: str, tipo_residuo: str, peso: float):
    validacion = validar_qr(qr_code)
    if validacion:
        return {"status": "success"}
    else:
        return {"status": "error"}
```

### 9. Agregar notificaciones

```python
import smtplib
from email.mime.text import MIMEText

def enviar_alerta(asunto, contenido, email_destino):
    servidor = smtplib.SMTP('smtp.gmail.com', 587)
    servidor.starttls()
    servidor.login('tu_email@gmail.com', 'contraseña')

    mensaje = MIMEText(contenido)
    mensaje['Subject'] = asunto
    servidor.send_message(mensaje, to_addrs=[email_destino])
    servidor.quit()
```

## Estructura de datos esperada

```
Columnas necesarias:
- timestamp: Fecha y hora del registro
- usuario: Nombre del usuario
- area: Área operativa
- tipo_residuo: Tipo de residuo
- color_recipiente: Color del recipiente usado
- estado_recipiente: Estado (VACÍO, MEDIO, LLENO)
- observaciones: Observaciones/Incidentes

Tipos de residuo:
1. BIOSANITARIOS
2. ANATOMOPATOLOGICOS
3. CORTOPUNZANTES
4. RESIDUOS QUIMICOS DE LABORATORIO CLINICO
5. RESIDUOS QUIMICOS DE ODONTOLOGIA E HIGIENE ORAL
6. RESIDUOS APROVECHABLES
7. RESIDUOS NO APROVECHABLES

Colores de recipiente:
- ROJO: Biosanitarios, Químicos
- GUARDIAN: Cortopunzantes
- BLANCO: Aprovechables
- NEGRO: No aprovechables
```

## Deployment en Streamlit Cloud

1. Push código a GitHub
2. Ir a https://share.streamlit.io/
3. Conectar repositorio
4. Seleccionar main file: dashboard_residuos.py
5. Deploy

---

¡Ahora puedes extender el dashboard! 🚀
