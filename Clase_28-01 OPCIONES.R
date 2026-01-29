library("tidyverse")

So = 100
volatilidad = 0.15
mu = 0.50
delta_t = 1 / 365
iteraciones = 1000
periodos = 365
matriz_precios = matrix(, periodos + 1, iteraciones)
matriz_precios[1, ] = So
for (i in 1:iteraciones)
  for (j in 2:nrow(matriz_precios))
  {matriz_precios[j, i] =
    matriz_precios[j - 1, i] *
    exp((mu - volatilidad ^ 2 / 2) *
          delta_t +
          volatilidad *
          rnorm(1) *
          sqrt(delta_t))
  }

drift = as_tibble(apply(matriz_precios, 1, mean))
cuantiles = as_tibble(t(apply(matriz_precios, 1, quantile,
                              probs = c(0.01, 0.05, 0.95, 0.99))))


data <- drift %>%
  bind_cols(cuantiles) %>%
  mutate(Trend = seq(1,366))

ggplot(data=data, aes(x=Trend)) +
  geom_line(aes(y=value), color = "green") +
  geom_line(aes(y=`1%`), color = "blue") +
  geom_line(aes(y=`5%`), color = "darkred") +
  geom_line(aes(y=`95%`), color = "darkred") +
  geom_line(aes(y=`99%`), color = "blue")

library(ggplot2)
library(dplyr)
install.packages("triangle")

library(triangle)
#set.seed(1234567)
reps = 10000
utilidad = matrix(NA, nrow = reps, ncol = 1)
for (i in 1:reps) {
  x = sample(c("A","B","C"), 1, replace = TRUE, prob = c(1/4, 1/2, 1/4))
  if (x == "A") {
    precio = 12
    cantidad = 110}
  else if (x == "B") {
    precio = 13
    cantidad = 100
  }
  else {
    precio = 16
    cantidad = 80
  }
  costo_variable_unitario = rtriangle(1, 9, 13, 11)
  costo_fijo = 150
  utilidad[i] = (precio - costo_variable_unitario)*cantidad - costo_fijo
}
utilidad <- data.frame(utilidad)
ggplot(utilidad) +
  geom_histogram(aes(x = utilidad, y=after_stat(density)), col="black", bins = 35) +
  labs(x = "Utilidad", y = "Densidad") +
  theme(
    panel.background = element_blank(),
    axis.line = element_line()
  )
# Promedio de que la probabilidad sea menor a cero
paste0("Prob(utilidad<0) = ", round(mean(utilidad$utilidad<0),2))

# 
paste0("Valor esperado utilidad = ", round(mean(utilidad$utilidad),2))



