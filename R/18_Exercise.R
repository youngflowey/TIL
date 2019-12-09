2019-10-25

#### 연습문제

# 입력으로 최대 100자의 문자열을 이용

# 입력으로 사용된 문자열에서 숫자만을 추출해서 출력하라.
# 예) "Hi2567Hello23kaka890L34TT23"
#   =>  2567238903423
# 이렇게 추출한 숫자문자열에서
# 개수가 가장 많은숫자를 찾아서 숫자와 출현빈도를 출력하라.
# 만약 출현빈도가 같은 숫자가 여러개인 경우 그 중 가장 작은 숫자와빈도를 출력
# 2->3, 3->3, 4->1, 5->1, 6->1, 7->1...

x="Hi2567Hello23kaka890L34TT23"
library(stringr)
a=str_extract_all(x,"[0-9]")
b=unlist(a)
as.vector(b)
subset(a,a>3)
mode(b)
c=as.integer(b)
max(table(c))
max(c[1])

str_sub(table(c),2,3)

table(c)


c[(table(c))]

mode=function(x){
  z=max(table(x))
  y=names(which.max(table(x)))
    return(y,z)
}
names(table(c))[max(table(c))]
mode(c)
names(table(c))[max(table(c))]
help("names")

names(y)[which(y==max(y))] #결과는 3

names(which.max(table(c)))



which.max(table(c))
subset(c,c>3)



# 숫자문자를 추출해 보아요
str_extract_all(var1,"[0-9]{2,}")

# 한글을 제외한 나머지 문자들 추출
str_extract_all(var1,"[^가-힣]{5}")
# ^ : not

# 주민등록번호를 검사해 보아요
myId = "801112-1210410"
# 양식(형식)이 맞는지 확인
str_extract_all(myId,"[0-9]{6}-[1234][0-9]{6}") 
# []는 한개를 지칭 여러개 들어갔어도 그 중 하나를 지칭










