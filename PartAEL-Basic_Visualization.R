# Read in "fungicide.tidy"
fungicide.tidy <- read.csv("data/FungicideTidy.csv", head = TRUE)

# Make a simple X-Y graph
plot(fungicide.tidy$Severity~fungicide.tidy$Julian.Date)


# Label the X- and Y- Axes
plot(fungicide.tidy$Severity~fungicide.tidy$Julian.Date, xlab = "Julian Date", ylab = "Disease Severity", main = "Disease Severity",
     cex.lab = 1.5, cex.main = 2)

# Make a simple X-Y graph, where the symbols differ for "control" and "fungicide"
color.vector <- rep("purple", nrow(fungicide.tidy))
color.vector[which(fungicide.tidy$Experiment == "control" )] <- "red"

symbol.vector <- rep(25, nrow(fungicide.tidy))
symbol.vector[which(fungicide.tidy$Experiment == "control" )] <- 24

plot(fungicide.tidy$Severity~fungicide.tidy$Julian.Date, xlab = "Julian Date", ylab = "Disease Severity", main = "Disease Severity",
     cex.lab = 1.5, cex.main = 2, col = color.vector, pch = symbol.vector)

legend("topleft", col = c("purple", "red"), pch = c(25,24), legend = c("Fungicide", "Control"))


# Making three plots, one for each cultivar
# -----------------------------------------

# Sort the data from lowest to highest severity
fungicide.tidy <- fungicide.tidy[order(fungicide.tidy$Severity),]

# Create three separate data sets; one for each cultivar
fungicide.tidy.TwentyOneThirtySevenWheat <- fungicide.tidy[which(fungicide.tidy$Cultivar == "TwentyOneThirtySevenWheat" ), ]
fungicide.tidy.CutterWheat <- fungicide.tidy[which(fungicide.tidy$Cultivar == "CutterWheat"), ]
fungicide.tidy.JaggerWheat <- fungicide.tidy[which(fungicide.tidy$Cultivar == "JaggerWheat"), ]


par(mfrow = c(3,1), mar = c(2,2,2,2), lab = c(5,5,7))
x <- fungicide.tidy.TwentyOneThirtySevenWheat[which(fungicide.tidy.TwentyOneThirtySevenWheat$Experiment == "fungicide"),"Julian.Date"]
y <- fungicide.tidy.TwentyOneThirtySevenWheat[which(fungicide.tidy.TwentyOneThirtySevenWheat$Experiment == "fungicide"),"Severity"]
plot(y~x, xlab = "Julian Date", ylab = "Disease Severity", main = "TwentyOneThirtySevenWheat",
     cex.lab = 1.5, cex.main = 2, col = "purple", pch = 25, ylim = c(0,50))
x <- fungicide.tidy.TwentyOneThirtySevenWheat[which(fungicide.tidy.TwentyOneThirtySevenWheat$Experiment == "control"),"Julian.Date"]
y <- fungicide.tidy.TwentyOneThirtySevenWheat[which(fungicide.tidy.TwentyOneThirtySevenWheat$Experiment == "control"),"Severity"]
lines(y~x, xlab = "Julian Date", ylab = "Disease Severity", main = "Control",
     cex.lab = 1.5, cex.main = 2, col = "red", pch = 24, ylim = c(0,50), type = "p")
legend("topleft", col = c("purple", "red"), pch = c(25,24), legend = c("Fungicide", "Control"))

x <- fungicide.tidy.CutterWheat[which(fungicide.tidy.CutterWheat$Experiment == "fungicide"),"Julian.Date"]
y <- fungicide.tidy.CutterWheat[which(fungicide.tidy.CutterWheat$Experiment == "fungicide"),"Severity"]
plot(y~x, xlab = "Julian Date", ylab = "Disease Severity", main = "CutterWheat",
     cex.lab = 1.5, cex.main = 2, col = "purple", pch = 25, ylim = c(0,50))
x <- fungicide.tidy.CutterWheat[which(fungicide.tidy.CutterWheat$Experiment == "control"),"Julian.Date"]
y <- fungicide.tidy.CutterWheat[which(fungicide.tidy.CutterWheat$Experiment == "control"),"Severity"]
lines(y~x, xlab = "Julian Date", ylab = "Disease Severity", main = "Control",
      cex.lab = 1.5, cex.main = 2, col = "red", pch = 24, ylim = c(0,50), type = "p")
