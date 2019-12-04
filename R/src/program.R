#!/usr/bin/env Rscript
install.packages("optparse")
library("optparse")

option_list = list(
  make_option(c("-f", "--file"), type="character", default=NULL,
              help="dataset file name", metavar="character"),
  make_option(c("-g", "--formula"), type="character", default=NULL,
              help="formula to pass to lm", metavar="character"),
  make_option(c("-o", "--out"), type="character", default="out.txt",
              help="file to save the model to", metavar="character")
);

opt_parser = OptionParser(option_list=option_list);
opt = parse_args(opt_parser);

print(opt$file)
data <- read.csv(opt$file)
model <- lm(opt$formula, data)
model.saveRDS(opt$out)