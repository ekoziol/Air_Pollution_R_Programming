pollutantmean <- function(directory, pollutant, id = 1:332){
  if (!file.exists(directory)){  
    return("Error: Directory does not exist!")
  }
  
  fileList <- paste(directory, "/", list.files(directory), sep="")
  fileList <- fileList[id]
  valueList <- c()
  for(f in fileList){
    #print(f)
    tempFrame <- read.csv(f)
    #print(head(tempFrame,10))
    #print(tempFrame[pollutant])
    valueList <- append(valueList, tempFrame[!is.na(tempFrame[pollutant]), pollutant])
  }
  #print(valueList)
  return(mean(valueList))
}