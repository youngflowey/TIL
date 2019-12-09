2019-10-30

# R에서 JSON 데이터 처리
# Network를 통해서 JSON데이터를 받아서 Data Frame으로 만들기 위해 새로운 package를 이용해보자

# 1. package 설치
install.packages("jsonlite")
# json 처리하기 위한 패키지
install.packages("httr")
# Network를 사용하기 위한 여러가지 함수들 패키지

# 2. package를 사용하기 위해 loading작업 필요
library(jsonlite)
library(httr)

# 3. 문자열 처리하기 위한 package loading
library(stringr)

# 접속할(호출할) 주소
url <- "http://localhost:8080/bookSearch/search?keyword="
request_url<- str_c(url,
                    scan(what = character()))
# str_c : 문자열 연결시키는 함수
# 입력을 받아서 쓰는 scan

# 한글 인코딩 바꿔주기 ( 한글처리 )
request_url <- URLencode(request_url)

request_url
# -> 유니코드로 바뀜

# 주소가 완성
df <- fromJSON(request_url)
# 어디서 부터 json 가져와
# url 사용해서 json 가져와
# df : table 형태로 json 떨어짐
df

View(df)    # console에서 치면 안보여 
str(df)     # str() : data frame의 구조를 파악
name(df)   # column의 이름들


# 찾은 도서 제목만 console에 출력!
for(idx in 1:nrow(df)){
  print(df$title[idx])  
}
# df$title -> title을 벡터형태로 땡기는거
# 4번을 반복해야해
# nrow(df) : 현재 데이터의 행의 개수
  # > nrow(df) => 4
# 벡터를 열단위로 여러개 모아놓은게 dataframe

# R은 package의 함수를 이용하여 편하다


# 데이터를 json 형태로 가져와서 R 로 처리 하는 과정
# JSON을 이용해서 Data Frame을 생성할 수 있다
# data frame을 csv형식으로 file에 저장

write.csv(df,
          file="C:/R_lecture/data/book.csv",
          row.names = FALSE,
          quote = FALSE)
          # 어떤 파일에 저장할건지
#1,2,3,4 없애고 싶어
# ""도 없애고 싶어
# 그런데 ""안에 , 가 들어있으면 프로그램 처리하기 애매해짐
# ""이 더 처리하기 좋다(csv단점이자장점)

# 서버로 가져온 JSON 직접 이용하고 싶어
# 우리가 들고 온건 dataframe
# json 형태로 다시 바꾸려면
# Data Frame을 JSON으로 변경하려면 어떻게 하나?
df_json <- toJSON(df)
df_json
# 문자열 형태로 변환
prettify(df_json)
# json구조화 시켜서 예쁘게 바꾼것

write(prettify(df_json),
      file = "C:/R_lecture/data/book_json.txt")

# json목적 : 엑셀사이즈 너무 크니 사이즈 줄이기 위해
# but, 공백이 많아 사이즈 클 수 밖에 없음
# json 저장할때는 prettify 하지 않음



###############################################################

# 2018년 10월 30일 박스오피스 순위를 알아내서 제목과 누적관람객 수를 csv파일로 저장해보자.

1.

url1 <- "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=20ad22acd5f2e8277e79a4bc4a61bad4&targetDt=20181030"
df <- fromJSON(url1)
View(df)
df1=df[["boxOfficeResult"]]
View(df2)
제목=df2[["dailyBoxOfficeList"]][["movieNm"]]
누적관객수=df2[["dailyBoxOfficeList"]][["audiAcc"]]
df5=cbind(제목,누적관객수)
write.csv(df5,
          file="C:/R_lecture/data/movie.csv",
          row.names = FALSE,
          quote = FALSE)


2.

View(df$boxOfficeResult$dailyBoxOfficeList)
str(df$boxOfficeResult$dailyBoxOfficeList)
names(df$boxOfficeResult$dailyBoxOfficeList)

d1 <- data.frame(movieNm = df$boxOfficeResult$dailyBoxOfficeList$movieNm,
                 audiAcc = df$boxOfficeResult$dailyBoxOfficeList$audiAcc,
                 stringsAsFactors = F)

d1
str(d1)
write.csv(d1,
          file="C:/R_lecture/data/movie1.csv",
          row.names = FALSE,
          quote = FALSE)





# 얻어온 데이터에서 필요한 내용만 추출해서 Data Frame을 새로 생성한 후 파일 출력
d1 <- data.frame(movieNm = df$boxOfficeResult$dailyBoxOfficeList$movieNm,
                 audiAcc = df$boxOfficeResult$dailyBoxOfficeList$audiAcc,
                 stringsAsFactors = F)
d1

# Data Frame에서 로직처리(for문) 해서 데이터를 추출해 text 파일에 append해서 파일 출력
for(idx in 1:nrow(d1)){
  print(d1$movieNm[idx])
  print(d1$audiAcc[idx])
  
}

######################################################


#Web Crawling : 인터넷 상에서 필요한 정보를 읽어와서 수집하는 일련의 작업(과정)

# 1. Web Scraping
# -> 하나의 web page에서 내가 원하는 부분을 추출하는 행위
# 2. Web Crawling(web spidering)
# -> 자동화 봇인 crawler가 정해진 규칙에 따라 복수개의 web page를 brwsing하는 행위

