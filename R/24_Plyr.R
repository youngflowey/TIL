2019-11-01

#### plyr ####


# plyr package => dplyr 개량형 package
install.packages("plyr")
library(plyr)
require(plyr)

#### data frame의 결합 #####

# 1. key값을 이용해서 두개의 data frame을 병합 (세로방향, 열방향으로 결합)

# data frame을 두개 만들어 보자
x = data.frame(id=c(1,2,3,4,5),
               height=c(150,190,170,188,167))
y = data.frame(id=c(1,2,3,6),
               weight=c(50,100,80,78))

join(x,y,by="id", type="inner")
# 뭘가지고 결합하는지
# 어떻게 결합할지
join(x,y,by="id", type="left")  # default
join(x,y,by="id", type="right")
join(x,y,by="id", type="full")

# key를 1개 이용해서 결합하는걸 해보았어요
# key를 2개 이상이용해서 결합하는건?

x = data.frame(id=c(1,2,3,4,5),
               gender=c("M","F","M","F","M"),
               height=c(150,190,170,188,167))
y = data.frame(id=c(1,2,3,6),
               gender=c("F","F","M","F"),
               weight=c(50,100,80,78))


join(x,y,by=c("id","gender"),type="inner")


### dplyr에서는 join() => left_join()

# 2. 범주형 변수를 이용해서 그룹별 통계량 구하기

str(iris)
    # species가 vector로 되어있음
unique(iris$Species)
    # 중복 제거하고 남은거 알려줘

# iris의 종별 꽃잎 길이의 평균을 구하라
# tapply(대상 cloumn, 범주형 column, 적용할 함수)
# tapply : 한번의 1개의 통계만 구할 수 있다
tapply(iris$Petal.Length,
       iris$Species,
       FUN=mean)
tapply(iris$Petal.Length,
       iris$Species,
       FUN=max)
    # 값을 루프돌려서 사용하지 않음

# iris의 종별 꽃잎 길이의 평균과 표준편차를 구하라
# 2개 이상의 통계량 구하는법
# ddply() : 한번에 여러개의 통계치를 구할 수 있다

df <- ddply(iris,
            .(Species),    # dataset이명시되어있기때문에 안써줘도됨
            summarise,
            avg=mean(Petal.Length),   # avg, sd : 새로운 컬럼명
            sd=sd(Petal.Length))   
# ddply(대상데이터셋, 어떤 범주,)
class(df)
View(df)

####################################################

## plyr에서는 join()과 통계값을 구하는 함수
## (2개)만 알아두면 된다


















