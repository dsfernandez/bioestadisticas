# paquetes necesarios
library(readxl)
library(dplyr)
library(ggplot2)
library(moments)
library(car)

# datos excel -> data.frame
semillas <- read_excel("semilla_thepol.xlsx", 
                       sheet = "masa-long")
head(semillas)

# gráfica con curva de densidad normal
m_sd <- semillas %>%
  summarise(means = mean(masa_g), sd=sd(masa_g))
ggplot(semillas, aes(x=masa_g)) +
  geom_histogram(aes(y=..density..), position="identity", 
                 binwidth=.02, color="blue", fill="gray") +
  stat_function(fun = dnorm, color="red", size=1, 
                args=list(mean=m_sd$means, sd=m_sd$sd)) +
  labs(x="Masa de semilla, mm", y="densidad")

# cálculo de probabilidad (proporción) o valor z
## proporción para media y desviación estándar conocidas
psem <- pnorm(11, mean = 10.15, sd = 1.60, lower.tail= FALSE)
sprintf("Proporción de semillas con longitud mayor de 11 mm = %.3f", psem)
## valor correspondiente a una P de la distr. normal
valor <- qnorm(0.29763, mean = 10.15, sd = 1.60, lower.tail = FALSE)
sprintf("Longitud de semillas para separar el 29.76%% más grandes = %.3f", valor)

# error estándar de la media
## 1000 muestras de n = 4
samples <- replicate(1000, sample(semillas$masa_g, 4, replace = TRUE))
## media y suma de columnas (muestras)
sample_means <- colMeans(samples)
sample_sums <- colSums(samples)
## media y sd de las medias muestrales
mx <- mean(sample_means)
smx <- sd(sample_means)
## data frame para ggplot
sample_stats <- data.frame(sample_means, sample_sums)
## histograma y curva normal ajustada
ggplot(sample_stats, aes(x=sample_means)) +
  geom_histogram(aes(y=..density..), position="identity", binwidth=.01, color="blue", fill="gray") +
  stat_function(fun = dnorm, color="red", size=1, args=list(mean=mx, sd=smx)) +
  labs(x="Masa de semilla, g", y="densidad")
sprintf("Media de las muestras (n = 4) = %.4f", mx)
sprintf("Desv. Est. de la media muestral (n = 4) = %.4f", smx)

# sesgo y curtosis
sk <- skewness(semillas$masa_g)
ku <- kurtosis(semillas$masa_g) - 3
sprintf("Sesgo en distribución valores de masa = %.3f", sk)
sprintf("Curtosis en distribución valores de masa = %.3f", ku)

# grafica Q-Q
car::qqPlot(semillas$masa_g, id = FALSE, 
            xlab = "valores de z", ylab = "masa de semilla, g")

# prueba de Shapir0-Wilk
sw <- shapiro.test(semillas$masa_g)
sw