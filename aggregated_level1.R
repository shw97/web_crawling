#("arules")
install.packages("xml2")
install.packages("rvest")
install.packages("stringr")
install.packages("XML")
library(XML)
library(xml2)
library(rvest)
library(stringr)
setwd('/Users/shwetha/Documents/R_scraping/enrollment/Desired_output_data/')
file_count<-system('ls -1 | wc -l')
# for(i in 1:file_count){
#   college_file<-read.csv('')
#   aggregated_data<-rbind(aggregated_data,)
# }
#file_count
files_unmerged<-list.files(pattern = "*.csv")
files_unmerged_total = lapply(files_unmerged, read.delim)
files_merged <- do.call("rbind", files_unmerged_total)
View(files_merged)

file_list <- list.files()
file_list
rm(dataset)
for (file in file_list){
  
  #print(file)
  #print("Demo")
  # if the merged dataset doesn't exist, create it
  if (!exists("dataset")){
     dataset <- read.csv(file)
  }
  # 
  # if the merged dataset does exist, append to it
  if (exists("dataset")){
     temp_dataset <-read.csv(file)
     if(ncol(dataset)==ncol(temp_dataset)){
     dataset<-rbind(dataset, temp_dataset)
     print(file)
     }
     rm(temp_dataset)
   }
  # 
}
View(dataset)
#dataset<-read.csv('Air Force Institute of Technology.csv')
#dataset_new<-read.csv('University of Alabama at Birmingham.csv')
#dataset<-rbind(dataset,dataset_new)
setwd('/Users/shwetha/Documents/R_scraping/enrollment/aggregated_desired_output/')
write.csv(dataset,file = 'aggregated_2018_enrollment_data_desired_output.csv')
