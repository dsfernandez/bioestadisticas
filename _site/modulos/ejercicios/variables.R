# paquetes necesarios - debes descargarlos usando Packages
library(MASS)
library(ggplot2)
# revisando los datos del archivo mammals
View(mammals)
# histograma de la masa del cerebro (g)
ggplot(data = mammals, aes(brain)) +
  geom_histogram()
# transformación log10 de la masa cerebral
log_brain <- log10(mammals$brain)
mamiferos <- data.frame(mammals, log_brain)
# histograma con variable transformada
ggplot(data = mamiferos, aes(log_brain)) +
  geom_histogram()
