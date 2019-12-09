2019-10-22

# matirx : 동일한 data type을 가지는 2차월 형태의 자료구조
# matrix의 생성
var1 = matrix(c(1:5))  # matrix의 생성 기준은 열
                       # 열은 고정시키고 행을 늘리는거임
                       # 5행 1열짜리 matrix가 생성
var1

# 행을 안쓴다는 것 : 모든 행을 지칭
# 열을 안쓴다는 것 : 모든 열을 지칭

var1 = matrix(c(1:10), nrow = 2)
var1         # 2행 5열짜리 matrix
# n = 갯수, row = 행
# nrow = 행의갯수, 속성을 이용해서 정해줌
# 데이터가 10개, 행이 2개, 그렇다면 열은 5개
# 데이터가 채워지는 기준 : 열기준

var1 = matrix(c(1:10), nrow = 3)
var1         # 3행 4열짜리 matrix
# 데이터 비게 되는데 recycling해서 처음부터 반복되는대로 채워짐

var1 = matrix(c(1:10), nrow = 2, byrow = T)
var1
# 행단위로 데이터를 채운다

# vector를 연결해서 matrix를 만들 수 있다
var1 = c(1,2,3,4)
var2 = c(5,6,7,8)

mat1 = rbind(var1,var2)
mat1

mat2 = cbind(var1,var2)
mat2

var1 = matrix(c(1:21), nrow=3, ncol=7)
var1                   # 3행 7열짜리 matrix

var1[1,4]
var1[2,]
var1[,3]

# 11 12 14 15의 값을 가져오려면?
var1[c(2,3),c(4,5)]

length(var1)
# 원소 갯수
nrow(var1)
ncol(var1)
# 행과 열을 구하는 method 따로 있음
# apply() 함수를 이용해서 matrix에 특정 함수를 적용
# apply() 함수는 속성이 3개 들어간다
# X => 적용할 matrix
apply(X=var1,)
# MARGIN => 1이면 행기준, 2이면 열기준
apply(,MARGIN = 2,)
# FUN => 적용할 함수명
apply(, FUN = max)

var1 = c(20,60,90,100,40,76,99)
max(var1)
mean(var1)
min(var1)
median(var1)


var1 = matrix(c(1:21), nrow=3, ncol=7)
var1
apply(X=var1, MARGIN =1, FUN = max)
# 총 3개 행에서 최댓값을 도출함
apply(X=var1, MARGIN =1, FUN = mean)
# 이미 우리에게 제공되는 함수만 이용할 수 있나요?
# => 적용할 함수를 우리가 직접 만들어서 사용할 수 있다

## matrix의 연산
# matrix의 요소단위의 곱연산
# 전치행렬을 구해보자
# 행렬곱(matrix product)
# 역행렬(matrix inversion) => 가우스 소거법이용

var1 = matrix(c(1:6), ncol =3)
var1
var2 = matrix(c(1,-1,2,-2,1,-1), ncol=3)
var2
var3 = matrix(c(1,-1,2,-2,1,-1), ncol=2)
# elementwise product (요소단위 곱연산)
var1 * var2   # 각각의 같은위치의 요소들을 곱셈연산

# matrix product (행렬곱)
var1 %*% var3

# 전치행렬(transpose)
var1
t(var1)
# 첫번째 행이 첫번째 열로,,,

# 역행렬 : matrix A가 nxn 일때 다음의 조건을 만족하는 행렬 B가 존재하면 행렬 B를 A의 역행렬이라고 한다
# AB = BA = I (단위행렬 E)
solve(var1)
# > Error in solve.default(var1) : 'a' (2 x 3) must be square
# 역행렬 정방형이어야 해

######################################################################

## Array (3차원 이상의 자료구조, 같은 데이터 타입으로 구성)
var1 = array(c(1:24), dim=c(3,2,4))
# dim=dimention (벡터의 갯수가 차원의 수)
# dim=c(행,열,평면의 갯수)
var1



