2019-10-23

# 6개의 자료구조에 대해서 알아보았다
# 배운내용을 복습하기 위해서 간단한 연습문제를 풀어보아요

# 1. 4,6,5,7,10,9,4 데이터를 이용해서 숫자형 vector x 를 생성해봐라
x <- c(4,6,5,7,10,9,4); x

# 2. 아래의 두 벡터의 연산 결과는?
x1 = c(3,5,6,8)
x2 = c(3,3,4)

x1+x2
# 6  8 10 11
# recycling rule

# 3. data frame을 이용하여 다음의 결과를 도출하라
Age <- c(22,25,18,20)
Name <- c("James","Mathew","Olivia","Stella")
Gender <- c("M","M","F","F")

## 출력형태

##   Age    Name    Gender
## 1  22   James      M
## 2  25   Mathew     M
# data frame의 형태
# 일부만 출력
df = data.frame(age=Age,
                name=Name,
                gender=Gender)
df
df[1:2,]
df=data.frame(Age,Name,Gender)
df
df[1:2,]
subset(df, Gender == "M")
subset(df, Gender != "F")
subset(df, Age >= 22)

# 4. 아래의 구문을 실행한 결과는?
x<- c(1,2,3,4,5)
(x*x)[!is.na(x) & x >2]  # 9 16 25
#(T T T T T) & (F F T T T)
# (백터연산)[각각의 요소에 대해서 na가 아니야?]
# 각자 위치에서 곱하기, 
# (1 4 9 16 25)[(F F T T T)]   # fancy indexing
#  이 벡터에     indexing 하는것
# 원본벡터와 분리된 logical type = fancy indexing
# 사이즈가 똑같은 벡터가 들어와야하고 그대로 mapping 시킴, T부분만 남기고 다 날라감

# 5. 다음의 계산 결과는?
x <- c(2,4,6,8)
y <- c(T,T,F,T)
sum(x[y])
# 같은 사이즈의벡터가 logical type으로

# 6. 제공된 vector에서 결측치(NA)의 개수를 구하는 코드를 작성해라
var1 <- c(34,55,89,45,NA,22,12,NA,99,NA,100)
sum(is.na(var1))
# 이 데이터에 결측치가 몇개 있는지
# 결측치를 제외한 평균을 구하시오
mean(var1, na.rm=T)
mean(var1[!is.na(var1)])

# 7. 두 개의 벡터를 결합하려한다
x1 <- c(1,2,3)
x2 <- c(4,5,6)
c(x1,x2)
# c =  combine
# 벡터는 중첩구조 X , list 중첩구조
# vector를 결합해서 matrix를 만들어보자
rbind(x1,x2)
cbind(x1,x2)
# 두개의 벡터 열을 세운다

# 8. 다음 코드의 실행 결과는?
x = c("Blue",10, TRUE, 20)
is.character(x)     # TRUE
