
# 연습문제
# 로직분제를 풀어보아요

# 사용할 데이터 : 2 3 5 6 7 10

# 1. 주어진 데이터로 vector x를 생성하라
x <- c(2,3,5,6,7,10); x

# 2. 주어진 데이터 각각을 제곱해서 vector x를 생성하라
var1 = c(2,3,5,6,7,10)
var2 = c(2,3,5,6,7,10)
var1 * var2
x= c(2,3,5,6,7,10)^2
x

# 3. 주어진 데이터 각각을 제곱해서 합을 구하시오
sum(c(2,3,5,6,7,10)^2)

# 4. 5보다 큰 값들로 구성된 vector x를 구하라
if (x>5) {
  print(x)
}

var1 = c(2,3,5,6,7,10)>5   # mask : f는 가려지고 t만 남는다
var1
x = c(2,3,5,6,7,10)
x[var1]     # fancy indexing

# 5. vector x 의 길이를 구하세요
length(x)

# 6. R의 package(외부)중에 UsingR 이 있다
install.packages("UsingR")
# 설치딘 package를 불러들인다
library(UsingR)
# 데이터를 불러들일 수 있다
data("primes")
primes
# 1부터2003까지 숫자 중 prime unbe 를 가지고있다
head(primes)   # 앞에서 6개만 출력
tail(primes)   # 뒤에서 6개만 출력

# 7. 1부터 2003부터 숫자에 prime number은 몇개인가요?
length(primes)     # 총 304개

# 8. 1부터 200까지 숫자 중 Prime number 는 몇개인가요?
sum(primes<200)

# 9. 평균을 구하시오
mean(primes)

# 10. 500이상 1000이하의 prime number안으로 구성된 vector p를 구하시오
# fancy indexing을 이용해 보자
p=primes[500<=primes & 1000 >=primes]
p

# 다음과 같은형태의 데이터를 이용하여 아래의 문제를 풀어보자
# 1 5 9
# 2 6 10
# 3 7 11
# 4 8 12

# 11. 위의 데이터를 이용해서 matrix x 를 생성하시오
x = matrix(c(1:12), nrow=4)
x = matrix(seq(1,12),
           nrow = 4,
           byrow = F    # 기본값
           )
x

# 12. 전치행렬을 만들어보자
t(x)
# java같은 경우 이중폼을 돌려야해

# 13. matrix x에 대해 첫번째 행만 추출하세요
x[1,]

# 14. matrix x에 대해 6,7,10,11을 matrix형태로 추출하라
x[c(2,3),c(2,3)]
x[2:3,-1]

# 15. matrix x에 대해 x의 두번째 열의 원소가 홀수인 행들만 뽑아서 matrix p를 생성하시오
e = x[,2]
p = matrix(e[e%%2==1])
p

# sol
p = x[x[,2]%%2 == 1,]
p

## 프로그래밍
## 홀수개의 숫자로 구성된 숫자문자열이 입력으로 제공된다. 문자열의 개수는 7개 이상 11개 이하로 제한된다. 
## 입력 문자열의 길이는 7개, 9개, 11개

## 중앙 숫자를 기준으로 앞과 뒤의 숫자를 분리한 후 분리된 두 수를 거꾸로 뒤집어서 두 수의 차를 구한다

## 예) 7648623
##     764 623   가운데를 기준으로 나눈다
##     467 326   각 숫자를 거꾸로 뒤집는다
##     141       (467-326) 두 수의 차

## 예) 7648620   끝에가 0인 경우
##     764 620   가운데를 기준으로 나눈다
##     467 026   각 숫자를 거꾸로 뒤집는다
##     441       (467-26) 두 수의 차


input = "7648623"


# sol)

library(stringr)
input = "7648623"
mid_input=(str_length(input) %/% 2) + 1
var1 = str_sub(input,
               1,
               mid_input-1)
var2 = str_sub(input,
               mid_input+1,
               str_length(input))
abs(
  as.integer(paste(rev(str_split(var1,pattern = "")[[1]]),collapse = ""))
  -
    as.integer(paste(rev(str_split(var2,pattern = "")[[1]]),collapse = ""))
) 



##############################################

# 기본적인 R 사용
# Data type (자료형)
# Data Structure (자료구조)
# Control Statement (제어문)
  
  
  
  
  
  ##################
as.vector(input)
a=strsplit(input,8)
a
help(strsplit)
as.vector(a)
unlist(a)
class(a)
a[[1]]



split(input,8)


a=strsplit(input,8)




df = data.frame(a[1] = q,
                a[2] = name,
                s_age = age)

class(a)

a[1]



split(input,8, drop=T)
split
a=input[input]
        
a
input[1:3]

stringsAsFactor
input(stringsAsFactors = F)
stringsAsFactors

a=data.frame(b=input,stringsAsFactors = F)
a
b
a
as.character(input)

split(input,8)
strsplit(input,8)

# sol)
library(stringr)
input = "7648623"
mid_input = 