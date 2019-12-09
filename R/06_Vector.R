2019-10-22

# Data Type : 저장된 데이터의 성격(numeric, character, logical)
# Data Structure : 변수에 저장된 데이터의 메모리 구조(자료구조)

# R이 제공하는 자료구조
# 6개 기억하면 된다
# 2개의 분류로 나누어진다
# 같은 데이터 타입인가 아닌가
# vector : 1차원, 같은 data type
# matrix : 2차원, 같은 data type
# array : 3차원, 같은 data type  (4차원 이상넘어가는 array는 거의사용하지 않음)

# list : 1차원, 다른 data type # 중첩 자료구조
# Data Frame : 2차원, 다른 data type
# Factor : 범주형 자료구조

##########################################################################333

# vector
# vector는 scalar의 확장, 1차원 선형구조
# vector는 같은 data type으로 구성됨
# vector는 첨자형태로 accss가 가능: ([])()
# 일반적으로 첨자(index)의 시작은 0이지만 R은 1부터 시작

# vector생성하는방법


# 1.  c() : combine 함수를 사용해서 생성!
# 일반적으로 규칙성이 없는 데이터를 이용해서 vector를생성할때 이용

var1=c(1,2,6,9,10)
var1
mode(var1)
var2 = c(TRUE,FALSE,TRUE)
var2
var3 = c("홍길동","김길동","최길동")
var3
var4= c(200,TRUE,"아우성")
var4
# combine 함수를 이용해서 vector로 다른 vector를 만들 수 있음
var5= c(var1,var2) # 1 2 6 9 10 1 0 1
                   # vector의 결합
#################################################################

# 2. : 을 이용해서 vector 생성할 수 있다
#      numeric에서만 사용가능하고 1씩 증가하거나 감소하는 숫자의 집합을 vector로 만들때 사용
#      start:end 형태로 사용되고 둘 다 inclusive
var1 = 1:5; var1
var2 = 5:1; var2
var3 = 3.4:10;var3

# 3. seq()를 이용해서 vector를 생성할 수 있다.
#    : 의 일반형으로 동자수열을 생성해서 ector롸 시킬때 사용
var1 = seq(from=1,to=10,by=3)  # 속성은 생략이가능
var1

#4. rep()를 이용해서 vector를 생성할 수 있다
   # replicate의 약자
   # 지정된 숫자만큼  반복해서 vector를생성
# rep(숫자 지정, times = 반복 횟수)
# rep(숫자 지정, each = 반복 횟수)
var1 = rep(1:3,times = 3)   # times는 생략이 가능
var1                # 123123123
var2 = rep(1:3,each = 3)   # each 속성 생략 불가능
                  # 111222333


#################################################


# vector의 data type확인

mode(var1)      # numeric

# vector 안의 데이터의 갯수 확인(크기)
# lignth()함수로 데이터 크기(길이) 확인
var1 = c(1:10)
var1
length(var1)    # 10

# length를 다른 의미로 사용 가능
var1 = seq(1,100,by=3);var1
# 이때, by 대신에 length 사용 가능
var1 = seq(1,100,length=3);var1  # 1 50.5 100
# length가 데이터 크기를 의미하기에, 범위 내에서 그 크기로 vector 생성
# 구간 나눌 때 응용 가능
var1 = seq(1,100,length=7);var1




############$$$$

# vector에서 데이터 추출


# 두가지 방식 존재
# index 이용
# name 이용

# 1. index

# vector의 사용은 []를 이용해서 데이터 추출
# index의 시작은 0이 아닌 1인 점!
var1 = c(67,90,87,50,100)

# vector의 제일 처음 원소를 추출
var1[1]  

# vector의 제일 마지막 원소를 추출
var1[length(var1)] 

var1[2:4]  # vector를 만들기위해서 사용한 :, c(), seq(),rep()를 vector요소를 access하기위한 용도로 사용할 수 있다
var1[c(1,5)]
var1[seq(1,4)]
var1[6]   # NA : 결측치 없음
# JAVA, C에서는 error
# Python에서는 역
var1[-1]  # "-"는 제외의 의미
          # 1번째를 제외한 역을 지칭
var1[-c(1:3)]  # 50 100


# 2. name

# vector 데이터의 이름
# name() : 해당 데이터에 이름이 있는지를 확인/지칭하는 함수
var1 = c(67,90,50)

names(var1)  # 데이터에 이름이 붙어 있는가
             # NULL : 각 데이터에 붙은 이름은 없다
# 이름설정(의미론적)
names(var1) = c("국어","영어","수학") # name 설정

var1

var1[2]    # index를 이용해서 vector데이터를 추출
var1["영어"]  # 영어에 해당하는 값 도출됨
              # name을 통해서 vector데이터를 추출


##########################################################

# vector의 연산


# 수치형 vector는 scalar를 이용하여 사칙연산을 할 수 있다, 그리고 vector와 vector간의 연산도 수행할 수 있다
var1 <- 1:3  # 1 2 3
var2 <- 4:6  # 4 5 6 
var; var2


# 1. vector와 scalar의 연산

var1 * 2     #2 4 6 
var1+10      # 11 12 13

var1 + var2  #5 7 9 

var3 = 5:10  # 5 6 7 8 9 10

# 2. 크기가 다른 vector의 연산
# warning되지만 계산은 됨
# recycling rule이 적용됨 (크기가 다른 vector도 계산 가능)

var1 + var3   # 1 2 3 1 2 3      # recycling rule
              # 5 6 7 8 9 10
           # => 6 8 10 9 11 13

var4 = 5:9   # 5 6 7 8 9 
var1 + var4   # 1 2 3 1 2 3
              # 5 6 7 8 9  # 동작은 가능 . warning
           # => 6 8 10 9 11


# 3. vector간의 집한연산

# Union() : 합집밥
# inersect () : 교집합
# setdiff() : 차집합

var1 = c(1:5)
var2 = c(3:7)

union(var1, var2)   #  1 2 3 4 5 6 7
intersect(var1, var2)   # 3 4 5
setdiff(var1, var2)   # 1 2

##########################################################


# vector간의 비교(두 vector가 같은가 다른가 확인)

# 두 가지의 함수
# identical
# setequal

# identical : 비교하는 두 vector의 요소가 개수, 순서, 내용이 같아야지 TRUE를 Return
var1 = 1:3
var2 = 1:3
identical(var1,var2)  # T

var2 = c(1,3,2)
identical(var1, var2)  # F : 순서가 다르기 때문

var2 = c(1,2,3)
identical(var1,var2)  # F

# setequal : 비교하는 두 vector의 크기, 순서와 상관없이 내용만을 비교
var1 = 1:3
var2 = 1:3
var3 = c(1,3,2,1,1,1,3,3,4)
var4 = c(1,3,2)
var5 = c(1,2,3)
var1;var2;var3;var4;var5

identical(var1,var2) # 같은 vector이기 때문에 
identical(var1,var4) # 같은 vector가 아니다
identical(var1,var5)
setequal(var1,var3)  # vector의 내용이 같다
setequal(var1,var4)


# 요소가 없는 vector
# vector() 함수 활용 (기존의 vector아님 함수임)
# 함수 안에 원하는 조건 넣기
var1 = vector(mode="numeric",length=10)
var1 # [1] 0 0 0 0 0 0 0 0 0 0
var1 = vector(mode="character",length=10)
var1 # [1] "" "" "" "" "" "" "" "" "" ""





