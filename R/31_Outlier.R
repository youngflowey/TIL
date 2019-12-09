2019-11-05

#### 이상치 ####

# 1. 존재할 수 없는 값이 포함된 경우
#       => 없애줘야해

# 2. 극단치 : 정상적인 범주에서 너무 벗어난 값이 들어온 경우
#           : 기준이 있어야해
#           : ( 정상적인 범주는 어떻게 정하나요? )

df <- data.frame(id = c(1,2,NA,4,5,NA,7),
                 score = c(20,30,90,NA,60,NA,99),
                 gender = c("M","F","M","F","M","F","^^"),
                 stringsAsFactors = F)

# ^^ -> 이상치
# 일반적으로 data frame 잡아주면 gender vector로 잡힘
# character로 나오게 하려면 string해줘야한다
df


# 이상치가 존재하면 결측치로 바꿔줘요
df$gender = ifelse(df$gender %in% c("M","F"), # 이 값이 in 안에 있다면
                   df$gender,
                   NA)
df


##############################################################

### 극단치 : 이상치 중에 값이 극단적으로 크거나 작은 값을 의미 ###

# 기준을 정해야 한다! => 기준이 있다

# 극단치를 분류하는 기준은 IQR 을 이용
# (InterQualtile Range)
# 4분위부터 알아보도록 해요

# 극단치를 알아보기 위한 sample 작성
data = c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,22)
data = c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,22.1)

# 20을 제외 시켜야하는가 포함시켜야 하는가
# 극단치는 양끝단에서 발생

# 기본통계값을 이용해서 사분위 값을 알아보아요
summary(data)
lower_data = c(1,2,3,4,5,6,7,8)
upper_data = c(8,9,10,11,12,13,14,22)
upper_data = c(8,9,10,11,12,13,14,22.1)


# IQR : 데이터 중간 위쪽의 mid point- 데이터 중간 아래쪽의 mid point
iqr_value = median(upper_data) - median(lower_data);iqr_value
IQR =7



## 극단치를 결정하는 기준값 : IQR * 1.5
deter_value = iqr_value * 1.5 ;deter_value
# 10.5 -> range
# 3사분위값 + 기준값 
#   11.5    +  10.5   =22
# 이거보다 크게 되면 극단치

# 계산을 통해서 극단치를 판단하는 방법

# 그래프를 이용하면 극단치를 눈으로 확인

boxplot(data)
# boxplot 이용하면 몇개의 극단치가 있는지 잘 볼 수 있음
boxplot(data)$stats
# max이후로 다 날리면 돼
# 결측치로 해준다음


















