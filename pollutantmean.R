pollutantmean <- function(directory, pollutant, id = 1:332){
        ## calculates mean of pollutant across a list of monitors
        ## arguments:
        ## directory = location of csv files
        ## pollutant = name of pollutant to calculate mean on
        ## id = id of monitors to be used
        ## returns the mean of the pollutant across all of the monitors, ignoring any missing values coded as NA
        
        ## obtain list of all sensor files within directory
        filelist <- list.files(directory, full.names = TRUE)
        
        ## create "collector" data frame
        colldata <- data.frame()
        
        ##subset list of sensor files
        speclist <- filelist[id]
        
        ## loop through files in subset list and read csv
        for(file in speclist){
                data <- read.csv(file)
                colldata <- rbind(colldata, data)
        }
        
        ## calculate mean and return to parent env
        mean(colldata[, pollutant], na.rm = TRUE)
}
