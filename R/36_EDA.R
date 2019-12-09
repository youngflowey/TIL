2019-11-08

# EDA ( Exploratory Data Analysis )
# => 탐색적 데이터 분석

# 구글지도 서비스를 이용해 보자

# google Map Plagotm릏 사용하기 위해서는 특정 data가 필요

# 이 package가 CRAN에 등록이 아직 안되었다

# github에 공유되어있다

# VCS(version contral stem)

# 원본 : A
# 홍길동 : A1
# 최길동 : A2
# 하나의 파일로 여러명이 작업을 하면 날라감


## 이런 공동작업에 대한 문제를 해결하기 위해서 나온 것이 VCS
## CVCS (centralized vcs)
# 소스원본을 중앙서버가 1개 들고 있고 나머지 사람이 복사본을 가져다가 작업
## 서버문제래에 따라서 작업에 파질이 생길 수 있음

##  DVCS(Distributed cs)
## 소스 원본을 여러 곳에서 보관
## Git을 이용하면 공동처리가 쉬워진다.
## Git repsitory( 저장소)
## 이런 Git Repositoy 서비스 해주는 회사가 있어요 -> Github

##############################

# 1. Github에 공유되어 있는 ggmap package를 설치해야 해요

# 버전특성을 타요
# package들은 dependency(의존성)에 신경써야 한다
# 현재 R 버전을 확인해 보아요
sessionInfo()

# (최신버전의 R에서 안되는 package들이 있다. 이런 것을 의존성이라고 한다. 의존성을 맞춘다라고 함)
# (3.5.1 버젼을 깔아야 한다 ( CRAN - window - base - Previous release - 3.5.1))
# 현재 R 버전이 3.6.1이에요. 그런데 사용하려는 package가 3.5.1버전에서 실행된다

# 이제 버전을 맞췄으니 필요한 package를 github에서 다운받아 설치해 보아요
install.packages("devtools") 
library(devtools)

# install.packages()       # CRAN에서 받아서 설치
                         # 쓸수가 없어
install_github("dkahle/ggmap")        #깃허브에 접속해서 뭘 받아옴
# 구글맵 사용하는 패키지 다운
library(ggmap)
# could not find 이것을 사용하기 위한 package부터 설치해야 함 => devtools


# 생성한 구글 API Key
googleAPIKey = "AIzaSyCf8RGYXHQIV8CdQZoznAW0fztLqOD8qNA"

# 구글 API Key를 이용해서 인증을 받아요
register_google(key = googleAPIKey)

gg_seoul <- get_googlemap("seoul",
                          maptype = "roadmap" )
ggmap(gg_seoul)

library(dplyr)
library(ggplot2)

geo_code = geocode(enc2utf8("어린이대공원역"))
geo_code

# google map을 그리려면 위도, 경도가 숫자형태의 vector로 되어 있어야 한다

geo_data = as.numeric(geo_code)
geo_data
# 숫자형 벡터로 떨어짐

get_googlemap(center = geo_data,    # 이 위도 경도를 맵의 중앙에 잡아
              maptype = "roadmap",
              zoom=16) %>%          # 지도에 대한 정보를 ggmap으로 넘긴다
  ggmap() +                     # 지도 위에 그래프 올릴 수 있어
  geom_point(data=geo_code,
             aes(x=lon,
                 y=lat),
             size=5,
             color="red")

#################################

addr <- c("어린이대공원역","역삼역")
gc <- geocode(enc2utf8(addr))                    # 지역코드

df <- data.frame(lon=gc$lon,
                 lat=gc$lat)
df

cen <- c(mean(df$lon),mean(df$lat))

map <- get_googlemap(center=cen,
                     maptype = "roadmap",
                     zoom = 13,
                     markers = gc)

result <- ggmap(map)

ggplotly(result)


# 지하철역 주변 아파트 정보 : 서울 열린 데이터 광장

# 아파트 실 거래 금액 데이터 : 국토부 실거래가 공개 시스템

###########################################

# interactive Graph

# package 설치
install.packages("plotly")
library(plotly)

# mpg data set을 이용해서 배기량과 고속도로 연비에 대한 산점도를 그려보아요
library(ggplot2)
df <- as.data.frame(mpg)
head(df)

g <-
ggplot(data = df,
       aes(x=displ,     # displacement
           y=hwy)) +
  geom_point(size=3,color="blue")


ggplotly(g)

##################확대, 값 확인

###### 시계열 그래프

#### 시간에 따른 선그래프는 단순 확대만으로는 사용이 힘들어요

## 특정 구간에 대한 자세한 사항을 보기 위해서 다른 package를 이용

install.packages("dygraphs")
library(dygraphs)

# 예제로 사용할 data set은 economics

economics

# 시계열 그래프는 데이터를 xts라는 형식으로 변환시켜줘야한다

# 시간에 따른 개인 저축률 변환 추이를 선그래프로 그릴꺼에요

ggplot(data=economics,
       aes(x=date,
           y=psavert)) +
  geom_line()

# >>

library(xts)
save_rate = xts(economics$psavert,
                order.by = economics$date)
head(save_rate)
# 시간순으로, 해당저축률
# 앞에 있는것은 index, column이 아니야


dygraph(save_rate) %>% 
  dyRangeSelector()



unemp_rate = xts(economics$unemploy,
                order.by = economics$date)

dygraph(unemp_rate) %>% 
  dyRangeSelector()


# 하나로 합칠거야

head(save_rate)
unemp_save = cbind(save_rate,unemp_rate)

# 단위를 맞춰주기 위해 1000으로 나눔
save_rate = xts(economics$psavert,
                order.by = economics$date)
unemp_rate = xts(economics$unemploy/1000,
                 order.by = economics$date)
unemp_save = cbind(save_rate,unemp_rate)

dygraph(unemp_save) %>% 
  dyRangeSelector()

##################################################







