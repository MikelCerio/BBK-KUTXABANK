
## Resumen del Código


En este documento, se presenta un análisis de datos centrado en la creación de un modelo predictivo de gastos basado en categorías. Utilizando un conjunto de datos históricos, se desarrollará un proceso que incluye la limpieza y filtrado de datos, así como la visualización de la información. Se implementará un modelo de regresión lineal para predecir futuros gastos. Además, se crearán gráficos que permitirán observar la evolución de los gastos a lo largo del tiempo. Este análisis tiene como objetivo facilitar la comprensión de los patrones de gasto y su previsión.


### 📚 Importación de Librerías
Se importan las bibliotecas necesarias: `pandas` para la manipulación de datos, `matplotlib.pyplot` para visualización, y `sklearn` para la creación y evaluación de modelos predictivos.

### 📥 Lectura del Archivo CSV
Se carga el archivo `DATOS_FINAL_BBK_vac.csv` en un DataFrame.

### 📊 Visualización de Columnas
Se imprime la lista de columnas del DataFrame para entender la estructura de los datos.

### 📅 Definición de Rangos Temporales
Se establecen los años y meses de inicio y fin para filtrar los datos.

### 🔄 Transformación de Meses
Se convierte la columna de meses a formato texto con iniciales (por ejemplo, 'Ene' para enero).

### 🔍 Filtrado del DataFrame
Se filtran los datos para incluir solo aquellos entre octubre de 2023 y octubre de 2024, centrándose en los meses especificados.

### ➖ Selección de Transacciones Negativas
Se crea un nuevo DataFrame que incluye solo las transacciones negativas y se convierten a valores absolutos.

### 📊 Agrupación de Datos
Los datos se agrupan por 'Mes', 'Ano' y 'tipo' (categorías de gastos) para calcular la suma de las transacciones negativas.

### 🗓️ Creación de la Columna Mes-Año
Se crea una nueva columna que combina mes y año para facilitar la visualización.

### 📏 Ordenación de Eje X
Se establece un orden específico para el eje X con las combinaciones de mes y año.

### 📈 Pivotación del DataFrame
Se pivotan los datos para facilitar la visualización, creando un formato en el que las filas representan meses y las columnas representan categorías de gastos.

### 📊 Modelado Predictivo
Se prepara el DataFrame para el modelado:
- **Características (`X`)**: Se utiliza el índice de los meses como variable independiente.
- **Etiquetas (`y`)**: Se suman las transacciones por categoría para obtener el total de gastos.

### 🔄 División de Datos
Se divide el conjunto de datos en entrenamiento (80%) y prueba (20%).

### 📉 Regresión Lineal
Se crea un modelo de regresión lineal, se ajusta a los datos de entrenamiento y se realizan predicciones.

### 📏 Evaluación del Modelo
Se calcula el error cuadrático medio (MSE) para evaluar la precisión del modelo.

### 📊 Visualización de Predicciones
Se grafica la comparación entre los valores reales y las predicciones del modelo de gastos por categorías.

### 📊 Creación del Gráfico de Columnas Apiladas
Se genera un gráfico de columnas apiladas que muestra la distribución de los gastos por categoría a lo largo del tiempo, con colores diferenciados para cada tipo de gasto.

### ⚙️ Configuración de Gráficos
Se añaden títulos y etiquetas a los ejes, se ajusta la leyenda y se muestra el gráfico.

---

### Gráficos Diseñados
- **Gráfico de Predicciones de Gastos por Categorías**:
  - Muestra la comparación entre los gastos reales y los predichos, con líneas diferenciadas.

- **Gráfico de Columnas Apiladas de Gastos**:
  - Representa la distribución de gastos por categoría a lo largo de los meses, proporcionando una visualización clara de cómo cambian los gastos en diferentes categorías.

