library(readr)
programadoras<-read_csv("programadorasnew.csv")
## nombres de las variables
names(programadoras)
## que contiene el dataset
head(programadoras)
## tamaño del dataset
dim(programadoras)

## cantidad de unidades académicas por anio
table(programadoras$anio)

library(dplyr)
#mujeres
mujeres<-programadoras %>%
  select(estMujeres, anio) %>%
  group_by(anio) %>%
  summarize(mujeres=sum(estMujeres))
#varones 
varones<-programadoras %>%
  select(estVarones, anio) %>%
  group_by(anio) %>%
  summarize(varones=sum(estVarones))
#totales
totales<-programadoras %>%
  group_by(anio) %>%
  summarize(totales=sum(anio))

#unimos los datos
data1<-left_join(mujeres2, varones)
data<-left_join(data1, totales)

#tenemos el dataset "data" para hacer los graficos correspondientes

# otra disposicion para graficar

#mujeres
mujeres2<-programadoras %>%
  select(estMujeres, anio) %>%
  group_by(anio) %>%
  summarize(count=sum(estMujeres))
#varones 
varones2<-programadoras %>%
  select(estVarones, anio) %>%
  group_by(anio) %>%
  summarize(count=sum(estVarones))
#totales
totales2<-programadoras %>%
  group_by(anio) %>%
  summarize(count=sum(anio))

# unimos los dataset pero por filas (INCLUIDOS LOS TOTALES)

data2<-rbind(mujeres2, varones2, totales2)
genero1<-c("f", "f", "f", "f", "f", "f", "m", "m", "m","m", "m", "m", "t", "t", "t", "t", "t", "t")
data2<-cbind(datam, genero)
data2


# unimos por filas (solo generos femenino y masculino) NO INCLUIDOS LOS TOTALES 

data3<-rbind(mujeres2, varones2)
genero2<-c("f", "f", "f", "f", "f", "f", "m", "m", "m","m", "m", "m")
data3<-cbind(data3, genero2)
data3

# graficar 
#un solo grafico
library(ggplot2)
ggplot(data=data3, aes(x=anio, y=count, colour=genero2))+
  geom_point()
#lineas
ggplot(data=data3, aes(x=anio, y=count, colour=genero2))+
  geom_line()

#facetado
ggplot(data=data3, aes(x=anio, y=count, colour=genero2))+
  geom_point() +
  facet_wrap(~genero2)

ggplot(data=data3, aes(x=anio, y=count, colour=genero2))+
  geom_line() +
  facet_wrap(~genero2)

