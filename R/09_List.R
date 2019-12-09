2019-10-23

# 2. List
# 1차원 선형구조, 다른데이터타입이 들어올 수 있다
# 중첩 자료구조로 이용
# list안에 각각의 요소안에 다른 데이터 타입넣을 수 있다

# 지금까지 했던 여러 자료구조들을 생성하여 List안에 저장해보자

var_scalar = 100; var_scalar    # scalar
# 값이 하나짜린것 벡터라고 볼 수 있지만 
# 값을 하나로만 저장할 수 있는 것을 스칼라라고 한다

var_vector = c(10,20,30)    # vector
var_vector

var_matrix = matrix(c(1:12), 
                    ncol=3, 
                    nrow=4,
                    byrow=T)
var_matrix

var_array = array(c(1:12), dim = c(2,2,3))
# 3차원 이상의 배열
# dim 알려줘야지 몇차원인지 앎
var_array

var_df = data.frame(id=1:4,      # id라는 col
                    name=c("홍길동","김길동","최길동","이길동"),
                    age=c(30,40,20,10))
var_df             
# dataframe = matrix
# 다른점 : 다른타입의 데이타 들어갈 수 있음
# 다른타입 쓸때는 dataframe
# but, matrix가 좀 더 빠르기 때문에 matrix 쓰는 이유도 있음


# 중첩 자료구조

myList = list(var_scalar,
              var_vector,
              var_matrix,
              var_array,
              var_df)
myList
# 1번째 방에는 스칼라, 2번째 방에는 벡터...
# 다른자료구조를 내부적으로 가지고 갈 수 있는 것
# 1차원 선형구조라고 볼 수 있음
myVector = c(10,20,30)
myVector[2:3]

myList
myList[1]
# key와 value로 저장되는 자료구조이고 데이터를 출력할 때 key값도 같이 출력
# 일반적으로 map, dictionary라고 표현함
# 우리는 key값이 없기 때문에 첫번째 방에 키가 없음 그냥 첫번째 방에 잇다는것만 보여줌
# 공간을 access하면 key,value가 나옴
# [[1]] 
# [1] 100

myList[[1]]
# key를 access한것 value가 나옴
# [1] 100
# key값을 이용하면 딱 끄집어 낼 수 있다.
# list는 키값을 정해서 할 수 있다

myList = list(name = c("홍길동","김길동"),
              age = c(20,30),
              address=c("서울","부산"))
# key와 value의 쌍으로 첫번째, 두번째, 세번째 방에 밀어 넣은것

myList
# []대신 키값이 나오게 됨
# $키값 을 의미함

myList[1]
# 첫번째 방에 있는 key와 value가 같이 튀어 나오게 됨

myList$name
# 해당 key값으로 해당되는 데이터를 access한 것
# List에서 key를 사용할 때는 $기호를 이용

myList$name[2]

myList[[1]]
# 이 형태도 사용 가능하지만 일반적으로 key값이있으면 key값을 이용함

myList[]
# 공간을 지칭함
myList[[]]
# key값을 지정함
myList$name
# 이 형태를 일반적으로 사용 