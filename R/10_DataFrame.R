2019-10-23

## 3. data frame

# matrix와 같은 2차원 형태의 자료구조
# 다른 데이터 타입을 하용할 수 있다
# column 명을 이용할 수 있다
# Database의 Table과 유사하다

# 간단한 예를 이용해 보자

# vector를 이용해서 data frame을 만들어 보자

no=c(1,2,3)
name=c("홍길동","김길동","최길동")
age=c(10,20,30)

df = data.frame(s_no = no,
                s_name = name,
                s_age = age)
# 컬럼명 = 해당컬럼명에 벡터를 지칭
df

myMatrix = matrix(c(1:12), 
                  ncol=3, 
                  nrow=4,
                  byrow=T)
myMatrix
# 변수명을 키워드로 잡는 것 좋지않아.
# 변수명은 예약된 키워드로 하는 것 피해야함

# matrix를 dataframe으로 전환 가능
df_mat = data.frame(myMatrix)
df_mat
# column명을 줄 수 없어
# 변형시킬 수는 있음

df[1]
# 첫번째 열을 지칭함
df$s_name
# dataframe안에 있는 s_name이라는 컬럼을 내가 알고 싶을때
# list에서 $ : key
# df에서 $ : column
[1] 홍길동 김길동 최길동
Levels: 김길동 최길동 홍길동
# 범주형으로 잡힘
# 나중에 범주형으로 안되는법 배움

# data.frame의 함수
str(df)
# 전반적인 내용을 보여줌
# 3 obs. : 3개의 관측치, 3개의 행
# 3 variables : 3개의 변수, 3개의 열
# s_no : 첫번째 col...
# 각각의 col 데이터 타입 (num factor,,,)

summary(df)
# data frame 의 요약 통계를 볼 수 있다

apply()
# data frame에도 적용가능

df = data.frame(x=c(1:5),
                y=seq(2,10,2),
                z=c("a","b","c","d","e"))
df = data.frame(x=c(1:5),
                y=seq(2,10,2),
                z=c("a","b","c","d","e"),
                stringsAsFactors = F)
df
df[1]
str(df)
# 데이터는 디폴트로 문자로 들어오면 factor로 들어옴
# 일반 문자 데이터로 쓸거야라면 stringsAsFactors = F 해서 character로
# 연습문제
# 주어진 data frame의 1,2번째 column에 대해서 각각 합계를 구하세요
sum(df[1])
sum(df[2])
apply(X = df[1], MARGIN = 2, FUN=sum)
apply(X = df[2], MARGIN = 2, FUN=sum)
apply(X = df[1:2], MARGIN = 2, FUN = sum)

apply(X = df[,c(1:2)], MARGIN = 2, FUN = sum)
# apply는 2차원으로 보통 씀

# subset()
# 하나의 df에서 조거네 맞는 행을 추출해서 독립적인 data frame을 생성

subset(df,x > 3)
# x col값이 3이 넘어가는 것을 뽑아 볼것이다

# x가 3보다 작고 y가 5보다 큰 데이터를 추출해 볼때
df_sub <- subset(df,x<3 & y >= 4)
# 일반적으로는 변수 저장을 해주자