# scraping을 할 때 css(jQuery) selector를 이용해서 필요한 정보를 추출
# selecor를 이용해서 추출하기 힘든놈들도 있다
# 추가적으로 xpath도 이용해 볼거다.(xml기반, 표현법이 다르다)

# 특정 사이트에 접속해서 내가 원하는 데이터를 추출해보자

# 아까는 도서검색 : json 파일
# 지금은 html을 들고 오는것
# 우리가 처리하기 쉽도록 구조화 하기
# html 자료 구조화 

# 1. 서버로 부터 받은 html 태그로 구성된 문자열을 자료구조화 시키는 패키지를 이용해야 한다.
install.packages("rvest")
library(rvest)
library(stringr)

# 2. url을 준비
url <- "https://movie.naver.com/movie/point/af/list.nhn"
  # 프로그램에 대한 url
page <- "page="

request_url <- str_c(url,"?",page,1)   # 문자를 연결(,구분,페이지번호)
  # 서버쪽에 내가 요청할 주소라는 뜻
request_url

# 3. 준비된 url로 서버에 접속해서 html을 읽어온 후 자료구조화(문자열이 아닌 배치열을 가지고 있는) 시키기
html_page = read_html(request_url)
  # html을 읽는 함수
  # 주소를 줘야지 읽겠지
html_page
class(html_page)
# 돔이라는 구조를 만드는 객체

# 4. selector를 이용해서 추출하기 원하는 요소(element)를 선택
nodes = html_nodes(html_page,"td.title>a.movie")
# html_nodes : 찾는것 (여기에서, 찾는것)
# td면서 class가 title
# css selctor 바로 써줌
# 에 있는 모든 요소들

# 5. tag사이에 들어있는 text추출
title <-html_text(nodes, trim = TRUE)
title

# 6. selector를 이용해서 리뷰요소(element)를 선택
nodes =  html_nodes(html_page,"td.title")  # trim : 앞뒤 공백을 제거
review <- html_text(nodes, trim = TRUE)
review
class(review)  # 벡터

# 7. 필요없는 문자들을 제거
review = str_remove_all(txt,"\t")
review = str_remove_all(txt,"\n")  # 줄바꿈
review = str_remove_all(txt,"신고")  # 그냥 쓰면 리뷰안의 신고까지 날라감
review
# stringr 패키지 함수
# 정규식( 주민등록번호 맞는지 틀린지 봤던거)

# 8. 영화제목과 리뷰에 대한 내용을 추출
# r 대부분 dataframe으로 끌고가 제일 많이 쓰임. 편하기 때문
# 제목 vector하나 리뷰 vector하나 => bind 함수

df = cbind(title,review)
View(df)

# css selector보다 xpath가 더 세밀해
# 정확하게 원하는거 찝을 수 있음

# 9. 이렇게 구축한 데이터를 파일에 저장

###############################################

##### 이번에는 같은 작업을 xpath를 이용해서 처리해보자 #####
install.packages("rvest")
library(rvest)
library(stringr)
url <- "https://movie.naver.com/movie/point/af/list.nhn"
page <- "page="
request_url <- str_c(url,"?",page,1) 
html_page = read_html(request_url, encoding = "CP949")
## 요즘 것 : "UTF-8"
# html 통으로 들고 온것
nodes = html_nodes(html_page,"td.title>a.movie")
title <-html_text(nodes, trim = TRUE)
# review부분은 xpath로 가져와 보자
nodes =  html_nodes(html_page,
                    xpath = '//*[@id="old_content"]/table/tbody/tr[1]/td[2]/text()' )
# " " 하면 중복되니 '' 로 해줌
# xpath copy : //*[@id="old_content"]/table/tbody/tr[1]/td[2]/text()
# > = / : 자식으로 있는..이라 해석됨
# tbody의 자식 tr[1], tr[2] 첫번째 두번째 자식
# 각각의 것들 뽑을 수 있을거야
review <- html_text(nodes, trim = TRUE)
# 문자열로 들고와
review[3]
# but, 하나씩밖에 가져오지 못해
title

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

# selector는 뭉탱이로 처리
# xpath는 프로그램적 처리

# 지금은 서버가 나에게 html을 주어서 필요한 것들 뽑아서 쓰는것
# => scarping

# 이 작업을 반복
# => crawling

###########################################

# 반복해서 page를 browsing하는 crawling까지 포함해 보자

myFunc <- function(idx) {
  print(idx)
}

for(i in 1:10) {
  myFunc(i)
}

# 일련의 코드의 myFunc이름을 대치시켜 호출하는 것

extract_comment <- function(idx) {
  url <- "https://movie.naver.com/movie/point/af/list.nhn"
  page <- "page="
  request_url <- str_c(url,"?",page,1) 
  html_page = read_html(request_url)
  # html_page = read_html(request_url,encoding = "CP949")
  nodes = html_nodes(html_page,"td.title>a.movie")
  title <-html_text(nodes, trim = TRUE)
  nodes =  html_nodes(html_page,
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

# 데이터 프레임 개별적 x 합칠때 rbind로 붙이기

#### 함수를 호출해서 crawling을 해보자 ####
result_df = data.frame();


for(i in 1:10) {
  tmp <- extract_comment(i)
  result_df = rbind(result_df,tmp)
}

View(result_df)






