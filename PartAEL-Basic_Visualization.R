# Read in "fungicide.tidy"
fungicide.tidy <- read.csv("data/FungicideTidy.csv", head = TRUE)

# Make a simple X-Y graph
plot(fungicide.tidy$Severity ~ fungicide.tidy$Julian.Date)


# Label the X- and Y- Axes
plot(fungicide.tidy$Severity ~ fungicide.tidy$Julian.Date, xlab = "Julian Date", ylab = "Disease Severity", main = "Disease Severity", 
     cex.lab = 1.5, cex.main = 2)

# Make a simple X-Y graph, where the symbols differ for "control" and "fungicide"
color.vector <- rep("purple", nrow(fungicide.tidy))
color.vector[which(fungicide.tidy$Experiment == "control" )] <- "red"

symbol.vector <- rep(25, nrow(fungicide.tidy))
symbol.vector[which(fungicide.tidy$Experiment == "control" )] <- 24

plot(fungicide.tidy$Severity ~ fungicide.tidy$Julian.Date, xlab = "Julian Date", ylab = "Disease Severity", main = "Disease Severity", 
     cex.lab = 1.5, cex.main = 2, col = color.vector, pch = symbol.vector)

legend("topleft", col = c("purple", "red"), pch = c(25, 24), legend = c("Fungicide", "Control"))


# Making three plots, one for each cultivar
# -----------------------------------------

# Create three separate data sets; one for each cultivar
fungicide.tidy.TwentyOneThirtySevenWheat <- fungicide.tidy[which(fungicide.tidy$Cultivar == "TwentyOneThirtySevenWheat" ), ]
fungicide.tidy.CutterWheat <- fungicide.tidy[which(fungicide.tidy$Cultivar == "CutterWheat"), ]
fungicide.tidy.JaggerWheat <- fungicide.tidy[which(fungicide.tidy$Cultivar == "JaggerWheat"), ]

# Create a vector for the dates
jdate <- fungicide.tidy.TwentyOneThirtySevenWheat[which(fungicide.tidy.TwentyOneThirtySevenWheat$Experiment == "fungicide"), "Julian.Date"]

# Create vectors for each treatement and cultvar
TwentyOneThirtySevenWheat.fungicide <- fungicide.tidy.TwentyOneThirtySevenWheat[which(fungicide.tidy.TwentyOneThirtySevenWheat$Experiment == "fungicide"), "Severity"]
TwentyOneThirtySevenWheat.control <- fungicide.tidy.TwentyOneThirtySevenWheat[which(fungicide.tidy.TwentyOneThirtySevenWheat$Experiment == "control"), "Severity"]
CutterWheat.fungicide <- fungicide.tidy.CutterWheat[which(fungicide.tidy.CutterWheat$Experiment == "fungicide"), "Severity"]
CutterWheat.control <- fungicide.tidy.CutterWheat[which(fungicide.tidy.CutterWheat$Experiment == "control"), "Severity"]
JaggerWheat.fungicide <- fungicide.tidy.JaggerWheat[which(fungicide.tidy.JaggerWheat$Experiment == "fungicide"), "Severity"]
JaggerWheat.control <- fungicide.tidy.JaggerWheat[which(fungicide.tidy.JaggerWheat$Experiment == "control"), "Severity"]

par(mfrow = c(3, 1),
    mar = c(2, 2, 2, 2),
    lab = c(5, 5, 7))

plot(
  TwentyOneThirtySevenWheat.fungicide ~ jdate,
  xlab = "Julian Date",
  ylab = "Disease Severity",
  main = "TwentyOneThirtySevenWheat",
  cex.lab = 1.5,
  cex.main = 2,
  col = "purple",
  pch = 25,
  ylim = c(0, 50)
)

points(
  TwentyOneThirtySevenWheat.control ~ jdate,
  xlab = "Julian Date",
  ylab = "Disease Severity",
  main = "Control",
  cex.lab = 1.5,
  cex.main = 2,
  col = "red",
  pch = 24,
  ylim = c(0, 50)
)
legend(
  "topleft",
  col = c("purple", "red"),
  pch = c(25, 24),
  legend = c("Fungicide", "Control")
)


