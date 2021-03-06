2019-12-02

## 1.
## R은 통계계산을 위한 프로그래밍 언어이자 데이터분석 소프트웨어!

# R로 할 수 있는 일
# 기초 통계분석, 머신러닝 모델링, 텍스트 마이닝
# 일반적인 프로그램(웹 프로그램, App 등)은 적합하지 않아, 제한되어있어



## 2. R의 장점
# - 무료(open source)
# - 생태계가 잘 구성되어 있어요! 
#   (굉장히 많은 package가 존재하고 개발되고 있어요)
# - 프로그래밍 방식으로 데이터 분석이 가능



## 3. R을 이용해서 빅데이터를 분석
# 빅데이터를 정의
# - Volume : 데이터의 크기가 굉장히 커요! 
# - Variety : 데이터의 종류가 굉장히 다양
# - Velocity : 데이터의 발생 속도



## 4. Rstudio를 설치해서 실습진행



## 5. R코드를 작성할 때 기본적으로 알아두어야 할 사항
# 주석은 : #으로 표현해요!
# 문장의 끝은 ;을 이용해요
var1 = 10; var2 = 20
# 한 라인에 statement가 2개 이상일때 주로 이용함
# R은 대소문자를 구별한다 
# (구별하지 않은 것 : sql)



## 6. Operator (연산자)
# 대부분의 연산자는 다른 프로그래밍 언어와 동일하게 사용되는데
# 몫을 구하기 위한 연산자 : %/%
# 나머지를 구하기 위한 연산자 : %%
# 논리연산 기호는 다른 언어와 동일하나
# TRUE(T), FALSE(F) 논리값은 다르게 표현되요!
# 할당 연산자 => "=" (assignment)
#                "<- , ->" 기호를 이용해서 할당연산을 수행
var1 = 100
var1 <- 100
100 -> var1
# &. |, &&, ||  (논리연산기호)
# TRUE & TRUE, TRUE | FALSE 
# 한개짜리랑 두개짜리는 scalar연산에서는 차이가 없어요!
# TRUE & FALSE, TRUE && FALSE
# Vector연산에서는 이 두개가 차이가 있어요!
# 한개짜리는 벡터라이즈연산
# 두개짜리는 Vector의 맨 처음 1개만 & 연산을 해요!



## 7. Data Type & Data Structure
# R의 Data Type
# 4가지 종휴
# 수치형(Numeric), 문자형(character), 논리형(logical), 복소수형(complex)
# 특수한 형태의 데이터 타입도 있어요!
# NA : Not Available => 결측치
# NaN : Not Available Number => 숫자이지만 수학적으로 불가능한 수치
# NULL : 값이 존재하지 않음을 나타내는 객체
# Inf : 무한대
# 데이터 타입의 우선순위(예쁜표현은 아니예요!)
# 여러데이터 타입을 캐스팅(데이터타입을 변경)할때 상위 데이터 타입으로 변경되요!
# logical > Numeric > complex > character



## 8. R에는 package가 존재
# R언어가 가지고 있는 기능외에 외부 보드모듈(package)을 이용하면 더 쉽게 
# 더 많은 기능을 사용할 수 있어요!
# package를 설치하고 사용하기 위해서는
# install.packages("패키지명")
# library(), require() : 설치한 패키지를 메모리에 로딩



## 9. R의 작업공간(workspace)
# 어떻게 설정하고 사용하는지만 알아두어요!



## 10. Data Structure
# 자료구조 : 변수에 저장된 데이터의 메모리 구조를
#            지칭하는 용어
# 변수의 자료구조를 알아내기 위해 사용하는 함수
# class()

# 같은 데이터 타입을 사용하는 자료구조
# Vector(1차원)
# - 선형자료구조, 같은 데이터 타입을 이용
#   첨자방식을 이용 => []
#   첨자의 시작은 => 1부터 시작
# - vector생성 방식
#   c() : 개별요소를 이용해서 vector를 생성
        c(1,2,3,4)
#   : => 수치형에만 적용가능
        1:100
#   seq() : ":"의 일반형
#   rep() : vector를 반복해서 만들 수 있어요
        var1 = rep(1:3,2)
        var1
        var1 = rep(1:3,each = 2)
        var1 = rep(1:3,times = 2) # default
        
# - vector를 생성한 후 vector의 길이를 알고 싶어요!
#      => length()
# - vector나 data frame의 이름을 설정하거나 알아낼 수 있어요
#      => names()
# - vector 연산방식에 대해서 알아둬야 해요!
#   recycling rule에 대해서 알아둬야 해요!
        var1 = 1:3
        var2 = 5:7
        var1 + var2
# - vector는 집합연산을 지원
#      => union(), intersect(), setdiff()
        
# Matrix(2차원)
# 2차원 형태의 자료구조, 같은 데이터 타입을 이용
var1 = matrix(c(1:5))     # 열 기준으로 해서 데이터를 행으로 늘어뜨림
                          # 5행 1열짜리 2차원 matrix
