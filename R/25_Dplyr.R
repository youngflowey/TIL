2019-11-01

##### dplyr #####

### data frame 제어 ###

## 실제로 data frame을 handling 할때는 plyr을 개량한 dplyr을 이용
## dplyr은 c++로 구현되었기 때문에 속도가 빠르다
## dplyr은 코딩시 chaining을 사용할 수 있다

var1 <- c(1,2,3,4,5)
var2 <- var1 * 2
var3 <- var2 + 5
# 이렇게 중간 변수를 만들지 않을 수 있다
# var1 <- c(1,2,3,4,5) >> *2 >> +5

install.packages("dplyr")
library(dplyr)



# dplyr의 주요함수들

# fileServer : \\M1604INS
install.packages("xlsx")
library(xlsx)
excel <- read.xlsx(file.choose(),
          sheetIndex = 1,
          encoding = "UTF-8")
excel
str(excel)
# 1. tbl_df() :  현재 console크기에 맞추어서 data frame을추출하라는 함수
#   table
head(iris)
tbl_df(iris)
# 현재 콘솔창에 맞추어 보일 수 있는 만큼만 보여줌

# 2. rename()
#    rename(data frame,
#           바꿀컬럼명1 = 이전컬럼명1,
#           바꿀컬럼명2 = 이전컬럼명2,...)
# column명을 수정한 새로운 data frame이 리턴

# 공유파일에 파일공유
# 제공된 excel을 읽어들여서 data frame을 생성한 후 column명을 보니
# AMT17 : 2017년도 이용금액
# Y17_CNT : 2017년도 이용횟수
df <- rename(excel,
             CNT17 = Y17_CNT,
             CNT16 = Y16_CNT)
df

### data frame의 컬럼명을 바꿀 수 있다 ###

# 3. 하나의 data frame에서 하나 이상의 조건을 이용해서 데이터를 추출하려면 어떻게 해야할까?
# filter(data frame,
#        조건1, 조건2, ....)
excel
filter(excel,
       SEX == "M",
       AREA == "서울")
filter(excel,
       SEX == "M" & AREA == "서울")
# 내가 원한 행만 추출 가능

## 지역이 서울 혹은 경기인 남성들 중 40살 이상의 사람들의 정보를 출력하라
filter(excel,
       AREA == "서울" | AREA == "경기",
       SEX == "M",
       AGE >= 40)

filter(excel,
       AREA %in% c("서울","경기","제주"),
       SEX == "M",
       AGE >= 40)

# 4. arrange(data frame,
#            column1, desc(column2), ... )
# 배열, 정렬하다
# 정렬의 기준은 오름차순 정렬 (작은게 위에 나오는 것)
# 만약 내림차순으로 정렬하려면 desc()


## 서울살고 남자, 2017년도 처리금액이 400,000원 이상인 사람을 나이가 많은 순으로 출력
df = filter(excel,
            AREA == "서울",
            SEX == "M",
            AMT17 >= 400000)
df
arrange(df,
        desc(AGE))

## chaning
df <- filter(excel,
             AREA == "서울",
             SEX == "M",
             AMT17 >= 400000) %>%
      arrange(desc(AGE))
df

# dplyr은 chaning이 가능!
# %>% : chaning 기호

# 5. select(data frame, column1, column2...) 
# 추출하길 원하는 column을 지정해서 해당 column만 추출할 수 있다

## 서울살고 남자, 2017년도 처리금액이 400,000원 이상인 사람을 나이가 많은 순으로 ID와 나이, 그리고 2017년도 처리 건수만 출력 (chaining 포함)
df <- filter(excel,
             AREA == "서울",
             SEX == "M",
             AMT17 >= 400000) %>%
  arrange(desc(AGE)) %>%
  select("ID", "AGE","Y17_CNT")
df

# 범위
df <- filter(excel,
             AREA == "서울",
             SEX == "M",
             AMT17 >= 400000) %>%
  arrange(desc(AGE)) %>%
  select("ID":"AGE","Y17_CNT")
df


# 성별빼고 다 출력
df <- filter(excel,
             AREA == "서울",
             SEX == "M",
             AMT17 >= 400000) %>%
  arrange(desc(AGE)) %>%
  select(-"SEX")
df

# 6. 새로운 column을 생성할 수 있다
excel
excel$GRADE = "VIP"
excel$GRADE = ifelse(excel$AMT17 >= 500000,
                     "VIP",
                     "NORMAL")
# ifelse(조건,T이면 이것 선택, 아니면 이것 선택)
excel
View(excel)

# dplyr은 새로운 column을 생성하기 위해 함수를 제공
# mutate(data frame,
#        컬럼명1 = 수식1,
#        컬럼명2 =  수식2)

# 경기사는 여자를 기준으로 2017년도 처리금액을 이용하여 처리금액의 10%를 가산한 값으로 새로운 컬럼 AMT17_REAL을 만들고 AMT17_REAL이 45만원 이상인 경우 VIP 컬럼을 만들어서 TRUE, 그렇지 않으면 FALSE를 입력하세요


excel$AMT17_REAL = excel$AMT17*(1.1)
excel$VIP = ifelse(excel$AMT17_REAL >= 450000,
                     "TRUE",
                     "FALSE")
df <- filter(excel,
             AREA == "경기",
             SEX == "F")
df

# sol)
df <- filter(excel,
             AREA == "경기" & SEX == "F") %>%
      mutate(AMT17_REAL = AMT17 * 0.1 + AMT17,
             VIP = ifelse(AMT17_REAL>=450000,
                          TRUE,FALSE))
df
# 함수에 값을 넣을때는 <- (x), = (o) 로 사용함


# 7. group_by() & summarise(): grouping
df <- filter(excel,
             AREA == "서울" & AGE > 30) %>%
      group_by(SEX) %>%
      summarise(sum = sum(AMT17))
df
# 남자 여자에게 대해서 column 두개 만들거야

# 8. plyr package의 join 함수가 각 기능별로 독립적인 함수로 제공된다
# > left_join()
# > right_join()
# > inner_join()
# > full_join()


# 9. bind_rows(df1, df2)
# 주의할 점은 컬럼명이 같아야 우리가 생각하는 것처럼 data frame이 결합
# 컬럼명이 같지 않으면 컬럼을 생성해서 결합이 된다

df1 <- data.frame(x=c("a","b","c"))
df1
df2 <- data.frame(x=c("d","e","f"))
df2
bind_rows(df1,df2)

df1 <- data.frame(x=c("a","b","c"))
df1
df2 <- data.frame(y=c("d","e","f"))
df2
bind_rows(df1,df2)
# 매칭되는 값이 없으면 NA로 표기됨


#######################################################











