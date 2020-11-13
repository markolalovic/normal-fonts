# normal-fonts.r - Draw the letters as contours of bivariate normal density

library("mvtnorm")

#' Saves pictures of all the characters
save <- function(letter, d, lwd=10) {
    x <- seq(-5, 5, length = 500)
    fname <- paste("glyphs/", letter, ".png", sep="")
    png(file=fname, width=2000, height=2000)
    contour(x, x, d, 10,
            col = c("#111111", "#333333", "#555555", "#777777"),
            lwd = lwd,
            lty = 1,
            drawlabels = FALSE,
            bty = "n",
            xaxt = "n",
            yaxt = "n")
    dev.off()
}

letters <- 1:26 # the English alphabet consists of 26 letters:
names(letters) <- c("A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L",
  "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z")

paramsList <- readRDS(file = "paramsList.rds") # letter, d - matrix
for (i in letters) {
    params <- paramsList[[i]]
    save(params$letter, params$d)
}
