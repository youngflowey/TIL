2019-10-23

# 같은 데이터 타입을 저장하는 자료구조
# vector(1차원), matrix(2차원), Array(3차원 이상)
# 다른 언어에서는 array 1차 2차 3차 상관없이 array라고 함


## 다른 데이터 타입을 저장하는 자료구조

# 1. List(1차원), 
# 2. data frame(2차원)
# 3. factor => 범주형 자료구조

############################################

## 1. factor
# 범주형 데이터를 저장하기 위한 자료구조
# 범주형 데이터는 
# 예를 들어 방의 크기가 "대", "중", "소"=> Level
# 일반적으로 vector를 이용해서 factor를 만든다

# 6명의 혈액형 데이터를 vector에 저장하고 factor로 변형해보자

var1 = c("A","AB","O","A","B","B")
var1

factor_var1 = factor(var1)
# factor함수 활용하면 factor형 자료구조로 받아 볼 수 있음
factor_var1

nlevels(factor_var1)      # 4, level의 개수
# factor를 인자로 주고 level의 갯수가 몇개 있는지 알려줌

levels(factor_var1)
# 어떤 정해져 있는 level이 있는지를 보여줌

is.factor(factor_var1)    # TRUE
# 이 함수가 factor데이터인지 아닌지

########################################################

# factor는 빈도를 구하는데 많이 쓰인다

# 남성과 여성의 성별데이터로 factor를 생성하고 빈도수를 구해보자

var1 = c("MAN","WOMAN","MAN","MAN","MAN","WOMAN")
var1

factor_gender = factor(var1)
factor_gender

table(factor_gender)
# 몇개가 나오는지 빈도가 나옴

plot(factor_gender)
