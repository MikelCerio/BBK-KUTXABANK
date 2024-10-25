## Resumen del Código

En este análisis de datos, se busca explorar la relación entre ingresos y gastos a lo largo del tiempo, utilizando un conjunto de datos que abarca desde octubre de 2023 hasta octubre de 2024. Se desarrollan visualizaciones gráficas y un modelo de regresión lineal para predecir los ingresos basados en los gastos. El objetivo es identificar patrones en los datos financieros y proporcionar una base para la toma de decisiones informadas sobre la gestión de los recursos.

### 📥 Lectura del Archivo CSV
Se carga el archivo `DATOS_FINAL_BBK_3.csv` en un DataFrame utilizando la biblioteca `pandas`, lo que permite manipular los datos de manera efectiva.

### 📅 Creación de la Columna 'Mes-Ano'
Se genera una nueva columna que combina el mes y el año, facilitando así la visualización y el análisis a lo largo del tiempo.

### 📊 Agrupación de Datos
Los datos se agrupan por mes y año, calculando la suma de ingresos y gastos. Esto permite observar la evolución de ambos a lo largo del periodo analizado.

### 📏 Ordenación de Datos
Se establece un orden personalizado para la columna 'Mes-Ano', asegurando que los datos se visualicen de manera lógica y cronológica.

### 📈 Creación de Gráficos
Se genera un gráfico de barras que muestra los totales positivos (ingresos) y negativos (gastos en valores absolutos), junto con una línea que representa el balance. Este gráfico proporciona una visualización clara de la relación entre ingresos y gastos a lo largo del tiempo.

### 🔍 Modelado Predictivo
Se utiliza un modelo de regresión lineal para predecir los ingresos basados en los gastos. Los datos se dividen en conjuntos de entrenamiento y prueba, y el modelo se ajusta a los datos de entrenamiento. Se evalúa el rendimiento del modelo utilizando métricas como el error cuadrático medio (MSE) y el coeficiente de determinación (R²).

### 📉 Visualización de Predicciones
Se grafica la comparación entre los valores reales de ingresos y las predicciones del modelo, lo que permite evaluar la precisión del mismo.

### 📊 Gráficos Diseñados
- **Gráfico de Ingresos y Gastos**: Representa visualmente la relación entre los ingresos y los gastos a lo largo del tiempo, ayudando a identificar tendencias.
- **Gráfico de Predicciones**: Muestra la comparación entre los ingresos reales y las predicciones, destacando la efectividad del modelo de regresión lineal.

---
