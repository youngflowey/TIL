2019-10-24


# 제어문

# R은 프로래밍 언어에\예요.. 따라서제어문도가지고 있어
# 

# if구문
var1 = 100
var2 =20

# 조건에 따라서 실행되는 code block을 제어할 수 있다.
if(var1>var2){    #조건문이참일 때 실행
  cat("참이에요")
} else{
  # 조건문이 거짓일 때 실행
  cat("거짓이에요")
}


#flse  : 3항 연산자
var1 = 10
var2 = 10

ifelse(var1->var2, "참일경우 선택","F일 경우 선택")

# 반복문(for,while)
# for : 반복 횟수만큼 반복 싷행
# while : 조건이 TRUE일 동안 반복 실행

for(var1 in seq(1:5)){
  print(var1)
}
# 반복해서 이안의 것이 소진할때ㅏ지
# 내가 가지고 있는 벡터각각을 반복해서처리하고 싶을때 특정코드블럭을

idx = 1
mySum = 0

while(idx<10){
  mySum = mySum + idx
  idx = idx + 1
}
mySum

# 라인단위로 스테이트먼트

while(idx<10){
  mySum = mySum + idx; idx = idx + 1
}
mySum
sum(c(1:9))

# 로직(제어문을 이용해서) 1부터 100사이에 있는 3의 배수를 출력하세요
# 1이 1의 배수냐 2가 2의배수냐...하나씩 다봐야해

for(var1 in seq(1,100)){
  if(var1 %% 3 == 0){
  print(var1)
 }
}

# 1부터 100사이에 있는 prime number를 출력
for(var1 in seq(1,100)){
  for(var2 in seq(1,100)){
    if(length(var1 %% var2 ==0)==2)
  print(var1)}
}

# 사용자 정의 함수(User Define Function)
# 제공된 함수말고 우리가 함수를 만들 수 있을까
# 함수명 <- function(x) { ... }
# 변수안에 기능 집어넣겠다
# 입력받은 숫자를 제곱해서 돌려주는 함수를 하나만들어보세요

myFunc=function(x){
  x= x * x
  return(x)
}

var1 = myFunc(3)
var1

var1 = c(1:10)
sum(var1)

# sum함수와 동일한 역할을하는 mySum을 만들어보아라
# vector를 입력으로 받아서 합을 구래주는 함수
mySum = function(x){
  result = 0
  for(t in x) {
    result = result + t
  }
  return(result)
}
var1 = c(1:10)
mySum(var1)


#######################################################





