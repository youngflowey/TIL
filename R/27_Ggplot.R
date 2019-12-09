2019-11-04


## 3주차


## 데이터 조작, 데이터 정제
## 시각화에 대한 내용(ggplot2)

## mpg data set을 이용해서 데이터 조작, 정제에 대한 내용을 학습해 보자

## mpg data set을 이용하기 위해서 특정 package를 설치해 보자

install.packages("ggplot2")     # package 설치
library(ggplot2)     # package를 메모리에 로딩

mpg
str(mpg)    # 자료구조를 조사해 보자
class(mpg)  # 자료구조를 조사해 보자
# 원래는 그냥 dataframe 이면 dataframe으로 떨어짐
# >> tbl_df 
# mpg는 table data frame 형태
# 출력을 용이하게 하기 위한 형태이고 console 크기에 맞추어서 data frame을 출력


df <- as.data.frame(mpg)    # data frame으로 변환
df
class(df)
write.table(df, "C:/python_DA/mpg.txt", 
            
                        sep = ",", 
            
                        row.names = T, 
            
                        quote = FALSE, 
            
                        append = TRUE, 
            
                        na = "NA"
            
                        ) 

str(mpg)

## 사용할 data frame을 준비함!
## data frame의 dolumn명을 알아보자
ls(mpg)    # data frame의 column명을 오름차순 정렬해서 출력

## mpg에 대한 document를 확인해서 column의 의미를 먼저 파악해야 한다
help(mpg)
head(mpg)    # 기본적으로 6개 출력
tail(mpg)
head(mpg, 3) # 보고싶은 개수를 지정할 수 있어요
View(df)
dim(df)      # data frame이 몇개의 행과 몇개의 열로 구성되어있는지 확인
nrow(df)     # data frame의 행의 개수를 추출
ncol(df)     # data frame의 열의 개수를 추출
length(df)   # 원래 length() 는 원소의 개수를 구하는 함수인데
             # data frame에 적용되면 column의 개수를 구한다
str(df)      # 자료구조, 행의 개수, 열의 개수
             # 컬럼명, 데이터 타입,...
summary(df)  # 가장 기본적인 통계 데이터를 추출
rev(df)      # vector에 대해서 데이터를 역순으로 변환하는 기능

##############################################################

## 데이터 조작 (dplyr : 디플라이알 )
## data frame을 조작할 때 가장 많이 사용하는 package
## 속도에 강점 : C++로 구현되어 있다(많은 양의 데이터 처리 빠르게 가능)
## chaining이 가능 ( %>% )
## dplyr이 제공하는 여러 함수를 이용해서 우리가 원하는 데이터를 추출

library(dplyr)
# 1. tbl_df()
df
df <- tbl_df(df)     # table data frame
    # 출력을 위한 용도로 사용
df <- as.data.frame(df)     # data frame
    # 일반데이터프레임으로 바꿔서 사용하는데 더 용이


# 2. rename()  # column의 이름을 변경할 수 있어요
# raw data를 이용할 경우 column명이 없을때 column명을 새로 명시해서 사용해야 한다
# 컬럼명에 대소문자가 같이 있는 경우
# 모두 소문자, 대문자로 변경해서 사용하면 편하다
# df의 컬럼명을 모두 소문자 혹은 대문자로 변경
names(df) = toupper(names(df))
# names : df의 이름을 가져오는것
toupper(names(df))
tolower(names(df))
df


help(rename)
# rename(df,
#           새로운컬럼1 =  원래 컬럼1)

new_df <- rename(df,
                 MODEL = model)  
head(new_df)

## rename()은 data frame을 리턴
# 기존에 있는 데이터 프레임은 바뀌지 않음



# 3. 조건을 만족하는 행을 추출하는 함수
# 내가 원하는 조건을 가져오는 것 filter
# filter(data frame,
#           조건1, 조건2, 조건3,...)
# mpg data set에서
# 2000년도에 생산된 차량이 몇개 있는지 추출

df <- as.data.frame(mpg)
nrow(filter(df,
       year == 2008))


# 모든차량에 대해 평균 도시연비보다 도시연비가 높은차량의 model명을 출력하시오
df1 <- group_by(df, model) %>%
df1$sum(sum(cty))
  
        summarise(sum = sum(cty),
                cty = cty)
