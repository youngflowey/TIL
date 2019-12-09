2019-10-23

# 파일로부터 데이터를 읽어보자

# 1. text파일
# "," 로 구분된 데이터들을 읽어보자

# notepad++ 다운로드

# read.table()을 사용
getwd()
# C:/R-lecture/data
setwd(str_c(getwd(),"/data)"))

setwd("C:/R-lecture/data")
student_midterm=read.table("student_midterm.txt", sep=",")
# 에러남 : 유니코드가 아님
student_midterm=read.table("student_midterm.txt", sep=",", fileEncoding = "UTF-8")
# 유니코드 형태로 바꿔줌
student_midterm=read.table(file.choose(), sep=",", fileEncoding = "UTF-8")
# 파일 직접 찾아서 하게 할 수도 있음

student_midterm
class(student_midterm)
# > "data.frame"

student_midterm=read.table("student_midterm.txt", sep=",", fileEncoding = "UTF-8", header=T)
student_midterm

##<참고>##########################################################

var1 = c("홍길동")
# 값이 하나짜리 벡터
# scalar : r의 가장 기본적인 자료구조
var2 = c(10,20,30)


rm(list=ls())
# 환경창에 있는 객체들 삭제
# ls로 나온것을 list로 지워준다
# ls() : 환경창에 있는 객체들
# variable 지워줌

cat("\014")
# console clear
# 콘솔창을 지우고 싶다

############################################################


# 파일로부터 데이터를 읽어들일때
# 일반 txt 형식은 많이 사용되지 않는다

# 컴퓨터간에 데이터를 주고 받으려고 한다
# process간에 데이터 통신을 하기 위해서 특정 형식을 이용해 데이터를 주고 받는다
# 세가지 형태


# 1. CSV(Comma Seperated Value)
# ,로 구분된 값
# comma기호를 이용해서 데이터를 구분
# 해당 문자열을 전달해서 데이터 통신
# 예) "홍길동, 20, 서울, 김길동, 30, 부산, 최길동, 50, 인천..."
# 이렇게 표현하면 무슨장점이 있을까

# CSV 방식 장점 : 1. 간단하다. 
                # 2. 부가적인 데이터가 적다. 
                # 3. 상대적으로 크기가 작다.
                  # ==> 많은 양의 데이터를 처리할 수 있다.

# CSV 방식 단점 : 구조적데이터를 표현하기에적합하지 않다 
                    # ==> parsing작업이 복잡하다
                  # 유지보수에 문제가 발생한다
# parsing : 원래 상태로 복구


# 2. XML 방식
# CSV의 단점을 보완하기 위해 나온 것
# tag를 이용해서 데이터를 표현하는 방식
# 예) <name>홍길동</name><age>20</age><address>서울</address>...
# <phone>
#     <mobile>101-111-2212</mobile>
#     <home>02-334-2344</home>
# </phone>

# 장점 : 1. 구조적데이터를 표현하기에 적함
       # 2. 사용하기 편리
       # 3. 데이터의 의미를 표현할 수 있다
# 단점 : 부가적인 데이터가 너무 크다


# 3. JSON (JavaScript Object Notation)
# 자바스크립트 객체 표현
# 예)  { name : "홍길동", age : 20, address : 서울....}
# key값 : 실제 값
# 구조적 표현이 가능하면서 XML보다 크기가 작다
# 요즘 제일 많이 쓰이고 있음

# read.table() : sep가 있어야함
# read.csv() : sep가 "," 이기 때문에 생략
#            : header = T 가 기본
getwd()

df = read.csv(file.choose(),
              fileEncoding = "UTF-8")
df

# Excel 파일을 불러올 수 있다
# 확장 package를 이용해야 한다

# R을 설치하면.. => base system이설치된다고 표현한다
# base package, recommended package : 사용을 할때 library에서 불러와야함
# other package : 따로 깔아야하는 외부패키지

# xlsx package를 설치하고 로딩하자
install.packages("xlsx")
library(xlsx)
require(xlsx)

# JAVA_HOME 환경변수 설정
Sys.setenv(JAVA_HOME = "C:\\Program Files\\Java\\jre1.8.0_231")
# 자바 홈 환경변수를 설정

student_midterm <- read.xlsx(file.choose(),
                             sheetIndex = 1,
                             # 첫번째 시트에서 
                             encoding = "UTF-8")


student_midterm
summary(student_midterm)
# 결과형태를 class로
class(summary(student_midterm))
# table

#############################################################

# 처리된 결과를 file에 write하려 한다
# write.table() : data frame을 file에 저장
# cat() : 분석결과(vector), 일반적인 문자열을 file에 저장
# capture.output() : 분석결과(List, table)을 file에 저장

cat("처리된 결과는 :", "\n","\n",
    file = "C:/R-lecture/data/report.txt",
    append = T)
# 프로그래밍에서는 / 사용

write.table(student_midterm,
            file = "C:/R-lecture/data/report.txt",
            row.names = F, # 행번호 삭제
            quote = F,    # ""삭제
            append = T)
# 저데이터 파일을 파일에 추가해서

capture.output(summary(student_midterm),
               file = "C:/R-lecture/data/report.txt",
               append = T)


# write.xlxs()

df = data.frame(x=c(1:5),
                y=seq(1,10,2),
                z=c("a","b","c","d","e"),
                stringsAsFactors = F
                )
df

write.xlsx(df,"C:/R-lecture/data/report.xlsx")














