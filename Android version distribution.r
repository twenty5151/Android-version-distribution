png(filename = "test.png", width = 1000, height = 1000, units = "px", res=150)

library(ggplot2)
library(reshape2)
library(ggpubr)

percentage <- read.csv("https://github.com/yc-tsui/Android-version-distribution/blob/master/percentages.csv")

percentage.m <- melt(percentage, id="Month")

percentage.o <- na.omit(percentage.m)




base.plot <- ggplot(percentage.o, aes(x=Month, y=value))+ geom_point(color="grey", size=1, alpha=0.05)

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
ps8.1 <- subset(percentage.o, variable == "X8.1")

line4.1 <- geom_line(data=ps4.1, color="grey", size=1, alpha=0.2)
line4.2 <- geom_line(data=ps4.2, color="grey", size=1, alpha=0.2)
line4.3 <- geom_line(data=ps4.3, color="grey", size=1, alpha=0.2)
line4.4 <- geom_line(data=ps4.4, color="grey", size=1, alpha=0.2)
line5 <- geom_line(data=ps5, color="grey", size=1, alpha=0.2)
line5.1 <- geom_line(data=ps5.1, color="grey", size=1, alpha=0.2)
line6 <- geom_line(data=ps6, color="grey", size=1, alpha=0.2)
line7 <- geom_line(data=ps7, color="grey", size=1, alpha=0.2)
line7.1 <- geom_line(data=ps7.1, color="grey", size=1, alpha=0.2)
line8 <- geom_line(data=ps8, color="grey", size=1, alpha=0.2)
line8.1 <- geom_line(data=ps8.1, color="grey", size=1, alpha=0.2)

spp4.1 <- geom_point(data=ps4.1, aes(Month, value), alpha=1, color='red')
spp4.2 <- geom_point(data=ps4.2, aes(Month, value), alpha=1, color='blue')
spp4.3 <- geom_point(data=ps4.3, aes(Month, value), alpha=1, color='green')
spp4.4 <- geom_point(data=ps4.4, aes(Month, value), alpha=1, color='pink')
spp5 <- geom_point(data=ps5, aes(Month, value), alpha=1, color='yellow')
spp5.1 <- geom_point(data=ps5.1, aes(Month, value), alpha=1, color='orange')
spp6 <- geom_point(data=ps6, aes(Month, value), alpha=1, color='cyan')
spp7 <- geom_point(data=ps7, aes(Month, value), alpha=1, color='purple')
spp7.1 <- geom_point(data=ps7.1, aes(Month, value), alpha=1, color='black')
spp8 <- geom_point(data=ps8, aes(Month, value), alpha=1, color='brown')
spp8.1 <- geom_point(data=ps8.1, aes(Month, value), alpha=1, color='red')

spl4.1 <- geom_line(data=ps4.1, aes(Month, value), size=2, alpha=1, color='red')
spl4.2 <- geom_line(data=ps4.2, aes(Month, value), size=2, alpha=1, color='blue')
spl4.3 <- geom_line(data=ps4.3, aes(Month, value), size=2, alpha=1, color='green')
spl4.4 <- geom_line(data=ps4.4, aes(Month, value), size=2, alpha=1, color='pink')
spl5 <- geom_line(data=ps5, aes(Month, value), size=2, alpha=1, color='yellow')
spl5.1 <- geom_line(data=ps5.1, aes(Month, value), size=2, alpha=1, color='orange')
spl6 <- geom_line(data=ps6, aes(Month, value), size=2, alpha=1, color='cyan')
spl7 <- geom_line(data=ps7, aes(Month, value), size=2, alpha=1, color='purple')
spl7.1 <- geom_line(data=ps7.1, aes(Month, value), size=2, alpha=1, color='black')
spl8 <- geom_line(data=ps8, aes(Month, value), size=2, alpha=1, color='brown')
spl8.1 <- geom_line(data=ps8.1, aes(Month, value), size=2, alpha=1, color='red')

base.theme <- theme(panel.background = element_rect(fill = 'white'), panel.grid.major = element_line(colour = "grey80"),panel.grid.minor = element_line(colour = "gray90"))




X4.1 <- base.plot +
line4.2 + line4.3 + line4.4 + line5 + line5.1 + line6 + line7 + line7.1 + line8 + line8.1 +
spp4.1 + spl4.1 +
base.theme

X4.2 <- base.plot +
line4.1 + line4.3 + line4.4 + line5 + line5.1 + line6 + line7 + line7.1 + line8 + line8.1 +
spp4.2 + spl4.2 +
base.theme

X4.3 <- base.plot +
line4.1 + line4.2 + line4.4 + line5 + line5.1 + line6 + line7 + line7.1 + line8 + line8.1 +
spp4.3 + spl4.3 +
base.theme

X4.4 <- base.plot +
line4.1 + line4.2 + line4.3 + line5 + line5.1 + line6 + line7 + line7.1 + line8 + line8.1 +
spp4.4 + spl4.4 +
base.theme

X5 <- base.plot +
line4.1 + line4.2 + line4.3 + line4.4 + line5.1 + line6 + line7 + line7.1 + line8 + line8.1 +
spp5 + spl5 +
base.theme

X5.1 <- base.plot +
line4.1 + line4.2 + line4.3 + line4.4 + line5 + line6 + line7 + line7.1 + line8 + line8.1 +
spp5.1 + spl5.1 +
base.theme

X6 <- base.plot +
line4.1 + line4.2 + line4.3 + line4.4 + line5 + line7 + line7.1 + line8 + line8.1 +
spp6 + spl6 +
base.theme

X7 <- base.plot +
line4.1 + line4.2 + line4.3 + line4.4 + line5 + line6 + line7.1 + line8 + line8.1 +
spp7 + spl7 +
base.theme

X7.1 <- base.plot +
line4.1 + line4.2 + line4.3 + line4.4 + line5 + line6 + line7 + line8 + line8.1 +
spp7.1 + spl7.1 +
base.theme

X8 <- base.plot +
line4.1 + line4.2 + line4.3 + line4.4 + line5 + line6 + line7 + line8.1 +
spp8 + spl8 +
base.theme

X8.1 <- base.plot +
line4.1 + line4.2 + line4.3 + line4.4 + line5 + line6 + line7 + line8 +
spp8.1 + spl8.1 +
base.theme


final <- ggarrange(X4.1, X4.2, X4.3, X4.4, X5, X5.1, X6, X7, X7.1, X8, X8.1, legend="right", common.legend=TRUE)

final


dev.off()
