2019-10-22

# R은 통계계산을 위한 프로그래밍 언어이자 소프트웨어
# 통계학과 교수인 로스 이하카와 로버트 젠틀맨 두사람이 일반사람들도 쉽게 통계를 할 수 있도록 Bell연구소에서 사용하던 S라는 통계프로그램을 모태로 1993년에 만들었다.
# R의 장점 : 무료 => 많은 사람들이 사용 => 여러가지 라이브러리들이 지속적으로 추가되면서 점점 발전한다. => 오픈소스 생태계가 잘 유지된다.
# R & Python 
# R 다운로드, RStudio
# R 프로그램의 기본
# 주석 : #
# statement의 종료 : ; (생략가능)
# R은 대소문자를 구별 : case-sensitive
# 변수이름을 지을 때 : camelcase notation
#                      underscore

myVar = 100
myVar <- 100
100 -> myVar

myVar
print(myVar)
cat("변수의 값은 :",myVar)
var1 = seq(1,100,3)
var1

######################################################################

# 연산자에 대해서 알아보자
# operartor
var1 = 100
var2 = 3
result <- var1/var2
result

options(digits = 5)
result
sprintf("%.7f",var1/var2) # 소수점 7자리를 실수로 표현하겠다
sprintf("%.9f",var1/var2)
# 기본값은 7

var1 %/% var2   # 33
var1 %% var2    # 1

# 비교연산자
var1 == var2    # FALSE(F)
var1 != var2    # TRUE(T)

# & , | (and연산과 or연산)
## &&, || (vector에 대한 연산 수행시 첫 번째 요소만을 비교)

#######################################################################

# Data Type
# 기본데이터 타입
# numeric, character("",''), logical, complex
# NULL, NA(결측치), NaN, Inf

# R이 제공하는 기본함수중에 데이터 타입을 알아보는 함수 => mode()
var1 = "이것은 소리없는 아우성!!"
mode(var1)

# is계열의 함수 => is.character()
is.character(var1)
is.null()
is.na()

# R의 데이터타입은 우선순위가 존재
# character > complex > numeric > logical

# R은 하나의 데이터타입을 다른데이터 타입으로 바꿀 수 있다.
# as계열의 함수를 제공해준다
var1 = "3.141592"
as.double(var1)

var2 = TRUE
as.numeric(var2)
var3 = 100
as.logical(var3)













