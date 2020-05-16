library(ggplot2)
library(reshape2)
library(ggpubr)

percentage <- read.csv("percentages.csv")

attach(percentage)

plot(Month, X4.1)

percentage.m <- melt(percentage, id="Month")

percentage.o <- na.omit(percentage.m)

all <- ggplot(percentage.o, aes(x=Month, y=value, color=variable, group=variable)) + geom_point(na.rm = TRUE, size=2) + geom_line() + theme(panel.background = element_rect(fill = 'white'), panel.grid.major = element_line(colour = "grey80"),panel.grid.minor = element_line(colour = "gray90"))

a.1 <- all + scale_colour_manual(values = c("red", "gray85", "gray85", "gray85", "gray85", "gray85", "gray85", "gray85", "gray85", "gray85", "gray85")) + guides(colour = guide_legend(override.aes = list(color = c("red", "blue", "green", "pink", "gray85", "gray85", "gray85", "gray85", "gray85", "gray85", "gray85"))))

a.2 <- all + scale_colour_manual(values = c("gray85", "blue", "gray85", "gray85", "gray85", "gray85", "gray85", "gray85", "gray85", "gray85", "gray85"))

a.3 <- all + scale_colour_manual(values = c("gray85", "gray85", "green", "gray85", "gray85", "gray85", "gray85", "gray85", "gray85", "gray85", "gray85"))

a.4 <- all + scale_colour_manual(values = c("gray85", "gray85", "gray85", "pink", "gray85", "gray85", "gray85", "gray85", "gray85", "gray85", "gray85"))

a.5 <- all + scale_colour_manual(values = c("gray85", "gray85", "gray85", "gray85", "yellow", "gray85", "gray85", "gray85", "gray85", "gray85", "gray85"))

a.6 <- all + scale_colour_manual(values = c("gray85", "gray85", "gray85", "gray85", "gray85", "orange", "gray85", "gray85", "gray85", "gray85", "gray85"))

a.7 <- all + scale_colour_manual(values = c("gray85", "gray85", "gray85", "gray85", "gray85", "gray85", "cyan", "gray85", "gray85", "gray85", "gray85"))

a.8 <- all + scale_colour_manual(values = c("gray85", "gray85", "gray85", "gray85", "gray85", "gray85", "gray85", "purple", "gray85", "gray85", "gray85"))

a.9 <- all + scale_colour_manual(values = c("gray85", "gray85", "gray85", "gray85", "gray85", "gray85", "gray85", "gray85", "black", "gray85", "gray85"))

a.10 <- all + scale_colour_manual(values = c("gray85", "gray85", "gray85", "gray85", "gray85", "gray85", "gray85", "gray85", "brown", "gray85", "gray85"))

a.11 <- all + scale_colour_manual(values = c("gray85", "gray85", "gray85", "gray85", "gray85", "gray85", "gray85", "gray85", "gray85", "gray85", "red"))


final <- ggarrange(a.1, a.2, a.3, a.4, a.5, a.6, a.7, a.8, a.9, a.10, a.11, legend="right", common.legend=TRUE)




#====
#This might be useful for splitting:
#ggplot(percentage.m, aes(x=Month, y=value, group=variable)) + geom_point(aes(color=variable),na.rm = TRUE, size=2)


#remove x-axis by
#https://stackoverflow.com/questions/35090883/remove-all-of-x-axis-labels-in-ggplot#35090981
#        axis.ticks.x=element_blank())
		
#====

ps4.1 <- subset(percentage.o, variable == "X4.1")
ps4.2 <- subset(percentage.o, variable == "X4.2")
ps4.3 <- subset(percentage.o, variable == "X4.3")
ps4.4 <- subset(percentage.o, variable == "X4.4")
ps5 <- subset(percentage.o, variable == "X5")
ps5.1 <- subset(percentage.o, variable == "X5.1")
ps6 <- subset(percentage.o, variable == "X6")
ps7 <- subset(percentage.o, variable == "X7")
ps7.1 <- subset(percentage.o, variable == "X7.1")
ps8 <- subset(percentage.o, variable == "X8")

ggplot(percentage.o, aes(x=Month, y=value))+ geom_point(color="grey", size=2, alpha=0.2) +
geom_line(data=ps4.2, color="grey", size=2, alpha=0.3) +
geom_line(data=ps4.3, color="grey", size=2, alpha=0.3) +
geom_line(data=ps4.4, color="grey", size=2, alpha=0.3) +
geom_line(data=ps5, color="grey", size=2, alpha=0.3) +
geom_line(data=ps5.1, color="grey", size=2, alpha=0.3) +
geom_line(data=ps6, color="grey", size=2, alpha=0.3) +
geom_line(data=ps7, color="grey", size=2, alpha=0.3) +
geom_line(data=ps7.1, color="grey", size=2, alpha=0.3) +
geom_line(data=ps8, color="grey", size=2, alpha=0.3) +

geom_point(data=ps4.1, aes(Month, value, color='red'), alpha=1) +
geom_line(data=ps4.1, aes(Month, value, color='red'), size=2, alpha=1) +
theme(panel.background = element_rect(fill = 'white'), panel.grid.major = element_line(colour = "grey80"),panel.grid.minor = element_line(colour = "gray90"))

#====
