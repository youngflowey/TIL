2019-11-01

# 연습문제를 풀어보자
library(dplyr)
# MoivieLens Data Set을 이용해서 처리해보자
# 영화에 대한 평점 정보를 기록해 놓은 데이터
# 평점은 1점 ~ 5점 (5점이 최대)
# 사람이 한두사람이 아니다
# 영화도 굉장히 많다
# 한사람이아닌 여러사람이 영화에 대한 평점 많아
# 구글에서 MovieLens 검색

# 데이터를 받았으면 데이터의 구조 확인
# 컬럼의 의미를 파악

# 1. 사용자가 평가한 모든 영화의 전체 평균 평점
ratings <- read.csv(file.choose())
ratings
mean(ratings$rating)

# 2. 각 사용자별 평균 평점 (이 사람은 평균적으로 몇점을 주는지)
df <- group_by(ratings,
               userId) %>%
      summarise(user_mean = mean(rating))

df


# 3. 각 영화별 평균 평점

movies <- read.csv(file.choose())
movieId <- arrange(movies,movieId)
movieId
summary(movieId)
str(movieId)

df1 <- group_by(ratings,
                movieId) %>%
       summarise(movie_mean = mean(rating))
df1

df_2 = full_join(movieId,df1)
  #join(movieId,df1,by="movieId", type="full")
head(df2)
head(df_2)
str(df2)


# 4. 평균 평점이 가장 높은 영화의제목을 내림차순으로 출력 (동률이 있는 경우 모두 출력)

df3 = arrange(df2,desc(movie_mean))
df3
head(df3)
df_3 = filter(df3,
              movie_mean == 5) %>%
      select(title) %>%
      arrange(desc(title))
      
df_3
sum(is.na(df_3))


# 5. comedy 영화 중 가장 평점이 낮은 영화의 제목 (동률이 있는 경우 모두 출력)을 오름차순으로 출력

df4=df3[grep("Comedy",df3$genres),]
df4
df5 = arrange(df4,movie_mean)
head(df5)
df6 = filter(df4,
             movie_mean == 0.5) %>%
      select(title)
df6
df_6 = arrange(df6, title)
df_6
sum(is.na(df6))
########

library(stringr)
ddd = filter(df3,
             str_detect(genres,"Comedy")) %>%
  arrange(movie_mean)

dff = filter(ddd,
              movie_mean == ddd$movie_mean[1])%>%
  select(title) %>%
  arrange(title)
dff


# 6. 2015년도에 평가된 모든 Romance 영화의 평균 평점 출력
ratings$time = as.POSIXct(ratings$timestamp, origin="1970-01-01")
ratings
arrange(ratings,movie_Id)
movieId
df_7 = filter(ratings,
              str_detect(time,"2015"))
df_8 = filter(movies,
              str_detect(genres,"Romance"))
df_9 = inner_join(df_7,df_8)
mean(df_9$rating,na.rm=T)

##
mean(df_9$rating)
##

Mean = group_by(df9,
                movieId) %>%
  summarise(movie_mean = mean(rating))%>%
  arrange(movieId)
View(Mean)
df10 = inner_join(Mean,df9)
View(df10)
mean(df10$movie_mean)
final = group_by(df10,
                 movieId) %>%
  summarise(rara = mean(movie_mean))
final
final1=inner_join(df10, final)
final2=unique(select(final1, title, movie_mean,time))
View(final2)
mean(final2$movie_mean)

final3=unique(select(final1, title, movie_mean))
View(final3)
mean(final3$movie_mean)
final4=group_by(final3,
                title)
mean(final4$movie_mean)

#################

df7 = ratings[grep("2015", ratings$time),]

str(df7)
df8 = movies[grep("Romance", movies$genres),]

str(df8)
str(df_9)
mean(df_9$rating,na.rm=T)
View(df_9)

###################


ratings$time = as.POSIXct(ratings$timestamp, origin="1970-01-01")
ratings
time
df3
ratings
movieId <- arrange(movies,movieId)
movieId
df1 <- group_by(ratings,
                movieId) %>%
  summarise(movie_mean = mean(rating))
df_2 = full_join(movieId,df1)


df7 = time[grep("2015", time)]
df7
head(df7)
str(df7)
df7$genres
sum(is.na(df7))

df8 = df7[grep("Romance", df7$genres),]
df8
sum(is.na(df8))
str(df8)
mean(df8$movie_mean,na.rm = T)


2019-11-01