df1$cty_mean = mean(df$cty)
df1        
df1
as.data.frame(df1)
filter(df1, )

# sol)
avg.cty <- mean(df$cty, na.rm=T); avg.cty
filter(df, 
       cty > avg.cty)
## 이거 자체가 data frame

unique(filter(df, 
       cty > avg.cty)$model)
# 중복을 제외한 

# 고속도로 연비가 상위 75% 이상인 차량을 제조하는 제조사는 몇개인지 추출
# 총 15개 제조사 중 9개
head(df)
summary(df)
unique(filter(df,
       hwy >= 27)$manufacturer)

# sol)
length(unique(filter(df,
       hwy >= summary(df$hwy)[5])$manufacturer))

# 오토차량 중 배기량이 2500cc 이상인 차량 수는 몇개 인가요
head(df)
help(mpg)
df1 = df[grep("auto", df$trans),]
length(filter(df1,
       displ >= 2.5)$model)

# sol)
# 문자열 처리할때는 stringr을 사용해줘라
# detect함수로 처리하면돼
library(stringr)
nrow(filter(df,
       displ >= 2.5,
       str_detect(trans,"auto")))   # trans 안에 auto가 들어가있는 놈들 거르고


# 4. arrange() : 정렬하는 함수
# 기본 정렬방식 : 오름차순
# arrange(data frame,
#         column1,
#         desc(column2))     

avg.cty <- mean(df$cty, na.rm=T); avg.cty
unique(filter(df, 
              cty > avg.cty)$model)
# 모든 차량에 대해 평균 도시연비보다 도시연비가 높은 차량의 model명을 출력
# 단, 모델명을 오름차순으로 정렬하고 같은 모델에 대해서는 생산연도가 빠른순으로 정렬해 추출
avg.cty <- mean(df$cty, na.rm=T); avg.cty

unique((filter(df, 
        cty > avg.cty) %>%
    arrange(model,
            year))$model)

# sol)
unique(filter(df, 
               cty > avg.cty)$model)

df %>% filter(cty > mean(cty)) %>%
       select(model) %>%
       unique() %>%
       arrange(model)
# df 이미 앞에서 써줬기 때문에 안써줘도 돼


# 5. select() : data frame에서 원하는 column만 추출하는 함수
# select(data frame, column1, column2,...)


# 6. 새로운 column을 생성하려면 어떻게 해야 하나요?

# 도시연비와 고속도로 연비를 합쳐서 평균 연비 column을 만들어 보자
# (mean_rate)
df$mean_rate=(df$cty+df$hwy)/2
df
head(df)

# 기본 R의 기능을 이용해서 column을 만들 수 있어요
# column을 추가할 때는 mutate()함수를 이용해요
d(df)
new_df <- df %>% mutate(mean_rate = (cty+hwy)/2)
head(new_df)


# 7. 통계량을 구해서 새로운 컬럼으로 생성하는 함수 : summarise()

# model명이 a4이고 배기량이 2000cc 이상인 차들에 대해 평균 연비를 계산하세요
mean(filter(df,
       model == "a4",
       displ >= 2.0)$mean_rate)

filter(df,
       model == "a4",
       displ >= 2.0) %>%
  summarise(Mean = mean(mean_rate))

# sol)
result <- df %>%
          filter(model == "a4",
                 displ >= 2.0) %>%
          mutate(avg_rate = (cty+hwy)/2) %>%
          select(avg_rate)
result
mean(result)
# column이 하나밖에 없지만 data frame이라 data type이 안맞음
mean(result$avg_rate)


# summarise()를 이용해 보자
summary(df$hwy)
# 여러개의 레코드를 통해서 하나의 레코드로 축약 시켜준다

df %>% filter(model == "a4",
       displ >= 2.0) %>%
       summarise(avg_rate = mean(c(cty,hwy)),
                 hahaha = max(cty))
# 1행 1열 짜리 데이터 프레임을 얻을 수 있다

# 8. group_by() : 범주형 변수에 대한 grouping
df %>% filter(displ >= 2.0) %>%
  group_by(manufacturer) %>%
  summarise(avg_rate = mean(c(cty,hwy)))
 
 
# 9. left_join(), right_join(), inner_join(), outer_join()
# 데이터 프레임을 결합 시키는 것들

  
  






