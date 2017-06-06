# Read in "fungicide.tidy"
fungicide.tidy <- read.csv("data/FungicideTidy.csv", head = TRUE)

# Make a simple X-Y graph
plot(fungicide.tidy$Severity~fungicide.tidy$Julian.Date)


# Label the X- and Y- Axes
plot(fungicide.tidy$Severity~fungicide.tidy$Julian.Date, xlab = "Julian Date", ylab = "Disease Severity", main = "Disease Severity",
     cex.lab = 1.5, cex.main = 2)

# Make a simple X-Y graph, where the symbols differ for "control" and "fungicide"
# Alex: fix this, get this to work, and add a legend
color.vector <- rep("purple", nrow(fungicide.tidy))
color.vector[which(fungicide.tidy$Experiment == "control" )] = "red"

symbol.vector <- rep(25, nrow(fungicide.tidy))
symbol.vector[which(fungicide.tidy$Experiment == "control" )] = 24

plot(fungicide.tidy$Severity~fungicide.tidy$Julian.Date, xlab = "Julian Date", ylab = "Disease Severity", main = "Disease Severity",
     cex.lab = 1.5, cex.main = 2, col = color.vector, pch = symbol.vector)

legend("topleft", col = c("purple", "red"), pch = c(25,24), legend = c("Fungicide", "Control"))


# Show how to have two side-by-side plots
fungicide.tidy.fungicide <- fungicide.tidy[which(fungicide.tidy$Experiment != "control" ),]
fungicide.tidy.control <- fungicide.tidy[which(fungicide.tidy$Experiment == "control" ),]
pdf("Disease.Severity.Fungicide.vs.Control.pdf", width = 12)
  par(mfrow = c(1,2), mar = c(5,5,5,5), lab = c(5,5,7))
  plot(fungicide.tidy.fungicide$Severity~fungicide.tidy.fungicide$Julian.Date, xlab = "Julian Date", ylab = "Disease Severity", main = "Fungicide",
       cex.lab = 1.5, cex.main = 2, col = "purple", pch = 25)
  plot(fungicide.tidy.control$Severity~fungicide.tidy.control$Julian.Date, xlab = "Julian Date", ylab = "Disease Severity", main = "Control",
       cex.lab = 1.5, cex.main = 2, col = "red", pch = 24)
dev.off()
# Show the other visual ways things can be plotted (e.g., dots, versus lines connecting the dots versus both versus horizontal lines)

# Change the symbols to lines
pdf("Disease.Severity.Fungicide.vs.Control.lines.pdf", width = 12)
  par(mfrow = c(1,2), mar = c(5,5,5,5), lab = c(5,5,7))
  plot(fungicide.tidy.fungicide$Severity~fungicide.tidy.fungicide$Julian.Date, xlab = "Julian Date", ylab = "Disease Severity", main = "Fungicide",
       cex.lab = 1.5, cex.main = 2, col = "purple", pch = 25, type = "l")
  plot(fungicide.tidy.control$Severity~fungicide.tidy.control$Julian.Date, xlab = "Julian Date", ylab = "Disease Severity", main = "Control",
       cex.lab = 1.5, cex.main = 2, col = "red", pch = 24, type = "l")
dev.off()

# Change the symbols to  points and lines
pdf("Disease.Severity.Fungicide.vs.Control.points.and.lines.pdf", width = 12)
  par(mfrow = c(1,2), mar = c(5,5,5,5), lab = c(5,5,7))
  plot(fungicide.tidy.fungicide$Severity~fungicide.tidy.fungicide$Julian.Date, xlab = "Julian Date", ylab = "Disease Severity", main = "Fungicide",
       cex.lab = 1.5, cex.main = 2, col = "purple", pch = 25, type = "b")
  plot(fungicide.tidy.control$Severity~fungicide.tidy.control$Julian.Date, xlab = "Julian Date", ylab = "Disease Severity", main = "Control",
       cex.lab = 1.5, cex.main = 2, col = "red", pch = 24, type = "b")
dev.off()

# Change the symbols so that they are "histogram-like"
pdf("Disease.Severity.Fungicide.vs.Control.histogram.like.pdf", width = 12)
  par(mfrow = c(1,2), mar = c(5,5,5,5), lab = c(5,5,7))
  plot(fungicide.tidy.fungicide$Severity~fungicide.tidy.fungicide$Julian.Date, xlab = "Julian Date", ylab = "Disease Severity", main = "Fungicide",
       cex.lab = 1.5, cex.main = 2, col = "purple", pch = 25, type = "h")
  plot(fungicide.tidy.control$Severity~fungicide.tidy.control$Julian.Date, xlab = "Julian Date", ylab = "Disease Severity", main = "Control",
       cex.lab = 1.5, cex.main = 2, col = "red", pch = 24, type = "h")
dev.off()







