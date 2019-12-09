2019-11-07

# 사용하는 데이터는 한국복지패널데이터

# 한국보건사회연구원 => 2006부터 10년간 7000여 가구에 대한 경제활동, 생활실태, 복지욕구 등등

# 파일을 복사해야 해요!

# 제공받은 데이터 파일은 SPSS 파일이다

# R에서 불러들이려면 외부 package를 이용
# 데이터 프레임으로 불러들일거야
# R은 거의 데이터프레임으로 사용

install.packages("foreign")
library(foreign)

# 필요한 package를 미리 로딩
library(stringr)
library(ggplot2)
library(dplyr)       # 데이터 프레임 조작
library(xlsx)

# 사용할 raw data를 불러온다
raw_data_file = "C:/R_lecture/data/Koweps_hpc10_2015_beta1.sav"
# 가능한한 원본데이터 복사해놓고 건들지 말아라
raw_welfare <- read.spss(file = raw_data_file,
                         to.data.frame = T)

# 원본 raw파일은 보존해 놓는다
welfare <- raw_welfare


str(welfare)
# ls : column에 대한 list
# 데이터 양 vs 컬럼의 양 중요?
# >>> 컬럼
# 데이터 양은 시간 많아짐

# 데이터 분석에 필요한 컬럼은 컬럼명을 변경해줄거다

welfare <- rename(welfare,
                  gender=h10_g3,     ## 성별
                  birth=h10_g4,     ## 출생연도
                  marriage= h10_g10,  ## 혼인상태
                  relegion =h10_g11,  ## 종교유무
                  code_job=h10_eco9,  # 직업콛
                  income=p1002_8aq1,   # 평균월급
                  code_region = h10_reg7) # 지역코드
       

################################# 준비완료

## 1. 성별에 따른 월급 차이

table(welfare$gender)    # 이상치가 있는지확인 

# 1은 male로 변경하고 2는 fremale로 변경

welfare$gender = ifelse(welfare$gender == 1,
                        " male",
                        "female")

table(welfare$gender)

class(welfare$income)    # 월급에 대한 데이터 타입

summary(welfare$income)  # 기본 통계량 확인

qplot(welfare$income) +
  xlim(0,1000)
# summary에서는 눈으로 확인이 잘 안돼
# 내가 데이터 잘 뽑았는지 확인용도
# 0~250만원 사이에 가장 많은 사람들이 분포!!

# 결측치를 처리
# 이상치부터 먼저 찾아서 처리

welfare$income = ifelse(welfare$income %in% c(0,9999),
                       NA,
                       welfare$income)
# NA가 몇개 있는지 확인
table(is.na(welfare$income))


### 분석을 하기 위한 준비가 끝나요

gender_income<-welfare %>% 
  filter(!is.na(income)) %>%
  group_by(gender) %>%
  summarise(mean_income=mean(income))


gender_income = as.data.frame(gender_income)
gender_income

# 4. 결과 데이터 프레임을 얻었으니 이제 그래프를 그려보자

ggplot(data=gender_income,
       aes(x = gender,
           y = mean_income)) +
  geom_col(width=0.5) +          # 집단간의 관계 : 막대그래프
  labs(x="성별",                 # labels
       y="평균 월급",
       title="성별에 따른 월급",
       subtitle="남성이 여성보다 150만원 많이 번다",
       caption="Example 1 Fig.")

############################################

# 2. 나이와 월급의 관계 파악
# 몇살때 월급을 가장 많이 받을까?
# 나이에 따른 월급을 선그래프로 표현


birth_income<-welfare %>% 
  filter(!is.na(income)) %>%
  group_by(birth) %>%
  summarise(mean_income=mean(income))


birth_income = as.data.frame(birth_income)
birth_income


result <- welfare$income 
result = max(welfare$incom)

ggplot(data= birth_income,
       aes(x=(2015-birth+1),
           y=mean_income)) +
  geom_line() +
  geom_vline(xintercept = result) +
  labs(x="나이",                 
       y="평균 월급",
       title="나이에 따른 월급",
       subtitle=" ",
       caption="Example 2 Fig.")


# sol)

class(welfare$birth)        #출생연도(숫자)
summary(welfare$birth)
qplot(welfare$birth)        # 빈도를 알 수 있다