legend("topleft", col = c("purple", "red"), pch = c(25,24), legend = c("Fungicide", "Control"))

x <- fungicide.tidy.JaggerWheat[which(fungicide.tidy.JaggerWheat$Experiment == "fungicide"),"Julian.Date"]
y <- fungicide.tidy.JaggerWheat[which(fungicide.tidy.JaggerWheat$Experiment == "fungicide"),"Severity"]
plot(y~x, xlab = "Julian Date", ylab = "Disease Severity", main = "JaggerWheat",
     cex.lab = 1.5, cex.main = 2, col = "purple", pch = 25, ylim = c(0,50))
x <- fungicide.tidy.JaggerWheat[which(fungicide.tidy.JaggerWheat$Experiment == "control"),"Julian.Date"]
y <- fungicide.tidy.JaggerWheat[which(fungicide.tidy.JaggerWheat$Experiment == "control"),"Severity"]
lines(y~x, xlab = "Julian Date", ylab = "Disease Severity", main = "Control",
      cex.lab = 1.5, cex.main = 2, col = "red", pch = 24, ylim = c(0,50), type = "p")
legend("topleft", col = c("purple", "red"), pch = c(25,24), legend = c("Fungicide", "Control"))




# Change the symbols so that they are "histogram-like"
# ----------------------------------------------------


par(mfrow = c(3,1), mar = c(2,2,2,2), lab = c(5,5,7))
x <- fungicide.tidy.TwentyOneThirtySevenWheat[which(fungicide.tidy.TwentyOneThirtySevenWheat$Experiment == "fungicide"),"Julian.Date"]
y <- fungicide.tidy.TwentyOneThirtySevenWheat[which(fungicide.tidy.TwentyOneThirtySevenWheat$Experiment == "fungicide"),"Severity"]
plot(y~x, xlab = "Julian Date", ylab = "Disease Severity", main = "TwentyOneThirtySevenWheat",
     cex.lab = 1.5, cex.main = 2, col = "purple", pch = 25, ylim = c(0,50), type = "h")
x <- fungicide.tidy.TwentyOneThirtySevenWheat[which(fungicide.tidy.TwentyOneThirtySevenWheat$Experiment == "control"),"Julian.Date"]
y <- fungicide.tidy.TwentyOneThirtySevenWheat[which(fungicide.tidy.TwentyOneThirtySevenWheat$Experiment == "control"),"Severity"]
lines(y~x, xlab = "Julian Date", ylab = "Disease Severity", main = "Control",
      cex.lab = 1.5, cex.main = 2, col = "red", pch = 24, ylim = c(0,50), type = "h")
legend("topleft", col = c("purple", "red"), pch = c(25,24), legend = c("Fungicide", "Control"))

x <- fungicide.tidy.CutterWheat[which(fungicide.tidy.CutterWheat$Experiment == "fungicide"),"Julian.Date"]
y <- fungicide.tidy.CutterWheat[which(fungicide.tidy.CutterWheat$Experiment == "fungicide"),"Severity"]
plot(y~x, xlab = "Julian Date", ylab = "Disease Severity", main = "CutterWheat",
     cex.lab = 1.5, cex.main = 2, col = "purple", pch = 25, ylim = c(0,50), type = "h")
x <- fungicide.tidy.CutterWheat[which(fungicide.tidy.CutterWheat$Experiment == "control"),"Julian.Date"]
y <- fungicide.tidy.CutterWheat[which(fungicide.tidy.CutterWheat$Experiment == "control"),"Severity"]
lines(y~x, xlab = "Julian Date", ylab = "Disease Severity", main = "Control",
      cex.lab = 1.5, cex.main = 2, col = "red", pch = 24, ylim = c(0,50), type = "h")
legend("topleft", col = c("purple", "red"), pch = c(25,24), legend = c("Fungicide", "Control"))

x <- fungicide.tidy.JaggerWheat[which(fungicide.tidy.JaggerWheat$Experiment == "fungicide"),"Julian.Date"]
y <- fungicide.tidy.JaggerWheat[which(fungicide.tidy.JaggerWheat$Experiment == "fungicide"),"Severity"]
plot(y~x, xlab = "Julian Date", ylab = "Disease Severity", main = "JaggerWheat",
     cex.lab = 1.5, cex.main = 2, col = "purple", pch = 25, ylim = c(0,50), type = "h")
