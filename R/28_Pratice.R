2019-11-04

## mpg data set에 대해서 다음의 내용을 수행하세요
df <- as.data.frame(mpg) 
library(dplyr)
  # 1. displ(배기량)이 4 이하인 자동차와 5 이상인 자동차 중 어떤 자동차의 hwy(고속도로 연비)가 평균적으로 더 높은지 확인하세요.
str(df)
displ_4 = filter(df,
                 displ <= 4) %>%
  summarise(displ_4이하 = mean(hwy))
displ_5 = filter(df,
                 displ >= 5) %>%
  summarise(displ_5이상 = mean(hwy))
cbind(displ_4,displ_5)

  # 2. 자동차 제조 회사에 따라 도시 연비가 다른지 알아보려고 한다. "audi"와 "toyota" 중 어느 manufacturer(제조회사)의 cty(도시 연비)가 평균적으로 더 높은지 확인하세요.
Audi = filter(df,
              manufacturer == "audi") %>%
       summarise(audi_cty=mean(cty))
Toyota = filter(df,
              manufacturer == "toyota") %>%
  summarise(toyota_cty=mean(cty))
cbind(Audi,Toyota)

  # 3. "chevrolet", "ford", "honda" 자동차의 고속도로 연비 평균을 알아보려고 한다. 이 회사들의 데이터를 추출한 후 hwy(고속도로 연비) 전체 평균을 구하세요.
filter(df,
       manufacturer %in% c("chevrolet","ford","honda")) %>%
  summarise(mean_hwy=mean(hwy))

# sol)
View(df)
filter(df,
       manufacturer == "chevrolet" |
       manufacturer == "ford" |
       manufacturer == "honda") %>%
       summarise(mean_hwy=mean(hwy))

  # 4. "audi"에서 생산한 자동차 중에 어떤 자동차 모델의 hwy(고속도로 연비)가 높은지 알아보려고 한다. "audi"에서 생산한 자동차 중 hwy가 1~5위에 해당하는 자동차의 데이터를 출력하세요.
(filter(mpg,
       manufacturer == "audi") %>%
  arrange(desc(hwy)) %>%
  select(model, hwy))[1:5,]

  
    # 5. mpg 데이터는 연비를 나타내는 변수가 2개입니다. 두 변수를 각각 활용하는 대신 하나의 통합 연비 변수를 만들어 사용하려 합니다. 평균 연비 변수는 두 연비(고속도로와 도시)의 평균을 이용합니다. 회사별로 "suv" 자동차의 평균 연비를 구한후 내림차순으로 정렬한 후 1~5위까지 데이터를 출력하세요.
  
mpg$total_mean=(mpg$hwy+mpg$cty)/2
str(mpg)
(filter(mpg,
       class == "suv") %>%
  group_by(manufacturer) %>%
  summarise(mean_suv=mean(total_mean)) %>%
  arrange(desc(mean_suv)))[1:5,]


# 6. mpg 데이터의 class는 "suv", "compact" 등 자동차의 특징에 따라 일곱 종류로 분류한 변수입니다. 어떤 차종의 도시 연비가 높은지 비교하려 합니다. class별 cty 평균을 구하고 cty 평균이 높은 순으로 정렬해 출력하세요.

select(mpg,class,cty) %>%
  group_by(class) %>%
  summarise(mean_cty=mean(cty)) %>%
  arrange(desc(mean_cty))

# 7. 어떤 회사 자동차의 hwy(고속도로 연비)가 가장 높은지 알아보려 합니다. hwy(고속도로 연비) 평균이 가장 높은 회사 세 곳을 출력하세요.

(group_by(mpg,manufacturer) %>%
  summarise(mean_hwy = mean(hwy)) %>%
  arrange(desc(mean_hwy)))[1:3,]

# 8. 어떤 회사에서 "compact" 차종을 가장 많이 생산하는지 알아보려고 합니다. 각 회사별 "compact" 차종 수를 내림차순으로 정렬해 출력하세요.

filter(mpg,
       class == "compact") %>%
  group_by( manufacturer) %>%
  summarise(length_compact = length(class)) %>%
  arrange(desc(length_compact))
