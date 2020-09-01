## gráfica de puntos
# activación de paquete de gráficas
library(ggplot2)
# cargar datos melocactus
melocactus <- read.csv("./modulos/data/melocactus.csv")
# gráfica de puntos
scpl <- ggplot(melocactus, aes(alturatotal, longinflo))
scpl + geom_point() +
  theme(axis.title=element_text(size=20,face="bold"), axis.text=element_text(size=12, face="bold")) +
  labs(x="Altura total, cm", y="Longitud de la inflorescencia, cm") +
  theme(axis.text=element_text(size=12),
        axis.title=element_text(size=14,face="bold"))

## tabla
# activar paquetes y cargar datos
library(kableExtra)
library(car)
data("mtcars")
# crear data frame
tabla <- mtcars[1:5, 1:4]
# construir tabla
tabla %>%
  kbl(caption = "Tabla 1.  Características mecánicas del motor de cinco modelos de automóbiles") %>%
  kable_classic(full_width = F, html_font = "Cambria")
# tabla correcta
# agregar unidades a las columnas (variables)
tabla <- setNames(tabla, c("mpg, miles/gallon", "cyl, number of cylinders", "disp, cubic cm", "hp, horse-power" ))
# construir nueva tabla
tabla %>%
  kbl(caption = "Tabla 1.  Características mecánicas del motor de cinco modelos de automóbiles") %>%
  kable_classic(full_width = F, html_font = "Cambria")

## grafica de barras
# cargar datos de archivo .Rdata
load("./modulos/data/Arthr.Rdata")
# gráfica de barras separadas
ggplot(Arthritis, aes(x=Treatment, fill=Improved)) +
  geom_bar(position="dodge")

## histograma
hist.melodata <- ggplot(melocactus, aes(alturatotal)) + 
  geom_histogram(binwidth=5, colour="white", fill="green") +
  labs(x="Altura total de la planta,cm", y = "Frecuencia")
hist.melodata

