# normal-fonts.r - Draw the letters as contours of bivariate normal density

library("mvtnorm")

greys <- colorRampPalette(c("grey0", "grey100"))
greys <- greys(50)

vulcano <- c("#405DE6", "#5851DB", "#833AB4", "#C13584", 
  "#E1306C", "#FD1D1D", "#F56040", "#F77737", "#FCAF45",
  "#FFDC80")

#' Saves pictures of all the characters
save <- function(letter, d, s1, a, b, n,
  N=500, s2=10, lwd=5, drawlabels=TRUE) {
    x <- seq(a, b, length = N)
    levs <- pretty(d, n=n)
    levs <- levs[s1:length(levs)]
    fname <- paste("vulcano/", letter, ".png", sep="")
    png(file=fname, width=2000, height=2000)
    contour(x, x, d,
            levels=levs[-c(s2, length(levs))],
            col = muscles,
            lwd = lwd,
            lty = 1,
            drawlabels = drawlabels,
            labcex=1,
            bty = "n",
            xaxt = "n",
            yaxt = "n")
    dev.off()
}

letters <- 1:26 # the English alphabet consists of 26 letters:
names(letters) <- c("A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L",
  "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z")

paramsList <- readRDS(file = "paramsList.rds") # letter, d - matrix, s1, a, b, n
for (i in letters) {
    params <- paramsList[[i]]
    save(params$letter, params$d, params$s1, params$a, params$b, params$n)
}
