2019-10-21

# r의 주석은 #을 이용해요
# 주석을 이용하면 한 줄이 몽땅 comment 처리됨.
# 일반적으로 프로그래밍언어에서 STATEMENT를 종료하기 위해서 사용하는";"
# R은 ';"를 생략할 수 있어요!
3+5;
3+5; 3+6; 2+7;
# 코드를 수행하기 위해서는 ctrl+enter를 사용
# R은 대소문자를 구별합니다.
# 변수를 만들때 camelcase(낙타등 구불구불)를 이용
#
result = 100;
myResult # camelcase notation v
MyResult # pascal notation
my_result # underscore notation v
myresult = 200 # 뭔가 이상하다. 관용적 표현 지켜줘야해
#######################################################

myResult = 200; # assignment (값을 할당해준다)
myResult <- 300 # assignment
400 -> myResult # assignment 기존프로그래밍 언어는 불가능 but, R은 가능
myResult
print(myResult) # 변수 출력
# 여러개의 값을 출력하려면 cat()
print("결과같은 :" + myResult) # java에서는 가능 but, R은 불가능
# 문자열과 숫자는 더할 수 없어
cat("결과값은 : ",myResult)

##########################################################
# 멤버를 이용한 변수 선언
goods.price = 3000
goods.code = "001"
goods.name = "냉장고"

#########################################################
# 출력되는 형식을 살펴보자
myResult
mySeq = seq(100) # seq : R이 우리에게 제공해주는  함수
                  # 1부터 100까지 1씩 증가하는 숫자의 집합
mySeq
# consle창에 [숫자] : 출력되는 index순서를 지칭
mySeq = seq(5,100) # 5부터 100가지 1씩 증가하는 숫자의 집합
mySeq = seq(1,100,by = 2) # by : 증감을 지칭
mySeq


