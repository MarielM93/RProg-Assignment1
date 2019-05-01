complete <- function(directory, id = 1:332){
        ## reads directory and reports number of completely observed cases
        ## arguments:
        ## directory = location of CSV files
        ## id = id of monitors to be used
        ## returns a data frame where the first column is the name of the file and the second column is the number of complete cases
        
        ## read directory
        filelist <- list.files(directory, full.names = TRUE)
        
        ## create "collector" data frame
        colldata <- data.frame()
        
        ## loop through files in subset list and read csv
        for(i in id){
                data <- read.csv(filelist[i])
                complete <- complete.cases(data)
                completedata <- data[complete, ]
                countdata <- nrow(completedata)
                addrow <- c(i, countdata)
                colldata <- rbind(colldata, addrow)
        }
        colnames(colldata) <- c("id", "nobs")
        colldata
}