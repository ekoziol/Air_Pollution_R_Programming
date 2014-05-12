complete <- function(directory, id = 1:332){
    if (!file.exists(directory)){  
      return("Error: Directory does not exist!")
    }
    
    fileList <- paste(directory, "/", list.files(directory), sep="")

    x <- 0
    totalFrame <- data.frame()
    
    #print(totalFrame)
    for(i in id){
      tempFrame <- read.csv(fileList[i])
      completeCases <-  sum(complete.cases(tempFrame))
      totalFrame <- rbind(totalFrame,c(i, completeCases))
    }
    names(totalFrame) <- c("id", "nobs")
    return(totalFrame)
  }
