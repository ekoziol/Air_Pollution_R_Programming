corr <- function(directory, threshold=0){
  if (!file.exists(directory)){  
    return("Error: Directory does not exist!")
  }
  
  fileList <- paste(directory, "/", list.files(directory), sep="")
  correlations <- c()
  for(f in fileList){
    tempFrame <- read.csv(f)
    completeCases <-  complete.cases(tempFrame)
    #print(completeCases)
    numberOfCases <- sum(completeCases)
    #print(tempFrame[completeCases,"nitrate"])
    if(numberOfCases > threshold){
      t <- tempFrame[completeCases,]
      correlations <- append(correlations, cor(t$sulfate, t$nitrate))
    }
  }
  return(correlations)
}