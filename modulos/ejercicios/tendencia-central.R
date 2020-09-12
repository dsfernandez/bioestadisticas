## códigos para trabajar ejercicios de tendencia central y dispersión
# 

# crear vector de edades de la clase
edades <- c(21,24,20,21,19,21,21,21,21,22,23,21,25,20,19,21,20,23,23,21,20,20,21,19,20)

# para calcular proporciones
tabla_frec <- table(edades)
tabla_frec #produce tabla de frecuencias de las edades
# para obtener el valor mayor de frecuencia 
mas_frec <- max(tabla_frec)
mas_frec
# para obtener el número de datos
total_datos <- length(edades)
total_datos
# proporción y % del valor más frecuente
proporcion_mas_frec <- mas_frec/total_datos 
proporcion_mas_frec
# % 
proporcion_mas_frec * 100

# moda
# la moda la podemos obtener de la tabla anterior
# pero también con esta función
# crear función
getmode <- function(x) {
  uniqv <- unique(x)
  uniqv[which.max(tabulate(match(x, uniqv)))]
}
# usarla con los datos
moda <- getmode(edades)
moda
  
# mediana
mediana <- median(edades)
mediana

# media
promedio <- mean(edades)
promedio  

# usando las frecuencias para media ponderada
tabla_frec2 <- as.matrix(tabla_frec) #transformar a matriz
tabla_frec2 # contiene variables edades y Freq
# vamos a extaerlos como vectores
edad <- as.numeric(row.names(tabla_frec2))
frecuencia <- as.numeric(tabla_frec2[,1])
# media ponderada
media_pon <- sum(edad * frecuencia)/sum(frecuencia)
media_pon

## medidas de dispersión de los datos
# rango
rango <- max(edades) - min(edades)
rango

# percentilas
# cuartiles
summary(edades)
# cualquier percentila
quantile(edades, .95)

# varianza, desviación estándar, error estándar,
# coeficiente de variación
varianza <- var(edades)
varianza

#desviación estándar
desv_estandar <- sd(edades)
desv_estandar
# tambien
de <- sqrt(varianza)
de

#error estándar
error_est <- desv_estandar/sqrt(length(edades))
error_est

# coeficiente de variación
cv <- desv_estandar/promedio
cv
# también
cv2 <- sd(edades)/mean(edades)
cv2
# en %
cv * 100