var1
# 열 기준. (행이 증가하면서 matrix가 생성)
var1 = matrix(c(1:10), nrow = 2, byrow = T)   # 행단위로 데이터 채워짐
var1[1,]
        
# Array(3차원)
# 이런게 있어~~~


# 다른 데이터 타입을 사용할 수 있는 자료구조
# list(1차원) 
# 중첩자료구조를 만들 수 있어요!
# key와 value로 쌍으로 이루어져 있어요!
# dict와 같은 구조
# python은 순서가 없어 but, R 순서개념을 가지고 있어요
# [[]] (key), [] (value) 형태로 사용이 되요!
# list에서 key를 표현할 때 "$"를 이용할 수 있어요!


# data frame(2차원)
# 2차원 형태의 자료구조, list와 vector를 혼합한 자료구조
# 일반적으로 가장 많이 사용되요!
# data frame의 column을 표현할 때 $기호를 이용해요
# dtat frame의 기본함수들
# str() : data frame의 기본구조를 알 수 있어요!
# summary() : data frame에 대한 기본 통계자료를 알 수 있어요!
# apply() : data frame에 대해서 특정함수를 호출
# subset() : data frame의 부분집합을 구할 때 사용

# 범주형 데이터 구조도 있어요 => factor



## 11. 문자열처리
# stringr package를 이용해서 처리
# 어딘가에 예쁘게 정리해놓고 문자열처리가 필요하면 참조해서 사용하면 되요
# 정규표현식에 대한 내용도 나왔어요!!



## 12. 데이터 입출력
# 파일로부터 데이터를 읽어들여요!
# txt(csv), xlsx, Open AIP이용한 JSON
# Open API 사용하기 위해서 여러가지  selcector AJAX처리에 대한 내용도 나왔구요
# 셀리니움을 이용한 crawling 처리



## 13. Crawaling & Scraping
# Web crawling(Web Spidering) : 규칙에 따라 특정 웹페이지를 반복적으로 browsing하는 행위
# Web Scraping : 원하는 부분을 selector나 xpath를 이용해서 데이터를 얻어올 수 있어요



## 14. 데이터 조작
# data frame을 생성한 후 사용하는 함수
# class() : 자료구조를 파악하기 위한 함수
# head() : 데이터의 앞 부분을 보기 위한 함수
# tail() : 데이터의 뒷 부분을 보기 위한 함수
# View() : view창으로 데이터를 확인
# dim() : data frame의 행과 열을 구하는 함수 
#         선형자료구조에서는 사용할 수 없어요
# nrow(), ncol()  : 행의 개수, 열의 개수
#                선형자료구조에서는 사용할 수 없어요!
# str()
# summary()
# ls() : data frame의 column을 vector로 출력


## 15. 시각화
# ggplot2 package를 이용해서 시각화를 많이 해요!
# 기본적인 그래프에 대해서 알아보아요!
# 데이터를 x축과 y축에 점으로 표현하는 방식으로 

# 연속데이터를 이용해서 두 변수의 관계를 표현하기 적합한 형태의 그래프는
#  => 산점도 (scatter)

# 일반적으로 집단간의 차이를 그래프로 표현하기에 적합한 형태는 => 막대그래프(barplot)

# 일반적으로 시계열 데이터를 표현하기에 적합한 형태는 => 선그래프(lineplot)

# boxplot => 데이터의 분포를 표현하기에 적합한 형태. 
#            이상치를 쉽게 파악할 수 있어요

# ggplot2를 이용해서 실제 그래프를 이쁘게 그려보아요
# ggplot()을 이용해서 x축과 y축을 설정
# aes()를 이용해서 축을 설정

# 축을 설정한 후 실제 그래프를 그리게 되는데
# 다른 함수를 이용해서 처리 => "+"기호를 이용해서
# 마치 chaining처럼 사용



## 16. 기본통계함수
# 평균(eman), 최대(max), 최소(min), 분산(var), 표준편차(sd)
# 사분위, 중간값(median)



## 17. NLP(Natural Language Process : 자연어처리 )
# KoNLP를 이용해서 한글 형태소 분석처리를 해보았어요
# KoNLP : R에서 한글 형태소를 분석을 할 수 있는 유일한 package, 3가지 사전을 
#         들고 있어요! 외부 package이고 설치 후 사용하셔야 해요!
#         Java 기능을 이용하기 때문에 JDK를 설치해야 해요!



## 18. 결측치와 이상치 처리
# is.na() : NA를 파악하기 위해서 사용하는 함수
# 이상치 중에 극단치 : 존재할 수 있는 값이기는 하지만 정상 범주에서
#                      많이 벗어나 있는 데이터
# boxplot을 이용하면 극단치를 쉽게 찾아낼 수 있어요!



# 기본코드들만 살짝 곁들여서 한번 review를 해 보아요!

## 3가지 수행평가 제출
# 1. 로튼토마토
# 2. mpg
# 3. 한국복지패널 데이터

# 각 문제에 대한 결과 화면 capture가 있어야 해요

# 하나의 파일로 작성해야 해요!
