x <- fungicide.tidy.JaggerWheat[which(fungicide.tidy.JaggerWheat$Experiment == "control"),"Julian.Date"]
y <- fungicide.tidy.JaggerWheat[which(fungicide.tidy.JaggerWheat$Experiment == "control"),"Severity"]
lines(y~x, xlab = "Julian Date", ylab = "Disease Severity", main = "Control",
      cex.lab = 1.5, cex.main = 2, col = "red", pch = 24, ylim = c(0,50), type = "h")
legend("topleft", col = c("purple", "red"), pch = c(25,24), legend = c("Fungicide", "Control"))


# Change the symbols to lines
par(mfrow = c(3,1), mar = c(2,2,2,2), lab = c(5,5,7))
x <- fungicide.tidy.TwentyOneThirtySevenWheat[which(fungicide.tidy.TwentyOneThirtySevenWheat$Experiment == "fungicide"),"Julian.Date"]
y <- fungicide.tidy.TwentyOneThirtySevenWheat[which(fungicide.tidy.TwentyOneThirtySevenWheat$Experiment == "fungicide"),"Severity"]
plot(y~x, xlab = "Julian Date", ylab = "Disease Severity", main = "TwentyOneThirtySevenWheat",
     cex.lab = 1.5, cex.main = 2, col = "purple", pch = 25, ylim = c(0,50), type = "l")
x <- fungicide.tidy.TwentyOneThirtySevenWheat[which(fungicide.tidy.TwentyOneThirtySevenWheat$Experiment == "control"),"Julian.Date"]
y <- fungicide.tidy.TwentyOneThirtySevenWheat[which(fungicide.tidy.TwentyOneThirtySevenWheat$Experiment == "control"),"Severity"]
lines(y~x, xlab = "Julian Date", ylab = "Disease Severity", main = "Control",
      cex.lab = 1.5, cex.main = 2, col = "red", pch = 24, ylim = c(0,50), type = "l")
legend("topleft", col = c("purple", "red"), pch = c(25,24), legend = c("Fungicide", "Control"))

x <- fungicide.tidy.CutterWheat[which(fungicide.tidy.CutterWheat$Experiment == "fungicide"),"Julian.Date"]
y <- fungicide.tidy.CutterWheat[which(fungicide.tidy.CutterWheat$Experiment == "fungicide"),"Severity"]
plot(y~x, xlab = "Julian Date", ylab = "Disease Severity", main = "CutterWheat",
     cex.lab = 1.5, cex.main = 2, col = "purple", pch = 25, ylim = c(0,50), type = "l")
x <- fungicide.tidy.CutterWheat[which(fungicide.tidy.CutterWheat$Experiment == "control"),"Julian.Date"]
y <- fungicide.tidy.CutterWheat[which(fungicide.tidy.CutterWheat$Experiment == "control"),"Severity"]
lines(y~x, xlab = "Julian Date", ylab = "Disease Severity", main = "Control",
      cex.lab = 1.5, cex.main = 2, col = "red", pch = 24, ylim = c(0,50), type = "l")
legend("topleft", col = c("purple", "red"), pch = c(25,24), legend = c("Fungicide", "Control"))

x <- fungicide.tidy.JaggerWheat[which(fungicide.tidy.JaggerWheat$Experiment == "fungicide"),"Julian.Date"]
y <- fungicide.tidy.JaggerWheat[which(fungicide.tidy.JaggerWheat$Experiment == "fungicide"),"Severity"]
plot(y~x, xlab = "Julian Date", ylab = "Disease Severity", main = "JaggerWheat",
     cex.lab = 1.5, cex.main = 2, col = "purple", pch = 25, ylim = c(0,50), type = "l")
x <- fungicide.tidy.JaggerWheat[which(fungicide.tidy.JaggerWheat$Experiment == "control"),"Julian.Date"]
y <- fungicide.tidy.JaggerWheat[which(fungicide.tidy.JaggerWheat$Experiment == "control"),"Severity"]
lines(y~x, xlab = "Julian Date", ylab = "Disease Severity", main = "Control",
      cex.lab = 1.5, cex.main = 2, col = "red", pch = 24, ylim = c(0,50), type = "l")
