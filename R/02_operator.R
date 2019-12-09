2019-10-21

# Operarator( 연산자 )

var1 <- 100
var2 <- 3

var1 / var2 # java언어 => 33이 나오게 됨 (정수하고 정수를 나눴으니까)
            # R은 마치 실세계의 연산처럼 수행 (33.33333)

# 몫을 구해보아요 => 33
var1 %/% var2 # 33, 몫만 구하는 연산자
var1 %% var2 # 1, 나머지 구하는 연산자

# 비교연산자
var1 == var2 # FALSE (false X), F 논리값 false는 대문자 or F
var1 != var2 # TRUE
var1 > var2

# 논리연산자
# &, && : 양쪽 값이 TRue이면 TRUE
TRUE & TRUE
TRUE & FALSE
TRUE && FALSE
# 둘 다 논리 연산자 AND 연산
# | , || : 하나라도 TRUE이면 결과 TRUE
TRUE | FALSE # TRUE
FALSE || FALSE # FALSE

# 단일변수는 1개짜리 공간 
# R은 여러가지 자료구조가 있다
# 가장 대표적인 자료구조(데이터를 저장하는 구조)에는 vector가 있다.
# R에서 vector는 연속적인 저장공간
# 다른언어의 array와 같은 구조
# vector는 1차원 자료구조
# 저장공간안에 모두 같은 데이터 타입이 들어온다.
# 함수를 이용해서 vector를 생성
# c() => combine의 약자 결합하다
c(10,20,30) # 10 20 30 
c(TRUE, 20, 3.14) # TRUE : 논리값, 나머지 : 숫자
                  # datatype이 다르면 정해져있는 우선순위에 따라서 데이터가 바뀌게 된다 (데이터를 일치시키기 위해서)
                  # 같은 데이터 타입으로 vector생성(오류가 아니다)
c(TRUE,FALSE) & c(TRUE,TRUE) # 두개의 논리값을 가진 벡터를 만든다
                            # 벡터중에 원소가 하나인 벡터 -> scalar  
                            # 앞에거 따로(T,T) 뒤에거 따로(F,T)
                            # 결과를 다시 벡터 형태로
                        # vector 연산 결과값 vector
c(TRUE,FALSE) && c(TRUE,TRUE)
# vector 연산과 스칼라 연산이랑 차이가 있다
# 첫번째 요소만 & 연산 수행

c(TRUE,F,TRUE) & c(FALSE,T)
# 3가지 논리값   2가지 논리값
# 계산 안됨

!c(T,F,T,F)
# ! -> not, 역으로 바꾸는 것
# 기본적인 자료구조 = vector
# 기본적인 자료 프레임 = dataframe?



# 다른언어와 마찬가지로 다양한 수학함수를 내장하고 있다
# 필요할 때 찾아서 사용해 보자
abs(-3) # abs : 절댓값
round(3.1415) # round : 반올림
# 다는 외울 수 없어. 필요할 때 찾아서 쓰면 돼
sqrt(100)


