# 연습문제를 풀어보자
library(dplyr)
# MoivieLens Data Set을 이용해서 처리해보자
# 영화에 대한 평점 정보를 기록해 놓은 데이터
# 평점은 1점 ~ 5점 (5점이 최대)
# 사람이 한두사람이 아니다
# 영화도 굉장히 많다
# 한사람이아닌 여러사람이 영화에 대한 평점 많아
# 구글에서 MovieLens 검색

# 데이터를 받았으면 데이터의 구조 확인
# 컬럼의 의미를 파악

# 1. 사용자가 평가한 모든 영화의 전체 평균 평점
ratings <- read.csv(file.choose())
ratings
mean(ratings$rating)

# 2. 각 사용자별 평균 평점 (이 사람은 평균적으로 몇점을 주는지)
df <- group_by(ratings,
               userId) %>%
  summarise(user_mean = mean(rating))

df


# 3. 각 영화별 평균 평점

movies <- read.csv(file.choose())
movieId <- arrange(movies,movieId)
movieId
summary(movieId)
str(movieId)

df1 <- group_by(ratings,
                movieId) %>%
  summarise(movie_mean = mean(rating))
df1

df2 = full_join(movieId,df1)
#join(movieId,df1,by="movieId", type="full")
head(df2)
head(df_2)
str(df2)


# 4. 평균 평점이 가장 높은 영화의제목을 내림차순으로 출력 (동률이 있는 경우 모두 출력)

df3 = arrange(df2,desc(movie_mean))
df3
head(df3)
df_3 = filter(df3,
              movie_mean == 5) %>%
  select(title) %>%
  arrange(desc(title))

df_3
sum(is.na(df_3))


# 5. comedy 영화 중 가장 평점이 낮은 영화의 제목 (동률이 있는 경우 모두 출력)을 오름차순으로 출력

df4=df3[grep("Comedy",df3$genres),]
df5 = arrange(df4,movie_mean)
head(df5)
df6 = filter(df4,
             movie_mean == df5$movie_mean[1]) %>%
  select(title)

df6
df_6 = arrange(df6, title)
df_6
sum(is.na(df_6))
######

df4 = filter(df3,
             genres == "Comedy") %>%
  arrange(movie_mean)
head(df4, n=1)      
df5 = filter(df3,
             genres == "Comedy",
             movie_mean == 0.5)
df5

# 6. 2015년도에 평가된 모든 Romance 영화의 평균 평점 출력
movieId <- arrange(movies,movieId)
ratings$time = as.POSIXct(ratings$timestamp, origin="1970-01-01")
head(arrange(ratings,time))
str(ratings)
str(movieId)
arrange(ratings,movie_Id)
movieId
df7 = ratings[grep("2015", ratings$time),]
str(df7)
df8 = movies[grep("Romance", movies$genres),]
str(df8)
df9 = inner_join(df7,df8)
str(df9)
Mean = group_by(df9,
                movieId) %>%
  summarise(movie_mean = mean(rating))
Mean
View(Mean)
df10 = inner_join(Mean,df9)
View(df10)
mean(df10$movie_mean)
final = group_by(df10,
                 movieId) %>%
  summarise(rara = mean(movie_mean))
final
final1=inner_join(df10, final)
final2=unique(select(final1, title, movie_mean,time))
View(final2)
mean(final2$movie_mean)

final3=unique(select(final1, title, movie_mean))
View(final3)
mean(final3$movie_mean)
final4=group_by(final3,
         title)
mean(final4$movie_mean)

###################################################

View(Mean)
str(Mean)
str(ratings)
unique(ratings)$movieId



df3
head(ratings)
grep("2015", ratings$time)
df7 = ratings[grep("2015", ratings$time),]
head(df7)
ratings
df7
movie_Id <- arrange(movies,movieId)

movieId
head(movieId)

df1
head(df1)
str(df1)
df_2 = full_join(movieId,df1)
df_2
df_3 = full_join(df_2,time)
df_2
head(df_2)
df7 = df_2[grep("2015", df_2)]
nrow(filter(df_2,
            str_detect(trans,"auto"))) 
df7
head(df7)
str(df7)
str(df_2)
DF = cbind(df7,df_2)

DF$genres
sum(is.na(df7))

df8 = DF[grep("Romance", DF$genres),]
View(df8)
sum(is.na(df8))



str(df8)
mean(df8$movie_mean,na.rm = T)


df1 <- group_by(df7,
                movieId) %>%
  summarise(movie_mean = mean(rating))
