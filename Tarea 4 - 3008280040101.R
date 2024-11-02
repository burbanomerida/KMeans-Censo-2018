install.packages("arules")
library(arules)
data = read.csv('D:/Censo2018/Censo2018/MIGRACION_BDP.csv', sep = ',', nrows = 15000)
data_seleccion <- data[, c("PEI4", "PEI5")]
data_seleccion <- subset(data_seleccion, PEI5 < 2500)
cluster <- kmeans(data_seleccion, centers = 4)

install.packages("ggplot2")
library(ggplot2)

centros <- as.data.frame(cluster$centers)
names(centros) <- c("PEI4", "PEI5")

grafico <- ggplot(data_seleccion, aes(x = PEI4, y = PEI5, color = as.factor(cluster$cluster))) + 
  geom_point()+
  geom_point(data = centros, aes(x = PEI4, y = PEI5), color = "red", size = 4, shape = 8) +
  labs(color = "Cluster") +
  theme_minimal()

grafico