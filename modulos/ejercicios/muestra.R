# de la clase de biometria seleccionar 2 estud. al azar
sample(1:26, 2, replace = F)

# probando replace T
sample(1:26, 20, replace = T)

# coordenada X
coor.x <- sample(1:30, 30, replace = T)
# coordenada Y
coor.y <- sample(1:20, 30, replace = T)
# unimos las coordenadas
# aqui escriben
coord.girasol <- data.frame(coor.x, coor.y)
coord.girasol