legend("topleft", col = c("purple", "red"), pch = c(25,24), legend = c("Fungicide", "Control"))


# Change the symbols to points and lines
pdf("results/Disease.Severity.Fungicide.vs.Control.pdf", width = 8)
  par(mfrow = c(3,1), mar = c(5,5,5,5), lab = c(5,5,7))
  x <- fungicide.tidy.TwentyOneThirtySevenWheat[which(fungicide.tidy.TwentyOneThirtySevenWheat$Experiment == "fungicide"),"Julian.Date"]
  y <- fungicide.tidy.TwentyOneThirtySevenWheat[which(fungicide.tidy.TwentyOneThirtySevenWheat$Experiment == "fungicide"),"Severity"]
  plot(y~x, xlab = "Julian Date", ylab = "Disease Severity", main = "TwentyOneThirtySevenWheat",
       cex.lab = 1.5, cex.main = 2, col = "purple", pch = 25, ylim = c(0,50), type = "b")
  x <- fungicide.tidy.TwentyOneThirtySevenWheat[which(fungicide.tidy.TwentyOneThirtySevenWheat$Experiment == "control"),"Julian.Date"]
  y <- fungicide.tidy.TwentyOneThirtySevenWheat[which(fungicide.tidy.TwentyOneThirtySevenWheat$Experiment == "control"),"Severity"]
  lines(y~x, xlab = "Julian Date", ylab = "Disease Severity", main = "Control",
        cex.lab = 1.5, cex.main = 2, col = "red", pch = 24, ylim = c(0,50), type = "b")
  legend("topleft", col = c("purple", "red"), pch = c(25,24), legend = c("Fungicide", "Control"))
  
  x <- fungicide.tidy.CutterWheat[which(fungicide.tidy.CutterWheat$Experiment == "fungicide"),"Julian.Date"]
  y <- fungicide.tidy.CutterWheat[which(fungicide.tidy.CutterWheat$Experiment == "fungicide"),"Severity"]
  plot(y~x, xlab = "Julian Date", ylab = "Disease Severity", main = "CutterWheat",
       cex.lab = 1.5, cex.main = 2, col = "purple", pch = 25, ylim = c(0,50), type = "b")
  x <- fungicide.tidy.CutterWheat[which(fungicide.tidy.CutterWheat$Experiment == "control"),"Julian.Date"]
  y <- fungicide.tidy.CutterWheat[which(fungicide.tidy.CutterWheat$Experiment == "control"),"Severity"]
  lines(y~x, xlab = "Julian Date", ylab = "Disease Severity", main = "Control",
        cex.lab = 1.5, cex.main = 2, col = "red", pch = 24, ylim = c(0,50), type = "b")
  legend("topleft", col = c("purple", "red"), pch = c(25,24), legend = c("Fungicide", "Control"))
  
  x <- fungicide.tidy.JaggerWheat[which(fungicide.tidy.JaggerWheat$Experiment == "fungicide"),"Julian.Date"]
  y <- fungicide.tidy.JaggerWheat[which(fungicide.tidy.JaggerWheat$Experiment == "fungicide"),"Severity"]
  plot(y~x, xlab = "Julian Date", ylab = "Disease Severity", main = "JaggerWheat",
       cex.lab = 1.5, cex.main = 2, col = "purple", pch = 25, ylim = c(0,50), type = "b")
  x <- fungicide.tidy.JaggerWheat[which(fungicide.tidy.JaggerWheat$Experiment == "control"),"Julian.Date"]
  y <- fungicide.tidy.JaggerWheat[which(fungicide.tidy.JaggerWheat$Experiment == "control"),"Severity"]
  lines(y~x, xlab = "Julian Date", ylab = "Disease Severity", main = "Control",
        cex.lab = 1.5, cex.main = 2, col = "red", pch = 24, ylim = c(0,50), type = "b")
  legend("topleft", col = c("purple", "red"), pch = c(25,24), legend = c("Fungicide", "Control"))
dev.off()

# Reset par at the end so that none of the bells and whistles specified in previous graphs are carried foward to the next graph
par()






