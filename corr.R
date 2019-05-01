corr <- function(directory, threshold = 0){
        ## takes directory of data files and a threshold for complete cases
        ## calculate correlation between pollutants for monitor locations with complete cases
        ## arguments:
        ## directory = location of csv files
        ## threshold = number of complete observations required to compute corr
        ## returns a vector of correlations for the monitors that meet the threshold requirement
        
        ## read directory
        filelist <- list.files(directory, full.names = TRUE)

        ## create collector vector
        corrthreshold <- vector()
        
        ## use complete() to list out number of complete cases
        listcomplete <- complete(directory, id = 1:332)
        
        ## test each file if they meet threshold
        thresholdcheck <- listcomplete["nobs"] >= threshold
        meetthreshold <- listcomplete[thresholdcheck, ]
        meetsens <- c(meetthreshold[["id"]])
        meetdata <- filelist[meetsens]
        
        for(file in meetdata){
                data <- read.csv(file)
                complete <- complete.cases(data)
                completedata <- data[complete, ]
                correlate <- cor(completedata$sulfate, completedata$nitrate)
                corrthreshold <- c(corrthreshold, correlate)
                
        }

        corrthreshold
}