# 기본적으로 나이에 대해(월급은 위쪽에서 해줌)결측치가 있나 확인

table(is.na(welfare$birth))

# false만 나옴 > 결측치 없음

# 이상치들 기본적으로 확인하고 다 걸러줘야해
welfare$birth = ifelse(welfare$birth == 9999,
                       NA,
                       welfare$birth)

# 나이에 대한 column이 존재하지 않기 때문에 column을 생성해야해
welfare <- welfare %>%
  mutate(age = 2015-birth+1)
welfare$age
summary(welfare$age)
qplot(welfare$age)

age_income <- welfare %>% 
  filter(!is.na(income)) %>%      # 봉급생활자만
  group_by(age) %>%
  summarise(mean_income = mean(income))     #income을 나이별로

head(age_income)
class(age_income)
age_income = as.data.frame(age_income)

# 가장 월급을 많이 받는 나이는?
age_income %>% arrange(desc(mean_income)) %>%
  select(age) %>% head(1)

# 나이에 따른 월급을 선그래프로 표현
ggplot(data = age_income,
       aes(x = age,
           y = mean_income)) +
  geom_line()


########################################################

# 3. 연령대에 따른 월급 차이
# 30대 미만 : 초년(young)
# 30~59세 : 중년(middle)
# 60세 이상 : 노년(old)

# 위의 범주로 연령대에 따른 월급차이
welfare$age1[welfare$age<30]="young"
welfare$age1[30<=welfare$age & welfare$age<60]="middle"
welfare$age1[60<=welfare$age]="old"

str(welfare)
qplot(welfare$age1)

table(is.na(welfare$age1))
table(welfare$age1)

age1_income <- welfare %>% 
  filter(!is.na(income)) %>%      # 봉급생활자만
  group_by(age1) %>%
  summarise(mean_income1 = mean(income))     #income을 나이별로

head(age1_income)
class(age1_income)
age1_income = as.data.frame(age1_income)
age1_income
# 나이에 따른 월급을 선그래프로 표현
ggplot(data = age1_income,
       aes(x = age1,
           y = mean_income1)) +
  geom_col() +
  labs(x="연령대",                 
       y="평균 월급",
       title="연령대에 따른 월급",
       subtitle=" ",
       caption="Example 3 Fig.")


# sol)
# 연령대라는 새로운 column을 추가해야 한다
welfare <- welfare %>%
  mutate(age_group = ifelse(age<30,
                            "young",
                            ifelse(age<60,           # 그렇지 않으면
                                   "middle",
                                   "old")))


table(welfare$age_group)

age_group_income <- welfare %>%
  filter(!is.na(income)) %>%       # 봉급 생활자 대상
  group_by(age_group) %>%
  summarise(mean_income = mean(income))

age_group_income=as.data.frame(age_group_income)

ggplot(data = age_group_income,
       aes(x = age_group,
           y = mean_income)) +
  geom_col (width=0.5)

# 알파벳 오름차순으로 그래프가 나옴
# 그래프 크기 가지고 ordering 하려면?
## -> reorder

# ggplot은 막대그래프를 그릴때 기본적으로 x축 데이터에 대해 알파벳 오름차순으로 정렬해서 출력

# 막대그래프 크기로 순서를 바꾸려면 
ggplot(data = age_group_income,
       aes(x = reorder(age_group,mean_income),  
           # mean_income가지고 다시 기준 잡을거야 (오름차순)
           y = mean_income)) +
  geom_col (width=0.5)

ggplot(data = age_group_income,
       aes(x = reorder(age_group,-mean_income),  
           # mean_income가지고 다시 기준 잡을거야 (내림차순)
           y = mean_income)) +
  geom_col (width=0.5)


# 막대그래프이 x축 순서를 내가 원하는 순서로 바꾸려면 어떻게 해야 하나요?


ggplot(data = age_group_income,
       aes(x = age_group,
           y = mean_income)) +
  geom_col (width=0.5) +
  scale_x_discrete(limits = c("young","middle","old"))
# scale : 순서를 바꾼다
# 뒤에 내가 원하는 순서를 지정해줘야해
# 연속형 x 이산형, 범주형임


#####################################################

# 4. 연령대 및 성별의 월급 차이를 알아보아요

