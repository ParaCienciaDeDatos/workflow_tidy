resumen <- function(.datos) {
  
  ## Función para resumen de variables cuantitativas (mejorada)
  
  ## En este condicional se incluye los data frames y tibbles
  if (!is.data.frame(.datos)) {
    stop("El objeto ingresado no es un data.frame o tibble.")
  }
  ## En caso que no esté cargado alguno de los paquetes importantes
  if (!requireNamespace("dplyr", quietly = TRUE) ||
      !requireNamespace("tidyr", quietly = TRUE)) {
    stop("Se requieren los paquetes 'dplyr' y 'tidyr'.")
  }
  
  
  resultados <- .datos |> 
    summarise(
      across(
        where(is.numeric),
        list(   ## muchos estadísticos se ponen en una lista.
          nas = ~sum(is.na(.)),
          n = ~sum(!is.na(.)),
          media = ~mean(., na.rm = TRUE),
          mediana = ~median(., na.rm = TRUE),
          q1 = ~as.numeric(quantile(., 0.25, na.rm = TRUE)),
          q3 = ~as.numeric(quantile(., 0.75, na.rm = TRUE)),
          min = ~min(., na.rm = TRUE),
          max = ~max(., na.rm = TRUE),
          rango = ~max(., na.rm = TRUE) - min(., na.rm = TRUE),
          sd = ~sd(., na.rm = TRUE),
          var = ~var(., na.rm = TRUE),
          CV = ~sd(., na.rm = TRUE) / mean(., na.rm = TRUE) * 100
        ),
        .names = "{.col}_{.fn}"
      )
    )|>
    pivot_longer(
      cols = everything(),
      names_to = c("variable", "estadistico"),
      names_pattern = "(.*)_(.*)"
    )|> 
    pivot_wider(
      names_from = estadistico,
      values_from = value
    )
  
  resultados
}