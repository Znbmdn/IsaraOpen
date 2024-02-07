## Quelques commande de bases


iris
dim(iris)

sl <- iris$Sepal.Length
iris[4]

iris [ ,1]
iris[4 ,1]
names(iris)

#Graphiques
hist(x = sl)
hist(sl)


plot(sl)
plot(x= iris[,1], y=iris[,2])

barplot(c(a=5, b=6, c=7, d=3))
barplot(table(iris$Species))

boxplot(iris$Sepal.Length~iris$Species)

par(mfrow=c(1,2))
hist(sl)
barplot(table(iris$Species), las=3)


## ggplot2
library(ggplot2)
## fonction principale
names(iris)
ggplot(data= iris, 
       mapping=aes(x = Sepal.Length,y = Sepal.Width, color=Species))+ 
  geom_point()+
  geom_point(size= 1, aes(x= Sepal.Length, y=Sepal.Width, color=Species))+
  geom_smooth(method="lm")+
  facet_wrap(vars(Species))+
  facet_grid(rows= vars(Species))+
  theme_dark()+
  theme_minimal()

ggplot(data = iris,
       mapping = aes(x= Sepal.Length))+
  geom_histogram(bins=15)+
  facet_grid(rows= vars(Species))


ggplot(data=iris,
       mapping= aes(x=Species, y=Sepal.Length))+
  geom_boxplot()

boxplot(iris$Sepal.Length~iris$Species)

ggplot(iris, aes(x=Species, y = Sepal.Length))+
  geom_boxplot()+
  geom_point(position="jitter")

f <- ggplot(mpg, aes(class,hwy))
f+geom_col()


### Données
library(dplyr)
data("starwars")
data("diamonds")

starwars
names(starwars)
diamonds
?diamonds
data(package="ggplot2")

## 3 Graphiques à partir de ces 2 jeux de données
library(ggplot2)
data("starwars")
names(starwars)

ggplot(starwars, aes(x=species))+
  geom_area(color= "pink")+
  labs(title="Nombre de films par espèce", 
       x="Species", 
       y="films")+
  theme_classic()

starwars
dim(starwars)

Species <- unique(starwars$species)

ggplot(data=starwars,
       mapping= aes(x=Species, y=films))+
  geom_bar()+
  geom_point(position="jitter")

## Données
data("diamonds")
names(diamonds)

##Graphiques

ggplot(diamonds, aes(x = cut, y = price)) +
  geom_boxplot() +
  labs(title = "Distribution des prix par coupe",
       x = "Coupe",
       y = "Prix")

ggplot(diamonds, aes(x = cut, y = price, fill = cut)) +
  geom_boxplot(alpha = 0.7) +  # Ajouter une transparence aux boîtes
  geom_jitter(position = position_jitter(width = 0.1), color = "black", size = 0.1) +  # Ajouter des points jitter
  labs(title = "Distribution des prix par coupe",
       x = "Coupe",
       y = "Prix") +
  theme_minimal()  # Utiliser un thème minimal pour une meilleure lisibilité


ggplot(diamonds, aes(x = cut, y = price, )) +
  geom_point() +
  labs(title = "Relation entre, Prix et Qualité de Coupe",
       x = "Prix",
       y = "Carat") +
  theme_minimal()+
  geom_boxplot() 
