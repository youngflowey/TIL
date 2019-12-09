2019-11-05

##### reshape2 package#####

# => dcast() 있어서 좋다
# 데이터의 형태를 바꿀 수 있다
# 가로로 되어 있는 데이터를 세로로 바꿀 수 있다
# 우리가 원하는 데이터 형태로 바꿀 수 있다
# 컬럼으로 저장되어 있는 데이터를 row형태로 
# row 형태이 데이터를 column형태로 전환

# 이해를 돕기 위해 2개의 sample file을 이용해 보자

# melt_mpg.csv
# sample_mpg.csv

sample_mpg <- read.csv(file = "C:/R_lecture/data/sample_mpg.csv",
                       sep = ",",
                       header = T,
                       fileEncoding = "UTF-8")

sample_mpg

melt_sample_mpg <- read.csv(file = "C:/R_lecture/data/melt_mpg.csv",
                            sep = ",",
                            header = T,
                            fileEncoding = "UTF-8")
  # melt 데이터를 녹이는..?

melt_sample_mpg
  # variable value 가 들어있어
  # 아까 컬럼에 있던 값들이 로우로 떨어진것

View(melt_sample_mpg)

# 두 개의 data frame에 대해서 평균 도시 연비
library(ggplot2)
library(stringr)
library(dplyr)

sample_mpg
mean(sample_mpg$cty)   # 18.25

melt_sample_mpg
filter(melt_sample_mpg,
       variable == "cty") %>%
  summarise(avg_rate = mean(value))   # 18.25
## ??바로 mean을 쓰면 안되는 이유??


# 두 개의 data frame에 대해서 평균 연비를 구해서 표시
# (평균 연비 = 도시연비와 고속도로 연비의 평균으로 계산)
sample_mpg
sample_mpg %>%
  mutate(avg_rate = (cty+hwy)/2)

melt_sample_mpg  # 너무 힘들다

### reshape2 package는 수집한 데이터를 분석하기 편한 형태로 가공할때 사용하는 대표적인 pakcage

### 2개이 함수만 잘 알아두면 된다
### 1. melt()

# column을 row 형태로 바꿔서 가로로 긴 데이터를 세로로 길게 전환하는 함수
# melt()의 기본종작은 numeric을 포함하고 있는 모든 column을  raw로 변환!
# 문자는 녹이지 못하고 숫자만

# 간단한 예를 통해서 melt()의 동작방식으로 알아보자
install.packages("reshape2")
library(reshape2)

# 기본적으로 R이 내장하고 있는 data set
help(airquality)  # document
airquality
ls(airquality)    # column명 
head(airquality)
str(airquality)

df <- airquality
# 이런거 작업할 때 원본데이터 이름으로 정하면 원본데이터 바뀔 수도있어
# 원본은 건들지 마셈


df <- airquality   
melt(df)#153 행, 6열
head(melt(df))
head(df)

# 전체 데이x row 
nrow(melt(df))    # 153g행 *6= 918행
nrow(melt(df))    # 153g행 *6= 918행

nrow(melt(df,na.rm=T)) # 874행, 결측치를 제외

melt(df, id.vars = "Month") # 153 * 5 = 765명명
melt(df, id.vars = c("Month","Day"))
# id.vars : melt 녹이지 않겠다는 변수

melt(df, id.vars = c("Month","Day"), # 녹이지 말아야될 컬럼
     measure.vars = "Ozone")
# Ozone만 뽑는다는 이야기


melt_df <- melt(df, id.vars = c("Month","Day"), # 녹이지 말아야될 컬럼
           measure.vars = "Ozone",
           variable.name = "Item",  # 컬럼의 이름도 정해줄 수 있어
           value.name = "Item_value"
           ) 
melt_df
# 적절하게 내가 필요로 하는 데이터를 기존데이터를 약간 녹여서 만들 수 있다
# 로우 데이터가 필요한 경우 melt를 이용해 추출


# dcast() : data frame에 대한 cast 작업
#         : 로우형태로 되어있는 데이터를 컬럼 형태로
# 만약에 값이 겹친다면 cast시키기 애매해짐
# d : data frame : 우리가 대부분 다루는것
# a : array

dcast(melt_df,
      formula = Month + Day ~ ...)
                      # ~ : 복귀 시켜 ... : 나머지 것들

dcast(melt_df,
      formula = Month ~ Item, # month만 남겨
      fun = mean,  # 평균을 내서 원상복귀(다른형태로) 시키는것
      na.rm =T)
# 집계 함수를 줄 수 있어

## 처음에 받은 csv파일의 내용을 원상 복귀 시켜보자
melt_sample_mpg
# column 세개가 melt된것
dcast(melt_sample_mpg,
      formula = manufacturer + model + class + trans ~variable, # 컬럼지칭
      value.var = "value") #각각의 컬럼에 대한 값 value안에 있다
# 복구시킬 데이터
# cty hwy dipl >> data frame으로 복구

# Aggregation function missing: defaulting to length
#   >원래 있던 컬럼들이 uique하지 않아서 복구 시킬 수 없다는 뜻 (duplicate되어있음)

# audi    a4 compact auto(l5) 1999      cty  18.0
# audi    a4 compact auto(l5) 1999      cty  16.0
# 이렇게 앞에것들이 똑같으면 원상복구 x

## 제공된 파일을 이용한 melt형식의 data frame은 원상복귀 될 수 없다

## melt() 된 데이터를 생성해 보자
## mpg를 가지고 melt data set을 생성해 보자
df <- as.data.frame(mpg)
head(df)
audi_df <- df %>% 
           filter(manufacturer == "audi",
                  model == "a4")
audi_df

melt_audi_df <- melt(audi_df,
                     id.vars = c("manufacturer",
                                 "model",
                                 "year",
                                 "cyl",
                                 "trans"),
                     measureu.var =c("displ",
                                     "cty",
                                     "hwy"))
                    # mesure에 대한 변수


head(melt_audi_df)

dcast(melt_audi_df,
      formula = manufacturer+
        model + year + cyl + trans ~ variable,
      value.var = "value")






















