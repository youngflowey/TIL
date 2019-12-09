2019-10-21

# R의 Data Type
# 
# R에는 Data Type이 크게 2가지가 존재
# - 기본 데이터 타입
# - 특수 데이터 타입

# 기본 데이터 타입
# 1. 숫자형(numeric) : 숫자로 되어 있고 정수형과 실수형을 의미.
# "L" 기호에 따라 정수 실수로 나눔
100L # L을 붙여줌 ->정수형 숫자 100
# 2. 문자열(character) : 하나 혹은 둘 이상의 문자의 집합
"홍길동"   # 문자열
'최길동'   # 문자열
'홍'       # 문자열
# 3. 논리형(logical) : TRUE(T), FALSE(F)
# 4. 복소수형(complex) : 4-3i

# 특수 데이터 타입
# 1. NULL : 객체가 존재하지 않음을 지칭하는 객체
var1 = NULL  # 변수가 존재하지만 안에 값이 없다
# 2. NA : Not Available (유효하지 않다 => 결측치를 표현할 때 사용)
# 3. NaN : Not Available Number, Not a Number
# 숫자긴 숫잔데 연산이 불가능한 숫자 
sprt(-3)
# 4. Inf : 양의 무한대 
# 5. -Inf : 음의 무한대

########################################################
var1 = 100
var2 = 100L
var3 = "Hello"
var4 = TRUE
var5 = 4-3i
var6 = NULL
var7 = sqrt(-3)

# 데이터 타입을 조사하기 위해 제공된 함수는 mode()
# 데이터 타입을 문자 형태로 보여줌
mode(var1)  # numeric
mode(var2)  # numeric
mode(var3)  # character
mode(var4)  # logical
mode(var5)  # complex
mode(var6)  # NULL
mode(var7)  # numeric

# is계열의 함수가 제공된다
# 이거 ~맞아?
is.numeric(var1)    # TRUE
is.numeric(var2)    # TRUE
is.character(var3)  # TRUE
is.integer(var1)    # 이거 정수니 FALSE
is.integer(var2)    # TRUE
is.null(var6)
# 자동완성 기능 있어서 편리함
# is 계열의 함수가 더 있다

# data type의 우선순위
# 기본 데이터 타입 4개에 대해서 우선순위가 가장 높은 것은"character"
# 그 다음은 복소수 "complex"
# 그 다음은 숫자형 "numeric"
# 가장 우선순위가 낮은 것은 "logical"

myVector = c(TRUE,10,30)  # numeric
myVector
# T=1,F=0
myVector = c(TRUE,10,30,"Hello") # character
myVector

# 데이터 타입을 다른 데이터타입으로 바꿀 수 있다. (type casting)
var1 <- 3.14159265358979
var2 <- 0
var3 <- "3.1415"
var4 <- "Hello"

# 데이터 타입을 변경할 때는 as계열의 함수를 이용
as.character(var1)
as.integer(var1)      # 3
as.logical(var2)      # FALSE (0을 제외한 모든것 TRUE)