# 초년 여자
# 초년 남자
# 중년 여자
# 중년 남자
# 노년 여자
# 노년 남자

# sol)

gender_age_income <- welfare %>% 
  filter(!is.na(income)) %>%
  group_by(age_group,gender) %>%
  summarise(mean_income = mean(income))

gender_age_income = as.data.frame(gender_age_income)
gender_age_income

# 누적 차트로 표현해야 될 듯 해요!
# 1.
plot.new()
ggplot(data=gender_age_income,
       aes(x=age_group,
           y=mean_income)) +
  geom_col(aes(fill=gender))         # aes 똑같아!

# 2.
ggplot(data=gender_age_income,
       aes(x=age_group,
           y=mean_income,
           fill=gender)) +
  geom_col(position="dodge")


# 성별이 월급차이는 연령대에 따라 다른 양상을 보일 수도 있을 듯함. 그걸 알아보자

y_f=filter(welfare,
           age_group == "young",
           gender == "female")


# 몇가지 조건 가지고 누적차트 쓰는법

############################################################

# 5. 나이 및 성별에 따른 월급차이 분석

gender_age1_income <- welfare %>% 
  filter(!is.na(income)) %>%
  group_by(age,gender) %>%
  summarise(mean_income = mean(income))

gender_age1_income = as.data.frame(gender_age1_income)
gender_age1_income

ggplot(data=gender_age1_income,
       aes(x=age,
           y=mean_income,
           col=gender))  +
  geom_line(size=1)


############################################################

# 6. 직업별 월급 차이를 분석

raw_code <- read.xlsx(file = "C:/R_lecture/data/Koweps_Codebook.xlsx",
                         2,
                      encoding = "UTF-8")
raw_code
code<-raw_code
head(code)
head(welfare)
welfare$code_job
welfare_job=full_join(welfare,code)
welfare_job$job
View(welfare_job)

gender_job_income <- welfare_job %>% 
  filter(!is.na(income)) %>%
  group_by(job) %>%
  summarise(mean_income = mean(income))

gender_job_income = as.data.frame(gender_job_income)
gender_job_income

ggplot(data=gender_job_income,
       aes(x=job,
           y=mean_income)) +
  geom_col() +
  coord_flip()

arrange(gender_job_income, mean_income)[1:5,]
arrange(gender_job_income, desc(mean_income))[1:5,]

###############################################

# 종교 유무에 따른 이혼율
# 종교가 있는 사람이 이혼을 덜 할까?


table(is.na(welfare$marriage))
table(is.na(welfare$relegion))

relegion_di  = filter(welfare,
                     marriage == 3) %>%
  select(marriage, relegion)

head(relegion_di)

relegion_ma = filter(welfare,
                     marriage %in% c(1,2,3,4)) %>%
  select(marriage, relegion)

View(relegion_ma)
table(relegion_ma$relegion)


religion_yes=(table(relegion_di$relegion)[1]/table(relegion_ma$relegion)[1])*100
religion_no=(table(relegion_di$relegion)[2]/table(relegion_ma$relegion)[2])*100

c=cbind(religion_yes,religion_no)
print(c)
barplot(c)


# sol)

# 종교가 없는 사람의 이혼률 : 7.0
# 종교가 있는 사람의 이혼률 : 5.6

# 데이터 구할때 최종값을 그린다음 어떻게 구할지 생각해

#이혼여부를 나타내는 컬럼을 만들어야 할 것 같아요
# ex) group_marriage
# 만약 1,2,4이면 group_marriage => marriage
# 만약 3이면 group_marriage => divorce

# 1. 새로운 column을 만들어보아요
welfare <- welfare %>%
  mutate(group_marriage =
          ifelse(marriage %in% c(1,2,4),
                 "marriage",
                 ifelse(marriage == 3,
                        "divorvce",
                        NA)))

table(welfare$group_marriage)

religion_divorce <- welfare %>%
  filter(!is.na(group_marriage)) %>%
  group_by(relegion, group_marriage) %>%
  summarise(n = n()) %>%
  mutate(total_n = sum(n)) %>%     # 만든 n 첫번째 그룹가지고 sum
  mutate(pct = round(n/total_n*100,1))

religion_divorce





