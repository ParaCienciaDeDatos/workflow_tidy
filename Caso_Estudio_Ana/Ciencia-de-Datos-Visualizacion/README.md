# Ciencia de Datos — Visualización

Material práctico del curso de Ciencia de Datos sobre visualización con R.

## Contenido

- `laptops_exploratorio.qmd` — análisis exploratorio visual con `ggplot2`
- `sf_capas.qmd` — capas geográficas con el paquete `sf`

## Cómo usar estos materiales

1. Clonar el repositorio:
   ```bash
   git clone https://github.com/anahaique/Ciencia-de-Datos-Visualizacion.git
   ```

2. Abrir el archivo `GIT.Rproj` en RStudio.

3. Renderizar cualquier `.qmd` con el botón **Render** (o `Ctrl + Shift + K`).

## Requisitos

- R (≥ 4.3) y RStudio
- Quarto: <https://quarto.org/docs/get-started/>
- Paquetes de R: `tidyverse`, `sf`, `readxl`

  ```r
  install.packages(c("tidyverse", "sf", "readxl"))
  ```

## Datos

Los datasets están incluidos en el repositorio: `laptops.csv` y `ypf_neuquen.xlsx`.
