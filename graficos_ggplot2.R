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
------------------------------------------------------------------
------------------------------------------------------------------
------------ #estudiantes------------------------------------
  
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
genero<-c("f", "f", "f", "f", "f", "f", "m", "m", "m","m", "m", "m")
data3<-cbind(data3, genero2)
data3

# graficar 
#un solo grafico
library(ggplot2)
ggplot(data=data3, aes(x=anio, y=count, colour=genero))+
  geom_point()
#lineas
ggplot(data=data3, aes(x=anio, y=count, colour=genero))+
  geom_line()

#facetado
ggplot(data=data3, aes(x=anio, y=count, colour=genero))+
  geom_point() +
  facet_wrap(~genero2)

ggplot(data=data3, aes(x=anio, y=count, colour=genero))+
  geom_line() +
  facet_wrap(~genero2)

--------------------------------------------------------------
--------------------------------------------------------------
--------------#ingresantes mujeres-----------------------------

mujeres_ing<-programadoras %>%
  select(niMujeres, anio) %>%
  group_by(anio) %>%
  summarize(ingresantes=sum(niMujeres))
#varones 
varones_ing<-programadoras %>%
  select(niVarones, anio) %>%
  group_by(anio) %>%
  summarize(ingresantes=sum(niVarones))

data_ing<-rbind(mujeres_ing, varones_ing)
data_ing<-cbind(data_ing, genero2)
data_ing

ggplot(data=data_ing, aes(x=anio, y=ingresantes, colour=genero))+
  geom_point()

-----------------------------------------------------------------
-----------------------------------------------------------------
-------------------#egresadas mujeres----------------------------
#mujeres
mujeres_eg<-programadoras %>%
  select(egMujeres, anio) %>%
  group_by(anio) %>%
  summarize(egresadxs=sum(egMujeres))
#varones 
varones_eg<-programadoras %>%
  select(egVarones, anio) %>%
  group_by(anio) %>%
  summarize(egresadxs=sum(egVarones))

data_eg<-rbind(mujeres_eg, varones_eg)
data_eg<-cbind(data_eg, genero2)
data_eg

ggplot(data=data_eg, aes(x=anio, y=egresadxs, colour=genero))+
  geom_point()


