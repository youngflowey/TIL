2019-10-30

install.packages("rvest")
library(rvest)
library(stringr)
install.packages("Rcrawler")
library(Rcrawler)
#########selector#############

url <- "https://www.rottentomatoes.com/top/bestofrt/"
# 프로그램에 대한 url
year <- "year="

request_url <- str_c(url,"?",year,2019)
request_url
html_page = read_html(request_url)
html_page
# html 통으로 들고 온것


nodes = html_nodes(html_page,"tr > td > a.unstyled.articleLink")
title <-html_text(nodes, trim = TRUE)
title
link <- html_attr(nodes, name = 'href')
link
url1 <- str_c("https://www.rottentomatoes.com", link)
url1
html_page1 = read_html(url1)

nodes2 = html_nodes(html_page1,"li:nth-child(2) > div.meta-value")
nodes2 = html_nodes(html_page1,"a")

nodes2




#############xpath################


url <- "https://www.rottentomatoes.com/top/bestofrt/?year=2019"
html_page = read_html(url)

nodes1 = html_nodes(html_page,
  xpath = '//*[@id="top_movies_main"]/div/table/tr[1]/td[3]/a' )
link <- html_attr(nodes1, name = 'href')
title <- html_text(nodes1, trim = TRUE)
link
title



url2 <- str_c("https://www.rottentomatoes.com", link)
url2
html_page1 = read_html(url2)
nodes2 = html_nodes(html_page1,
                    xpath = '//*[@id="topSection"]/div[2]/div[1]/section/section/div[2]/div/strong' )
ratings <- html_text(nodes2)
ratings
ratings_c=strsplit(ratings,":")
ratings_c1=unlist(ratings_c)
ratings_c1[2]
ratings_c2=ratings_c1[2]
ratings2=sub(",","",ratings_c2)
ratings_c2
ratings_c3=strsplit(ratings_c2,",")
ra1=unlist(ratings_c3)
ra1
ra2=paste(ra1[1],ra1[2])
ra3 = str_remove_all(ra2," ")
ra3

ratings <- html_text(nodes2)
ratings_c=strsplit(ratings,":")
ratings_c1=unlist(ratings_c)
ratings_c1[2]
ratings_c2=ratings_c1[2]
ratings2=sub(",","",ratings_c2)
movie_ratings[i] = ratings2
ratings2=sub(",","",ratings_c2)

nodes3 = html_nodes(html_page1,
                    xpath = '//*[@id="mainColumn"]//div/div/ul/li[2]/div[2]/a')
genre = html_text(nodes3, trim = TRUE)
genre1 = str_remove_all(genre,' ')
genre1[3]

############### 완성 ######################
movie_title = vector(mode = "character", length = 100)
movie_ratings = vector(mode = "character", length = 100)
movie_genre = vector(mode = "character", length = 100)

for(i in 1:100) {
  url <- "https://www.rottentomatoes.com/top/bestofrt/?year=2019"
  html_page = read_html(url)
  myPath = str_c('//*[@id="top_movies_main"]/div/table/tr[',
                 i,
                 ']/td[3]/a')
  nodes =  html_nodes(html_page,
                      xpath = myPath)
  title <- html_text(nodes, trim = TRUE)
  movie_title[i] =title
  
  
  link <- html_attr(nodes, name = 'href')
  url2 <- str_c("https://www.rottentomatoes.com",link)
  html_page1 = read_html(url2)
  nodes2 = html_nodes(html_page1,
                      xpath = '//*[@id="topSection"]/div[2]/div[1]/section/section/div[2]/div/strong' )
  ratings <- html_text(nodes2)
  ratings_c=strsplit(ratings,":")
  ratings_c1=unlist(ratings_c)
  ratings_c1[2]
  ratings_c2=ratings_c1[2]
  ratings2=sub(",","",ratings_c2)
  movie_ratings[i] = ratings2
  
  nodes3 = html_nodes(html_page1,
                      xpath = '//*[@id="mainColumn"]//div/div/ul/li[2]/div[2]/a')
  genre = html_text(nodes3, trim = TRUE)
  tmp =""
  
  for(j in 1:length(genre)){
    tmp = str_c(tmp," ",genre[j])
  }
  movie_genre[i]= tmp
}
movie_title
movie_ratings
movie_genre
movie=cbind(movie_title,movie_ratings,movie_genre)

View(movie)
write.csv(movie,
          file="C:/R_lecture/data/movie.csv",
          row.names = FALSE,
          quote = FALSE)

#########################


movie_ratings[i] = ratings

nodes3 = html_nodes(html_page1,
                    xpath = '//*[@id="mainColumn"]//div/div/ul/li[2]/div[2]/a')
genre = html_text(nodes3, trim = TRUE)
genre


###############################################

//*[@id="topSection"]/div[2]/div[1]/section/section/div[2]/div/strong
//*[@id="topSection"]/div[2]/div[1]/section/section/div[2]/div/strong

//*[@id="mainColumn"]/section[4]/div/div/ul/li[2]/div[2]
//*[@id="mainColumn"]/section[4]/div/div/ul/li[2]/div[2]/a[1]
//*[@id="mainColumn"]/section[4]/div/div/ul/li[2]/div[2]/a[2]

##########################################
review = vector(mode = "character", length = 10)
# 빈 벡터 만들기

