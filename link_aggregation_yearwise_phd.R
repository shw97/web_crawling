#install.packages("arules")
#install.packages("xml2")
#install.packages("rvest")
#install.packages("stringr")
#install.packages("XML")
library(XML)
library(xml2)
library(rvest)
library(stringr)
setwd('/Users/shwetha/Documents/R_scraping/')

#college_links<-read.csv('colleges_and_link.csv')
college_links<-read.csv('colleges_and_link_with_gradvalue_yes.csv')
college_links_2017<-read.csv('colleges_and_link_with_gradvalue_yes_2017.csv')
college_links_2016<-read.csv('colleges_and_link_with_gradvalue_yes_2016.csv')
link_enrollment<-c()
link_enrollment_2017<-c()
link_enrollment_2016<-c()
#link_enrollment<-college_links$new_list_crawl
#college_links<-cbind(college_links,link_enrollment)
#college_links$link_enrollment<-as.character(college_links$link_enrollment)
college_links$new_list_crawl<-as.character(college_links$new_list_crawl)
college_links_2017$new_list_crawl<-as.character(college_links_2017$new_list_crawl)
college_links_2016$new_list_crawl<-as.character(college_links_2016$new_list_crawl)

#View(college_links)
i<-2
for(i in 1:nrow(college_links)){
  print(i)
  url<-college_links$new_list_crawl[i];
  class(url)
  #url<-as.character(url)
  #url_node<-read_html(url);
  #table_node<-html_nodes(url_node,'li')
  #View(table_node)
  #table_node_formatted<-html_text(table_node)
  #View(table_node_formatted)
  url
  #url<-sub("1?","26?school_name",url)
  #url<-gsub("1?2","",url)
  #url<-rev(url)
  url<-paste(rev(substring(url,1:nchar(url),1:nchar(url))),collapse="") 
  url
  url<-str_replace(url,"1","72")
  url<-paste(rev(substring(url,1:nchar(url),1:nchar(url))),collapse="")
  print(url)
  #print("blha")
  #print(college_links[i,4])
  #print(college_links[i,4])
  #college_links[i,4]<-'url'
  #print("lol")
  #print(college_links[i,3])
  #print(college_links$link_enrollment[i])
  #View(college_links)
  link_enrollment<-append(link_enrollment,url)
  #View(link_enrollment)
}
#length(link_enrollment)
#View(college_links)
college_links<-cbind(college_links,link_enrollment)
#write.csv(college_links,'college_links_enrollmentlink.csv')
#View(college_links)
i<-1
for(i in 1:nrow(college_links_2017)){
  print(i)
  url<-college_links_2017$new_list_crawl[i];
  class(url)
  #url<-as.character(url)
  #url_node<-read_html(url);
  #table_node<-html_nodes(url_node,'li')
  #View(table_node)
  #table_node_formatted<-html_text(table_node)
  #View(table_node_formatted)
  url
  #url<-sub("1?","26?school_name",url)
  #url<-gsub("1?2","",url)
  #url<-rev(url)
  url<-paste(rev(substring(url,1:nchar(url),1:nchar(url))),collapse="") 
  url
  url<-str_replace(url,"1","72")
  url<-paste(rev(substring(url,1:nchar(url),1:nchar(url))),collapse="")
  print(url)
  #print("blha")
  #print(college_links[i,4])
  #print(college_links[i,4])
  #college_links[i,4]<-'url'
  #print("lol")
  #print(college_links[i,3])
  #print(college_links$link_enrollment[i])
  #View(college_links)
  link_enrollment_2017<-append(link_enrollment_2017,url)
  #View(link_enrollment)
}
#length(link_enrollment)
#View(college_links)
college_links_2017<-cbind(college_links_2017,link_enrollment_2017)
#write.csv(college_links,'college_links_enrollmentlink.csv')
#View(college_links)
i<-1
for(i in 1:nrow(college_links_2016)){
  print(i)
  url<-college_links_2016$new_list_crawl[i];
  class(url)
  #url<-as.character(url)
  #url_node<-read_html(url);
  #table_node<-html_nodes(url_node,'li')
  #View(table_node)
  #table_node_formatted<-html_text(table_node)
  #View(table_node_formatted)
  url
  #url<-sub("1?","26?school_name",url)
  #url<-gsub("1?2","",url)
  #url<-rev(url)
  url<-paste(rev(substring(url,1:nchar(url),1:nchar(url))),collapse="") 
  url
  url<-str_replace(url,"1","72")
  url<-paste(rev(substring(url,1:nchar(url),1:nchar(url))),collapse="")
  print(url)
  #print("blha")
  #print(college_links[i,4])
  #print(college_links[i,4])
  #college_links[i,4]<-'url'
  #print("lol")
  #print(college_links[i,3])
  #print(college_links$link_enrollment[i])
  #View(college_links)
  link_enrollment_2016<-append(link_enrollment_2016,url)
  #View(link_enrollment)
}
#length(link_enrollment)
#View(college_links)
college_links_2016<-cbind(college_links_2016,link_enrollment_2016)
#write.csv(college_links,'college_links_enrollmentlink.csv')
#View(college_links)
i<-1
for(i in 1:nrow(college_links)){
  url_enrollment<-college_links$link_enrollment[i]
  print(url_enrollment)
  url_enrollment
  college_name<-as.character(college_links$table_content_collegenames_readable[i])
  print(college_name)
  #college_name
  tryCatch({
    table_enrollment<-readHTMLTable(as.character(url_enrollment),which = 2)
    print("Working table")
    View(table_enrollment)
    header_row<-colnames(table_enrollment)
    colnames(table_enrollment)[1]=college_name
    header_row_first_row<-colnames(table_enrollment)
    header_row_first_row<-as.data.frame(t(header_row_first_row))
    #header_row_first_row
    colnames(header_row_first_row)<-colnames(table_enrollment)
    table_enrollment<-rbind(header_row_first_row,table_enrollment)
    colnames(table_enrollment)<-header_row
    for(j in 3:ncol(table_enrollment)){
      if((j)<=ncol(table_enrollment)){
        table_enrollment[,(j)]<-NULL
        j<-j+1;
      }
    }
    header1<-data.frame('Group','Nonresident Alien','Unkown','Hispanic','American Indian','Asian','Black','Pacific Islander','White','2 or more','Total')
    colnames(table_enrollment)<-colnames(header1)
    View(table_enrollment)
    table_enrollment_output<-data.frame(table_enrollment$X.Group.)
    View(table_enrollment_output_demo)
    table_enrollment_output_demo<-data.frame(table_enrollment$X.Total.)
    table_enrollment_output<-cbind(table_enrollment_output,table_enrollment_output_demo)
    ##############setwd('/Users/shwetha/Documents/R_scraping/enrollment/Desired_output_data/')
    #setwd('/Users/shwetha/Documents/R_scraping/enrollment/Level_1 data/')
    ##############write.csv(table_enrollment_output,file = paste(college_name,'_output.csv',sep = ''))
    ##############setwd('/Users/shwetha/Documents/R_scraping/enrollment/Level_1 data/')
    ##############write.csv(table_enrollment,file = paste(college_name,'_output.csv',sep = ''))
    #########
    men_coll<-c()
    women_coll<-c()
    original_coll<-c()
    #k<-4
    for(k in 1:nrow(table_enrollment_output)){
      table_enrollment_output$table_enrollment.X.Group.[k]
      table_enrollment_output$table_enrollment.X.Total.[k]
      if(table_enrollment_output$table_enrollment.X.Group.[k]=='Men'){
        men_coll_temp<-table_enrollment_output$table_enrollment.X.Total.[k];
        men_coll_temp<-as.character(men_coll_temp)
        #men_coll_temp
        #typeof(men_coll)
        men_coll<-append(men_coll,men_coll_temp)
      }
      if(table_enrollment_output$table_enrollment.X.Group.[k]=='Women'){
        women_coll_temp<-table_enrollment_output$table_enrollment.X.Total.[k];
        women_coll_temp<-as.character(women_coll_temp)
        women_coll<-append(women_coll,women_coll_temp);
        women_coll
      }
      if(table_enrollment_output$table_enrollment.X.Group.[k]!='Women' && table_enrollment_output$table_enrollment.X.Group.[k]!='Men'&&table_enrollment_output$table_enrollment.X.Group.[k]!=college_name && table_enrollment_output$table_enrollment.X.Group.[k]!='Totals:'){
        original_coll_temp<-table_enrollment_output$table_enrollment.X.Group.[k];
        original_coll_temp<-as.character(original_coll_temp)
        original_coll<-append(original_coll,original_coll_temp);
        
      }
    }
    #men_coll
    original_coll<-append(paste(college_name,"_2018"),original_coll)
    men_coll<-append("M",men_coll)
    women_coll<-append("F",women_coll)
    length(original_coll)
    original_coll
    length(men_coll)
    
    women_coll
    desired_data_take2<-c()
    desired_data_take2<-as.data.frame(desired_data_take2)
    desired_data_take2<-(original_coll)
    desired_data_take2<-cbind(desired_data_take2,men_coll)
    desired_data_take2<-cbind(desired_data_take2,women_coll)
    View(desired_data_take2)
    # setwd('/Users/shwetha/Documents/R_scraping/PHD/desired_output_collegepond_2018_phd/')
    # write.csv(desired_data_take2,file = paste(college_name,'_output.csv',sep = ''))
    # dir.create(file.path('/Users/shwetha/Documents/R_scraping/PHD/phd/2018', college_name), showWarnings = FALSE)
    # setwd(file.path('/Users/shwetha/Documents/R_scraping/PHD/phd/2018', college_name))
    # write.csv(desired_data_take2,file = paste(college_name,'_output_2018.csv',sep = ''))
    ####
    dir.create(file.path('/Users/shwetha/Documents/R_scraping/PHD/phd/', college_name), showWarnings = FALSE)
    setwd(file.path('/Users/shwetha/Documents/R_scraping/PHD/phd/', college_name))
    write.csv(desired_data_take2,file = paste(college_name,'_output_2018.csv',sep = ''))
    #getwd()
    #########
    rm(table_enrollment_output)
    rm(table_enrollment_output_demo)
    rm(desired_data_take2)
    table_enrollment<-c()
  },error =  function(e){
    print('Not a table');
  })
}
##2017
for(i in 1:nrow(college_links_2017)){
  url_enrollment<-college_links_2017$link_enrollment[i]
  url_enrollment
  college_name<-as.character(college_links_2017$table_content_collegenames_readable[i])
  tryCatch({
    table_enrollment<-readHTMLTable(as.character(url_enrollment),which = 2)
    header_row<-colnames(table_enrollment)
    colnames(table_enrollment)[1]=college_name
    header_row_first_row<-colnames(table_enrollment)
    header_row_first_row<-as.data.frame(t(header_row_first_row))
    colnames(header_row_first_row)<-colnames(table_enrollment)
    table_enrollment<-rbind(header_row_first_row,table_enrollment)
    colnames(table_enrollment)<-header_row
    for(j in 3:ncol(table_enrollment)){
      if((j)<=ncol(table_enrollment)){
        table_enrollment[,(j)]<-NULL
        j<-j+1;
      }
    }
    header1<-data.frame('Group','Nonresident Alien','Unkown','Hispanic','American Indian','Asian','Black','Pacific Islander','White','2 or more','Total')
    colnames(table_enrollment)<-colnames(header1)
    View(table_enrollment)
    table_enrollment_output<-data.frame(table_enrollment$X.Group.)
    View(table_enrollment_output_demo)
    table_enrollment_output_demo<-data.frame(table_enrollment$X.Total.)
    table_enrollment_output<-cbind(table_enrollment_output,table_enrollment_output_demo)
    ##############setwd('/Users/shwetha/Documents/R_scraping/enrollment/Desired_output_data/')
    #setwd('/Users/shwetha/Documents/R_scraping/enrollment/Level_1 data/')
    ##############write.csv(table_enrollment_output,file = paste(college_name,'_output.csv',sep = ''))
    ##############setwd('/Users/shwetha/Documents/R_scraping/enrollment/Level_1 data/')
    ##############write.csv(table_enrollment,file = paste(college_name,'_output.csv',sep = ''))
    #########
    men_coll<-c()
    women_coll<-c()
    original_coll<-c()
    #k<-4
    for(k in 1:nrow(table_enrollment_output)){
      table_enrollment_output$table_enrollment.X.Group.[k]
      table_enrollment_output$table_enrollment.X.Total.[k]
      if(table_enrollment_output$table_enrollment.X.Group.[k]=='Men'){
        men_coll_temp<-table_enrollment_output$table_enrollment.X.Total.[k];
        men_coll_temp<-as.character(men_coll_temp)
        #men_coll_temp
        #typeof(men_coll)
        men_coll<-append(men_coll,men_coll_temp)
      }
      if(table_enrollment_output$table_enrollment.X.Group.[k]=='Women'){
        women_coll_temp<-table_enrollment_output$table_enrollment.X.Total.[k];
        women_coll_temp<-as.character(women_coll_temp)
        women_coll<-append(women_coll,women_coll_temp);
        women_coll
      }
      if(table_enrollment_output$table_enrollment.X.Group.[k]!='Women' && table_enrollment_output$table_enrollment.X.Group.[k]!='Men'&&table_enrollment_output$table_enrollment.X.Group.[k]!=college_name && table_enrollment_output$table_enrollment.X.Group.[k]!='Totals:'){
        original_coll_temp<-table_enrollment_output$table_enrollment.X.Group.[k];
        original_coll_temp<-as.character(original_coll_temp)
        original_coll<-append(original_coll,original_coll_temp);
        
      }
    }
    #men_coll
    original_coll<-append(paste(college_name,"_2017"),original_coll)
    men_coll<-append("M",men_coll)
    women_coll<-append("F",women_coll)
    length(original_coll)
    original_coll
    length(men_coll)
    
    women_coll
    desired_data_take2<-c()
    desired_data_take2<-as.data.frame(desired_data_take2)
    desired_data_take2<-(original_coll)
    desired_data_take2<-cbind(desired_data_take2,men_coll)
    desired_data_take2<-cbind(desired_data_take2,women_coll)
    View(desired_data_take2)
   #### setwd('/Users/shwetha/Documents/R_scraping/PHD/desired_output_collegepond_2017_phd/')
    #write.csv(desired_data_take2,file = paste(college_name,'_output.csv',sep = ''))
    #dir.create(file.path('/Users/shwetha/Documents/R_scraping/PHD/phd/2017', college_name), showWarnings = FALSE)
    #setwd(file.path('/Users/shwetha/Documents/R_scraping/PHD/phd/2017', college_name))
  ####  write.csv(desired_data_take2,file = paste(college_name,'_output_2017.csv',sep = ''))
    ####
    dir.create(file.path('/Users/shwetha/Documents/R_scraping/PHD/phd/', college_name), showWarnings = FALSE)
    setwd(file.path('/Users/shwetha/Documents/R_scraping/PHD/phd/', college_name))
    write.csv(desired_data_take2,file = paste(college_name,'_output_2017.csv',sep = ''))
    #getwd()
    #########
    rm(table_enrollment_output)
    rm(table_enrollment_output_demo)
    rm(desired_data_take2)
    table_enrollment<-c()
  },error =  function(e){
    print('Not a table');
  })
}
##2016
i<-1
for(i in 1:nrow(college_links_2016)){
  url_enrollment<-college_links_2016$link_enrollment[i]
  url_enrollment
  college_name<-as.character(college_links_2016$table_content_collegenames_readable[i])
  tryCatch({
    table_enrollment<-readHTMLTable(as.character(url_enrollment),which = 2)
    header_row<-colnames(table_enrollment)
    colnames(table_enrollment)[1]=college_name
    header_row_first_row<-colnames(table_enrollment)
    header_row_first_row<-as.data.frame(t(header_row_first_row))
    colnames(header_row_first_row)<-colnames(table_enrollment)
    table_enrollment<-rbind(header_row_first_row,table_enrollment)
    colnames(table_enrollment)<-header_row
    for(j in 3:ncol(table_enrollment)){
      if((j)<=ncol(table_enrollment)){
        table_enrollment[,(j)]<-NULL
        j<-j+1;
      }
    }
    header1<-data.frame('Group','Nonresident Alien','Unkown','Hispanic','American Indian','Asian','Black','Pacific Islander','White','2 or more','Total')
    colnames(table_enrollment)<-colnames(header1)
    View(table_enrollment)
    table_enrollment_output<-data.frame(table_enrollment$X.Group.)
    View(table_enrollment_output_demo)
    table_enrollment_output_demo<-data.frame(table_enrollment$X.Total.)
    table_enrollment_output<-cbind(table_enrollment_output,table_enrollment_output_demo)
    ##############setwd('/Users/shwetha/Documents/R_scraping/enrollment/Desired_output_data/')
    #setwd('/Users/shwetha/Documents/R_scraping/enrollment/Level_1 data/')
    ##############write.csv(table_enrollment_output,file = paste(college_name,'_output.csv',sep = ''))
    ##############setwd('/Users/shwetha/Documents/R_scraping/enrollment/Level_1 data/')
    ##############write.csv(table_enrollment,file = paste(college_name,'_output.csv',sep = ''))
    #########
    men_coll<-c()
    women_coll<-c()
    original_coll<-c()
    #k<-4
    for(k in 1:nrow(table_enrollment_output)){
      table_enrollment_output$table_enrollment.X.Group.[k]
      table_enrollment_output$table_enrollment.X.Total.[k]
      if(table_enrollment_output$table_enrollment.X.Group.[k]=='Men'){
        men_coll_temp<-table_enrollment_output$table_enrollment.X.Total.[k];
        men_coll_temp<-as.character(men_coll_temp)
        #men_coll_temp
        #typeof(men_coll)
        men_coll<-append(men_coll,men_coll_temp)
      }
      if(table_enrollment_output$table_enrollment.X.Group.[k]=='Women'){
        women_coll_temp<-table_enrollment_output$table_enrollment.X.Total.[k];
        women_coll_temp<-as.character(women_coll_temp)
        women_coll<-append(women_coll,women_coll_temp);
        women_coll
      }
      if(table_enrollment_output$table_enrollment.X.Group.[k]!='Women' && table_enrollment_output$table_enrollment.X.Group.[k]!='Men'&&table_enrollment_output$table_enrollment.X.Group.[k]!=college_name && table_enrollment_output$table_enrollment.X.Group.[k]!='Totals:'){
        original_coll_temp<-table_enrollment_output$table_enrollment.X.Group.[k];
        original_coll_temp<-as.character(original_coll_temp)
        original_coll<-append(original_coll,original_coll_temp);
        
      }
    }
    #men_coll
    original_coll<-append(paste(college_name,"_2016"),original_coll)
    men_coll<-append("M",men_coll)
    women_coll<-append("F",women_coll)
    length(original_coll)
    original_coll
    length(men_coll)
    
    women_coll
    desired_data_take2<-c()
    desired_data_take2<-as.data.frame(desired_data_take2)
    desired_data_take2<-(original_coll)
    desired_data_take2<-cbind(desired_data_take2,men_coll)
    desired_data_take2<-cbind(desired_data_take2,women_coll)
    View(desired_data_take2)
    ###setwd('/Users/shwetha/Documents/R_scraping/PHD/desired_output_collegepond_2016_phd/')
    #write.csv(desired_data_take2,file = paste(college_name,'_output.csv',sep = ''))
    #dir.create(file.path('/Users/shwetha/Documents/R_scraping/PHD/phd/2016', college_name), showWarnings = FALSE)
    #setwd(file.path('/Users/shwetha/Documents/R_scraping/PHD/phd/2016', college_name))
    ###write.csv(desired_data_take2,file = paste(college_name,'_output_2016.csv',sep = ''))
    ####
    dir.create(file.path('/Users/shwetha/Documents/R_scraping/PHD/phd/', college_name), showWarnings = FALSE)
    setwd(file.path('/Users/shwetha/Documents/R_scraping/PHD/phd/', college_name))
    write.csv(desired_data_take2,file = paste(college_name,'_output_2016.csv',sep = ''))
    #getwd()
    #########
    rm(table_enrollment_output)
    rm(table_enrollment_output_demo)
    rm(desired_data_take2)
    table_enrollment<-c()
  },error =  function(e){
    print('Not a table');
  })
}
setwd('/Users/shwetha/Documents/R_scraping/')