plot(
  CutterWheat.fungicide ~ jdate,
  xlab = "Julian Date",
  ylab = "Disease Severity",
  main = "CutterWheat",
  cex.lab = 1.5,
  cex.main = 2,
  col = "purple",
  pch = 25,
  ylim = c(0, 50)
)
points(
  CutterWheat.control ~ jdate,
  xlab = "Julian Date",
  ylab = "Disease Severity",
  main = "Control",
  cex.lab = 1.5,
  cex.main = 2,
  col = "red",
  pch = 24,
  ylim = c(0, 50)
)
legend(
  "topleft",
  col = c("purple", "red"),
  pch = c(25, 24),
  legend = c("Fungicide", "Control")
)



plot(
  JaggerWheat.fungicide ~ jdate,
  xlab = "Julian Date",
  ylab = "Disease Severity",
  main = "JaggerWheat",
  cex.lab = 1.5,
  cex.main = 2,
  col = "purple",
  pch = 25,
  ylim = c(0, 50)
)
points(
  JaggerWheat.control ~ jdate,
  xlab = "Julian Date",
  ylab = "Disease Severity",
  main = "Control",
  cex.lab = 1.5,
  cex.main = 2,
  col = "red",
  pch = 24,
  ylim = c(0, 50)
)
legend(
  "topleft",
  col = c("purple", "red"),
  pch = c(25, 24),
  legend = c("Fungicide", "Control")
)




# Change the symbols so that they are "histogram-like"
# ----------------------------------------------------


par(mfrow = c(3, 1),
    mar = c(2, 2, 2, 2),
    lab = c(5, 5, 7))


plot(
  TwentyOneThirtySevenWheat.fungicide ~ jdate,
  xlab = "Julian Date",
  ylab = "Disease Severity",
  main = "TwentyOneThirtySevenWheat",
  cex.lab = 1.5,
  cex.main = 2,
  col = "purple",
  pch = 25,
  ylim = c(0, 50),
  type = "h"
)
lines(
  TwentyOneThirtySevenWheat.control ~ jdate,
  xlab = "Julian Date",
  ylab = "Disease Severity",
  main = "Control",
  cex.lab = 1.5,
  cex.main = 2,
  col = "red",
  pch = 24,
  ylim = c(0, 50),
  type = "h"
)
legend(
  "topleft",
  col = c("purple", "red"),
  pch = c(25, 24),
  legend = c("Fungicide", "Control")
)


plot(
  CutterWheat.fungicide ~ jdate,
  xlab = "Julian Date",
  ylab = "Disease Severity",
  main = "CutterWheat",
  cex.lab = 1.5,
  cex.main = 2,
  col = "purple",
  pch = 25,
  ylim = c(0, 50),
  type = "h"
)
lines(
  CutterWheat.control ~ jdate,
  xlab = "Julian Date",
  ylab = "Disease Severity",
  main = "Control",
  cex.lab = 1.5,
  cex.main = 2,
  col = "red",
  pch = 24,
  ylim = c(0, 50),
  type = "h"
)
legend(
  "topleft",
  col = c("purple", "red"),
  pch = c(25, 24),
  legend = c("Fungicide", "Control")
)



plot(
  JaggerWheat.fungicide ~ jdate,
  xlab = "Julian Date",
  ylab = "Disease Severity",
  main = "JaggerWheat",
  cex.lab = 1.5,
  cex.main = 2,
  col = "purple",
  pch = 25,
  ylim = c(0, 50),
  type = "h"
)
lines(
  JaggerWheat.control ~ jdate,
  xlab = "Julian Date",
  ylab = "Disease Severity",
  main = "Control",
  cex.lab = 1.5,
  cex.main = 2,
  col = "red",
  pch = 24,
  ylim = c(0, 50),
  type = "h"
)
legend(
  "topleft",
  col = c("purple", "red"),
  pch = c(25, 24),
  legend = c("Fungicide", "Control")
)



# Change the symbols to lines
par(mfrow = c(3, 1),
    mar = c(2, 2, 2, 2),
    lab = c(5, 5, 7))

plot(
  TwentyOneThirtySevenWheat.fungicide ~ jdate,
  xlab = "Julian Date",
  ylab = "Disease Severity",
  main = "TwentyOneThirtySevenWheat",
  cex.lab = 1.5,
  cex.main = 2,
  col = "purple",
  pch = 25,
  ylim = c(0, 50),
  type = "l"
)
lines(
  TwentyOneThirtySevenWheat.control ~ jdate,
  xlab = "Julian Date",
  ylab = "Disease Severity",
  main = "Control",
  cex.lab = 1.5,
  cex.main = 2,
  col = "red",
  pch = 24,
  ylim = c(0, 50),
  type = "l"
)
legend(
  "topleft",
  col = c("purple", "red"),
  pch = c(25, 24),
  legend = c("Fungicide", "Control")
)


