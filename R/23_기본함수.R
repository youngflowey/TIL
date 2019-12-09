# 데이터 분석업무에서
# raw data를 얻은 다음
# 머신러닝 모델링을 위해서 또는 시각화를 위해서
# 이 raw data를 적절한 형태로 변형
# 데이터 변환, 필터링, 전처리 작업이 필요

# 이런 작업(데이터 조작)에 특화된 package들이 존재
# plyr => pliyer + R => 패키지를 구현한 언어 R
# dplyr => data frame + pliyer + R => 데이터 프래임을 r언어로 조작하는 방법
#       => 데이터 프레임 제어할때 이 언어 많이 씀
#       => 디플라이알
# vector나 data frame에 적용할 수 있는 기본 함수
# 기본자료구조 : data frame을 이용

# 실습할 데이터가 필요해
# iris(아이리스) : 북꽃
# 따로 설치 하지 않아도 이미 들어가 있음

iris
View(iris)
# iris : 북꽃의 종류와 크기에 대해 측정한 데이터
#      : data frame
# 통계학자 피셔라는 사람이 측정해서 제공
# 컬럼
help(iris)
ls(iris)
# Species : 종(3가지)
# Sepal.Length : 꽃받침의 길이
# Sepal.Width : 꽃받침의 너비
# Petal.Length : 꽃잎의 길이
# Petal.Width : 꽃잎의 너비


# 기본함수
# 1. head() : 데이터 셋의 앞에서부터 6개의 데이터를 추출한다
#           : 데이터 프레임이 아닌경우도 적용된다
head(iris)
var1 = c(1,2,3,4,5,6,7,8)
head(var1)
help(head)
head(iris,n=3)  # n의 기본값은 6
# document 이용해서 예제같은것도 보고 이용하기

# 2. tail() : 데이터 셋의 뒤에서부터 6개의 데이터를 추출한다
#           : 데이터 프레임이 아닌경우도 적용된다
tail(iris,n=3)

# 3. View() : View창에 데이터를 출력
#           : 데이터 확인 용도
View(iris)

# 4. dim() : data frame에 적용할 때 행과 열의 개수를 알려준다
dim(iris)
#          : 선형자료 구조 (vector, list) 에서는 사용할 수 없음
var1 = c(1,2,3,4,5)
dim(var1)

# 5. nrow() : data frame의 행의 개수
#             n=number, row=행
nrow(iris)
          # 150 record, 150 observation, 150 행

# 6. ncol() : data frame의 열의 개수
ncol(iris)
          # 5개의 변수, 5개의 열 

# 7. str() : data frame의 일반적인 정보를 추출
str(iris)

# 8. summary() : data frame의요약 통계량으 보여준다
summary(iris)
          # Min, Max, 사분위, 평균(mean), 중간값(Median)

# 9. ls() : data frame의 column명을 vector로 추출
#         : 오름차순으로 정렬
ls(iris)

# 10. rev() : 선형자료구조 데이터의 순서를 거꾸로 만든다
#           : reverse 
rev(ls(iris))

# 11. length() : 길이를 구하는 함수
#              : dataframe에 적용하면 column의 개수
length(iris)
var1 = matrix(1:12, ncol=3)
var1
length(var1)


#####################################################




















