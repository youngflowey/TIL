2019-11-06

## 자연어 처리 기능을 이용해 보아요 ##

## 이것은 소리없는 아우성
# 한글 형태소 분리 어려워

## KoNLP package를 이용
# Korean Natural Language Process
# 해당 패키지 안에 사전이 포함되어 있다
# 3가지의 사전이 포함
# 시스템 사전(28만개),
# 세종 사전(32만개),
# NIADic 사전(98만개)

# JAVA 기능을 이용!
# 시스템에 JRE 가 설치되어 있어야한다
# JRE 를 설치를 하긴 했는데 R package가 JRE를 찾아서 써야해
# JAVA_HOME 환경변수를 설정해야 한다
# 환경변수를 보려면 내pc>오른쪽마우스>속성>고급시스템설정

# 참고로 영문 NLP => openNLP, Snowball
# package를 많이 이용

install.packages("KoNLP")
library(KoNLP)

useNIADic()



tmp="이것은 소리없는 아우성"

extractNoun(tmp)

txt1 <- readLines("C:/R_lecture/data/hiphop.txt",
                 encoding = "UTF-8")
head(txt)
# 문자에 "\" 특수문자라는 뜻

# 데이터가 정상적으로 들어왔어요!
# 특수문자가 포함되어 있네? 제거해주는게 좋다

library(stringr)
# 정규표현식을 이용해서 특수문자를 모두 찾아서 " " 공백으로 변환
# 공백 남기고 특수문자가 제거
txt <- str_replace_all(txt1,
                "\\W", " ")
# 찾아서 싹다 바꿔
# \\W : 특수기호
head(txt)

## 형태소를 분석할 데이터가 준비되었어요!

## 함수를 이용해서 명사만 뽑아내요

nouns <- extractNoun(txt)
head(nouns)

# 명사를 추출해서 list형태로 저장
length(nouns)

# list형태를 vector로 변환
words <- unlist(nouns)
# 벡터 안에 명사들이 하나씩 들어감
head(words)
length(words)

# 워드클라우드를 만들기 위해서
# 많이 등장하는 명사만 추출

head(table(words))
wordcloud <- table(words)
class(wordcloud)

# 빈도를 구하기 위해 테이블 형태로 만들어줌
# 우리는 데이터 프레임 필요

df = as.data.frame(wordcloud,
                   stringsAsFactors = F)
View(df)
ls(df)

# 두글자 이상으로 되어있는 데이터 중
# 빈도수가 높은 상위 20개의 단어들만 추출
# (한글자짜리는 의미가 없다)

library(dplyr)
word_df <-df %>%
  filter(nchar(words) >= 2) %>%           # nchar : 글자수
  arrange(desc(Freq)) %>%                   # 빈도수 가지고 정렬
  head(20)

# 데이터가 준비되었으니 워드클라우드를 만들어보자

install.packages("wordcloud")
library(wordcloud)

# 워드 클라우드에서 사용할 색상에 대한
# 팔레트를 설정
# Dark2라는 색상 목록에서 8개의 색상을 추출

pal <- brewer.pal(8,"Dark2")

# 워드 클라우드는 만들대마다 랜덤하게 만들어진다
# 랜덤하게 생성되기 때문에 재현성을 확보할 수 없다
# 랜덤함수의 시드값을 고정시켜서 항상 같은 워드클라우드가 만들어지게 설정

set.seed(1)
word_df
wordcloud(words=word_df$words,
          freq=word_df$Freq,
          min.freq = 2,           # 적어도 2이상은 나오는 단어
          max.words = 20,        # 최대 단어수 20개, 크면클수록 사이즈 커져서 예브게 안나옴
          random.order = F,       # 고빈도 단어를 중앙배치 or not
          rot.per = .1,           # 적절한 단어의 회전(전체중에 몇개 회전시킬까)
          scale = c(4,0.3),       # 단어 크기(숫자이 차이가 클수록 글자 크기의 차이가 큼)
          colors = pal)



##############################################







# 네이버 영화댓글 사이트
# 특정 영화에 대한 review를 crawling해서 wordcloud를 작성
install.packages("rvest")
library(rvest)
library(stringr)
library(jsonlite)
library(httr)
library(selenium)


movie_r = vector(mode = "character")


for(idx in 1:100){
  review = vector(mode = "character", length = 10)
  myPath = str_c('https://movie.naver.com/movie/point/af/list.nhn?st=mcode&sword=182014&target=after&page=',
                 idx)
  html_page = read_html(myPath, encoding = "CP949")

  for(i in 1:10){
     path = str_c('//*[@id="old_content"]/table/tbody/tr[',
                 i,
                 ']/td[2]/text()') # 문자열 연결
      nodes =  html_nodes(html_page,
                      xpath = path)
      txt <- html_text(nodes, trim = TRUE)
      review[i] = txt[3]
  # 순차적으로 얻어온 리뷰 넣는것
  }
  
  movie_r = c(movie_r,review)
  
}
  

movie_r


View(movie_r)

txt <- str_replace_all(movie_r,
                       "\\W", " ")

txt
head(txt)
nouns <- extractNoun(txt)
head(nouns)
length(nouns)
words <- unlist(nouns)
head(words)
head(table(words))
wordcloud <- table(words)
class(wordcloud)
df = as.data.frame(wordcloud,
                   stringsAsFactors = F)
View(df)

library(dplyr)
word_df <-df %>%
  filter(nchar(words) >= 2) %>%           
  arrange(desc(Freq)) %>%                   
  head(20)

install.packages("wordcloud")
library(wordcloud)
pal <- brewer.pal(8,"Dark2")
set.seed(1)
word_df
wordcloud(words=word_df$words,
          freq=word_df$Freq,
          min.freq = 2,           
          max.words = 50,        
          random.order = F,      
          rot.per = .1,           
          scale = c(10,0.3),       
          colors = pal)

###############################