plot(
  CutterWheat.fungicide ~ jdate,
  xlab = "Julian Date",
  ylab = "Disease Severity",
  main = "CutterWheat",
  cex.lab = 1.5,
  cex.main = 2,
  col = "purple",
  pch = 25,
  ylim = c(0, 50),
  type = "l"
)
lines(
  CutterWheat.control ~ jdate,
  xlab = "Julian Date",
  ylab = "Disease Severity",
  main = "Control",
  cex.lab = 1.5,
  cex.main = 2,
  col = "red",
  pch = 24,
  ylim = c(0, 50),
  type = "l"
)
legend(
  "topleft",
  col = c("purple", "red"),
  pch = c(25, 24),
  legend = c("Fungicide", "Control")
)



plot(
  JaggerWheat.fungicide ~ jdate,
  xlab = "Julian Date",
  ylab = "Disease Severity",
  main = "JaggerWheat",
  cex.lab = 1.5,
  cex.main = 2,
  col = "purple",
  pch = 25,
  ylim = c(0, 50),
  type = "l"
)
lines(
  JaggerWheat.control ~ jdate,
  xlab = "Julian Date",
  ylab = "Disease Severity",
  main = "Control",
  cex.lab = 1.5,
  cex.main = 2,
  col = "red",
  pch = 24,
  ylim = c(0, 50),
  type = "l"
)
legend(
  "topleft",
  col = c("purple", "red"),
  pch = c(25, 24),
  legend = c("Fungicide", "Control")
)




# Change the symbols to points and lines
pdf("results/Disease.Severity.Fungicide.vs.Control.pdf", width = 8)
par(mfrow = c(3, 1),
    mar = c(5, 5, 5, 5),
    lab = c(5, 5, 7))

plot(
  TwentyOneThirtySevenWheat.fungicide ~ jdate,
  xlab = "Julian Date",
  ylab = "Disease Severity",
  main = "TwentyOneThirtySevenWheat",
  cex.lab = 1.5,
  cex.main = 2,
  col = "purple",
  pch = 25,
  ylim = c(0, 50),
  type = "b"
)
lines(
  TwentyOneThirtySevenWheat.control ~ jdate,
  xlab = "Julian Date",
  ylab = "Disease Severity",
  main = "Control",
  cex.lab = 1.5,
  cex.main = 2,
  col = "red",
  pch = 24,
  ylim = c(0, 50),
  type = "b"
)
legend(
  "topleft",
  col = c("purple", "red"),
  pch = c(25, 24),
  legend = c("Fungicide", "Control")
)


plot(
  CutterWheat.fungicide ~ jdate,
  xlab = "Julian Date",
  ylab = "Disease Severity",
  main = "CutterWheat",
  cex.lab = 1.5,
  cex.main = 2,
  col = "purple",
  pch = 25,
  ylim = c(0, 50),
  type = "b"
)
lines(
  CutterWheat.control ~ jdate,
  xlab = "Julian Date",
  ylab = "Disease Severity",
  main = "Control",
  cex.lab = 1.5,
  cex.main = 2,
  col = "red",
  pch = 24,
  ylim = c(0, 50),
  type = "b"
)
legend(
  "topleft",
  col = c("purple", "red"),
  pch = c(25, 24),
  legend = c("Fungicide", "Control")
)



plot(
  JaggerWheat.fungicide ~ jdate,
  xlab = "Julian Date",
  ylab = "Disease Severity",
  main = "JaggerWheat",
  cex.lab = 1.5,
  cex.main = 2,
  col = "purple",
  pch = 25,
  ylim = c(0, 50),
  type = "b"
)
lines(
  JaggerWheat.control ~ jdate,
  xlab = "Julian Date",
  ylab = "Disease Severity",
  main = "Control",
  cex.lab = 1.5,
  cex.main = 2,
  col = "red",
  pch = 24,
  ylim = c(0, 50),
  type = "b"
)
legend(
  "topleft",
  col = c("purple", "red"),
  pch = c(25, 24),
  legend = c("Fungicide", "Control")
)

dev.off()

# Reset par at the end so that none of the bells and whistles specified in previous graphs are carried foward to the next graph
par()
