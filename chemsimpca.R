# for Google Colab
phthalate_compounds <- read.csv("https://pubchem.ncbi.nlm.nih.gov/rest/pug/compound/name/phthalate/property/Title,Fingerprint2D,MonoisotopicMass,XLogP/CSV?name_type=word", header = T, stringsAsFactors = F)

if (!require(RCurl)) install.packages('RCurl')
library(RCurl)

hex <- c("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f")
bin <- c("0000", "0001", "0010", "0011", "0100", "0101", "0110", "0111", "1000", "1001", "1010", "1011", "1100", "1101", "1110", "1111")
subkeys <- phthalate_compounds$Fingerprint2D
m <- t(sapply(subkeys,function(x) { as.integer(strsplit(paste(sapply(strsplit(paste(base64Decode(x,"raw")[5:115],collapse=""),"")[[1]],function(x) {bin[which(hex==x)]}),collapse=""),"")[[1]][1:881] ) }))
mat <- m%*%t(m)
len <- length(m[,1])
s <- mat.or.vec(len,len)
for (i in 1:len) {
  for (j in 1:len){
    s[i,j] <- mat[i,j]/(mat[i,i]+mat[j,j]-mat[i,j])
  }
}
pca.res <- prcomp(s)
pca.res.sum <- summary(pca.res)
df1 <- cbind(phthalate_compounds, pca.res$x[,1:2])
write.csv(df1, "pca_res.csv", row.names = F, quote = T)