for(idx in 1:10){
  myPath = str_c('//*[@id="old_content"]/table/tbody/tr[',
                 idx,
                 ']/td[2]/text()') # 문자열 연결
  nodes =  html_nodes(html_page,
                      xpath = myPath)
  txt <- html_text(nodes, trim = TRUE)
  review[idx] = txt[3]
  # 순차적으로 얻어온 리뷰 넣는것
}
####################################
genre = vector(mode ="character",length = 100)
for(idx in 1:100) {
  myPath = str_c('//*[@id="top_movies_main"]/div/table/tr[',
                  idx,
                  ']/td[3]/a')
  nodes = html_nodes(html_page,
                     xpath = myPath)
  txt <- html_text(nodes, trim = TRUE)
  genre[idx]
  
}
genre
######################################
extract_movie<- function(idx){
  url <- "https://www.rottentomatoes.com/top/bestofrt/?year=2019"
  html_page = read_html(url)
  nodes1 = html_nodes(html_page,
                      xpath = '//*[@id="top_movies_main"]/div/table/tr[1]/td[3]/a' )
  link <- html_attr(nodes1, name = 'href')
  title <- html_text(nodes1, trim = TRUE)
  url2 <- str_c("https://www.rottentomatoes.com", link)
  html_page1 = read_html(url2)
  nodes2 = html_nodes(html_page1,
                      xpath = '//*[@id="topSection"]/div[2]/div[1]/section/section/div[2]/div/strong' )
  ratings <- html_text(nodes2)
  nodes3 = html_nodes(html_page1,
                      xpath = '//*[@id="mainColumn"]//div/div/ul/li[2]/div[2]/a[i]')
  genre = html_text(nodes3, trim = TRUE)
  
  for(idx in 1:100) {
    myPath = str_c('//*[@id="top_movies_main"]/div/table/tr[',
                   idx,
                   ']/td[3]/a')
    nodes = html_nodes(html_page,
                       xpath = myPath)
    
  }
}


##########################################

extract_comment <- function(idx) {
  url <- "https://movie.naver.com/movie/point/af/list.nhn"
  page <- "page="
  request_url <- str_c(url,"?",page,1) 
  html_page = read_html(request_url)
  # html_page = read_html(request_url,encoding = "CP949")
  nodes = html_nodes(html_page,"td.title>a.movie")
  title <-html_text(nodes, trim = TRUE)
  genre =  html_nodes(html_page,
                      xpath = '//*[@id="old_content"]/table/tbody/tr[1]/td[2]/text()' )
   
  review <- html_text(nodes, trim = TRUE)
  review[3]
  review = vector(mode = "character", length = 10)
  
  for(idx in 1:10){
    myPath = str_c('//*[@id="old_content"]/table/tbody/tr[',
                   idx,
                   ']/td[2]/text()') # 문자열 연결
    nodes =  html_nodes(html_page,
                        xpath = myPath)
    txt <- html_text(nodes, trim = TRUE)
    review[idx] = txt[3]
  }
  
  df = cbind(title,review)
  return(df)
}


review = vector(mode = "character", length = 10)
# 빈 벡터 만들기

for(idx in 1:10){
  myPath = str_c('//*[@id="old_content"]/table/tbody/tr[',
                 idx,
                 ']/td[2]/text()') # 문자열 연결
  nodes =  html_nodes(html_page,
                      xpath = myPath)
  txt <- html_text(nodes, trim = TRUE)
  review[idx] = txt[3]
  # 순차적으로 얻어온 리뷰 넣는것
}

review

url3 <- html_nodes(request_url2, 'a')


# 링크는 속성을 가져오는 것
url3

//*[@id="top_movies_main"]/div/table/tr[1]/td[3]/a

url4 <- html_text(url3, trim = TRUE)
url4

class(url4)
url4 = as.vector(url3)

url3 = str_remove_all(txt,"\n") 
url3

# review부분은 xpath로 가져와 보자
nodes =  html_nodes(html_page,
                    xpath = '//*[@id="old_content"]/table/tbody/tr[1]/td[2]/text()' )
review <- html_text(nodes, trim = TRUE)
# 문자열로 들고와
review[3]
# but, 하나씩밖에 가져오지 못해


review = vector(mode = "character", length = 10)
# 빈 벡터 만들기

for(idx in 1:10){
  myPath = str_c('//*[@id="old_content"]/table/tbody/tr[',
                 idx,
                 ']/td[2]/text()') # 문자열 연결
  nodes =  html_nodes(html_page,
                      xpath = myPath)
  txt <- html_text(nodes, trim = TRUE)
  review[idx] = txt[3]
  # 순차적으로 얻어온 리뷰 넣는것
}

review

df = cbind(title,review)
View(df)

#################################
url <- "https://www.rottentomatoes.com/top/bestofrt/?year=2019"
html_page = read_html(url)
myPath = str_c('//*[@id="top_movies_main"]/div/table/tr[',
               i,
               ']/td[3]/a')
nodes =  html_nodes(html_page,
                    xpath = myPath)
title <- html_text(nodes, trim = TRUE)
movie_title[i] =title

link <- html_attr(nodes, name = 'href')
url2 <- str_c("https://www.rottentomatoes.com",link)
html_page1 = read_html(url2)
nodes2 = html_nodes(html_page1,
                    xpath = '//*[@id="topSection"]/div[2]/div[1]/section/section/div[2]/div/strong' )
ratings <- html_text(nodes2)
movie_ratings[i] = ratings

nodes3 = html_nodes(html_page1,
                    xpath = '//*[@id="mainColumn"]//div/div/ul/li[2]/div[2]/a')
genre = html_text(nodes3, trim = TRUE)
aa=cbind(title,ratings,genre)
movie_genre[i] = genre












