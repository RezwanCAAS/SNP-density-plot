

library(CMplot)
library(tidyverse)
library(data.table)

#upload .map file
map1 <- fread("`/path/genotyped_hapmap.map", header = F)

head(map1)

#add labels to the header
mm <- map1 %>%
  dplyr::select(SNP = 2, Chromosome = 1, Position = 4)
head(mm)

#run the plot for visualization
CMplot(mm, plot.type = "d", bin.size = 1e6, col = c("darkgreen", "yellow", "red"),
       file = "jpg", dpi = 300, file.output = TRUE, verbose = TRUE)


