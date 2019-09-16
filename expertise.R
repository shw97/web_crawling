library(xml2)
library(rvest)
library(stringr)

setwd('/Users/shwetha/Documents/R_scraping/')
# url<-'http://profiles.asee.org/profiles/7915/screen/10'
# demo_web<-read_html(url)
# table_content<-html_nodes(demo_web,'.text')
# table_content
# #table_content_td<-html_nodes(table_content,'tr')
# table_content_text_tr<-html_text(table_content,'tr')
# print(table_content_text_tr)
# write_html(table_content,file = 'textfile.html')

college_links<-read.csv('colleges_and_link_with_gradvalue_yes.csv')
#View(college_links)
links<-college_links$new_list_crawl
college_name<-college_links$table_content_collegenames_readable
length(links)
setwd('/Users/shwetha/Documents/R_scraping/Area of expertise/')

for(i in 1:length(links)){
  url<-links[i];
  url<-as.character(url);
  url<-paste(rev(substring(url,1:nchar(url),1:nchar(url))),collapse="") 
  #url
  url<-str_replace(url,"1","01")
  url<-paste(rev(substring(url,1:nchar(url),1:nchar(url))),collapse="")
  #print(url)
  tryCatch({
  demo_web<-read_html(url)
  table_content<-html_nodes(demo_web,'.text')
  #filename<-paste(college_name,'_expertise.csv',sep = '')
  filename<-paste(college_name[i],'_specialization.html')
  #filename
  write_html(table_content,file = filename)}
  ,error =  function(e){
    print('Not a table');
  })
}
# textfile_table1<-readHTMLTable('textfile.html')
# View(textfile_table1)
# View(table_content_text_tr)
# 
# install.packages("rmarkdown")
# library(rmarkdown)
# pandoc_convert("textfile.html", to = "pdf" , output = "textfile.pdf")
# system("sudo apt-get install wkhtmltopdf")
# system("wkhtmltopdf textfile.html textfile.pdf")
# 
# txt<-read_html("textfile.html")
# 
# doc = htmlParse(txt, asText=TRUE)
# plain.text <- xpathSApply(doc, "//p", xmlValue)
# plain.text
# cat(paste(plain.text, collapse = "\n"))
# 
# table_content_td
# table_ol<-html_nodes(table_content_td,'li')
# table_ol
# url1<-"textfile.html"
# specialisation<-readHTMLTable(as.character(url1),which = 1)
# View(specialisation)
# specialisation
# write
