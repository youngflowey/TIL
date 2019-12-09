2019-11-06

### R Graph ###

# 숫자나 문자로 표현하는 것보단ㄴ 그림(그래프)으로 표현하면 변수의 관계,
# 데이터 경향을 좀 더 쉽게 파악 할 수 있다

# 해들리 위컴
# reshape2 package
# dplyr package
# ggplot2 package R에서 가장 많이 사용

# 산점도(scatter) - 변수간의 관계를 파악하기 위해서
# 막대그래프 - 집단간의 비교를 할때
# 선 그래프 - 시계열 데이터를 표현
# 박스 그래프 - 데이터의 분포를 파악

# mpg data set을 사용해 보자!

# ggplot2는 3단계로 그래프를 그려요
# 1. 축을 정해요! 배경을 설정
# 2. 그래프를 추가해요
# 3. 축 범위, 배경 설정

# 1. 산점도(scatter)
install.packages("ggplot2")
library(ggplot2)

mpg
df <- as.data.frame(mpg)
# 안에 들어온것 데이터프레임으로 바꿔라


ls(df)

#    1. 배경 설정

# data 설정 : 그래프를 그리는데 필요한 데이터
# aes(x=, y=)
# axes : 축

# 
ggplot(data = df,
       aes(x=displ,
           y=hwy))
# 안에 실제로 그려지지 않음
# 축만 설정한 것
# 최댓값과 최솟값 알아서 설정됨


#    2. 우리가 원하는 그래프를 그릴 수 있다

ggplot(data = df,
       aes(x=displ,
           y=hwy)) +
   geom_point()     # 산점도 그리는 함수



#    3. 설정을 추가할 수 있어요!

ggplot(data = df,
       aes(x=displ,
           y=hwy)) +
  geom_point(size = 3, color = "red")  +
  xlim(3,5) +
  ylim(20,30)

plot.new()    # 그림 그림을 초기화화

################################################

# 1. 막대 그래프를 그려보아요~!#

# 집단간이 비교를 할 때 많이 사용된다

# 구동방식 (dry) : f(전륜), r(우륜), 4(4륜)
# 범주가 정해져있고 범주로 나오기때문에 범주형

# 연비를 비교해 보자

# 막대 그래프를 위해서 데이터를 준비해야 한다

# 구동방식별 고속도록 연비 차이(평균)을 알고 싶어요
library(dplyr)
df <- as.data.frame(mpg)

result <-df %>% 
  group_by(drv) %>%
  summarise(avg_hwy = mean(hwy))
result
  
result = as.data.frame(result)
result  # 구동방식별 고속도로 연비 평균

ggplot(data = result,
       aes(x=drv, y=avg_hwy)) +
  geom_col()         
# 각 집단에 대한 크기

# 막대그래프에 대해서 순서를 다시 잡아줄 경우
# 막대그래프의 길이에 따라서 순서를 제 배치 하려면

ggplot(data = result,
       aes(x=reorder(drv, -avg_hwy),
           y=avg_hwy)) +
  geom_col()  

# reodor : 순서를 다시 잡아줄거야

# 빈도 막대 그래래프
# 사용하는 함수는 geom_bra()
# raw data fraeㄹ 을 직접 이용해서 처리

plot.new()

ggplot(data = df,
       aes(x=drv)) + 
  geom_bar()  

# 사용하는 함수 빈도  구할 때 사용하는 함수와 
 
ggplot(data=df,
       aes(x=drv)) +
  geom_bar(aes(fill=factor(class)))
# 안에 축을 다시 설정해서 또다른 빈도를 보여좀

# 2. 히스토그램
# x축이 연속형 변수이어야 한다
# 구간을 잘라야 하기 때무네
ggplot(data=df,
       +        aes(x=drv)) +
  +   geom_histogram()

ggplot(data=df,
       aes(x=hwy)) +
  geom_histogram()
# 10부터 40

# 히스토그램일때 연속형 데이터 나와야해
# hwy 최대 최소 정해져있고 각 분야별로 
# 부분 구간간의 빈도수
# 구간에 대한 빈도


########################################
# 산점도

# 데이터의 경향 파악 : 기르마좋아
# 막대 그래프

# 선그래프(시계열 데이터)
# 시간에 따라서 데이터가 어떻게 변하는가
# 일반적으로 환율, 주식, 경제동향

# mpg는 시간에 대한 데이터가 없다
# line chart를 위해서 economics data set을 이용

economics
tail(economics)
# 월별 개인 저축비용 동향 그래프
# 경기에 따라서 사람들이 경리루

ggplot(data=economics,
       axe(x=daa))
# 날짜 손로으 ㅈ고있암

ggplot(data=economics,
       easo=ddata
       y=unemploy)


# 그래프 여러개 그리기 가능!
ggplot(data = economics,
      aes(x=date,
          y=unemploy)) +
  geom_point(color="red")
  geom_line()

# 산점도
# 막대그래프( 일반, 빈도(죽), 히스토그램
# (일반, 빈도(누적),히스토그램))
# 선 그래프(시계역 데이터 표현)
# box 그래프(데이터 분포)

df = as.data.frame(mpg)
head(df)

# 구동방식별 hwy(고속도로 연비)
# 상자그림을 그려보아요!

ggplot(data=df,
       aes(x=drv,
            y=hwy)) +
  geom_boxplot()


######################################################

# 추가적인 객체... 포함시키려면?
# 4가지 종류의 그래프를 그릴 수 있다
# 여기에 추가적인 객체를 포함시켜서 그래프를 좀 더 이해하기 쉬순형태로 만들어 만들어 보자

# mpg :자동차 연비에 대한 data set
# economics : 월별 경제 지표에 대한 data set

# 날짜별 개인저축들에 대한 선 그래프를 그려보자
# 일반적인 직선을 그릴 수 있어요!

ggplot(data= economics,
       aes(x=date,y=psavert)) +
  geom_line() +
  geom_abline(intercept = 12.1,
              slope = -0.0003444)

# 기울기와 절편 들어가야함

# 수평선을그릴 수 있어요!

ggplot(data= economics,
       aes(x=date,y=psavert)) +
  geom_line() +
  geom_hline(yintercept = mean(economics$psavert))# 가로ㅣ 직선

# 수직선 특정 지점 효과적으로 보여줄 수 있음

# 수직선을 그릴 수 있어요!
# 가장 개인저축률이 낮은 날짜에 대한 수직선을 그릴려겨 해요


ggplot(data= economics,
       aes(x=date,y=psavert)) +
  geom_line() +
  geom_vline(xintercept = min(economics$psavert))

# sol)
tmp <- 
economics %>% filter(psavert == min(psavert)) %>%
  select(date)

tmp <- as.data.frame(tmp)
result <- tmp$date    # 최종 날짜가 도출

ggplot(data= economics,
       aes(x=date,y=psavert)) +
  geom_line() +
  geom_vline(xintercept = result)


# 만약 직접 날짜를 직접 입력해서 수직선을 표현하려면?

ggplot(data= economics,
       aes(x=date,y=psavert)) +
  geom_line() +
  geom_vline(xintercept = "2005-05-01")
# 날짜가 아니라 날짜 표현형식으로된 문자열

# 문자열을 날짜로 바꾸려면 data type을 character에서 date type으로
# sol)
as.Date("2005-05-01")

ggplot(data= economics,
       aes(x=date,y=psavert)) +
  geom_line() +
  geom_vline(xintercept = as.Date("2005-05-01"))



## 그래프 안에서 text를 표현하려면 어떻게 해야하나요?

ggplot(data=economics,
       aes(x=date, y=psavert)) +
  geom_point() + 
  xlim(as.Date("1990-01-01"),    # ~부터
       as.Date("1992-12-01")) +  # ~까지
  ylim(7,10) +
  geom_text(aes(label=psavert,
                vjust=-0.5,   # just : 조절, v : vertical 위로 조정
                hjust=-0.2))        
            
  
### 특정 영역을 highlighting 하기 위해서 사용! ###

ggplot(data=economics,
       aes(x=date, y=psavert)) +
  geom_point() +
  annotate("rect",     # annotate : 덧씌우다 "형식"
           xmin=as.Date("1991-01-01"),
           xmax=as.Date("2005-01-01"),
           ymin=5,
           ymax=10,
           alpha=0.3,
           fill="red") +
  annotate("segment",
           x=as.Date("1985-01-01"),
           xend = as.Date("1995-01-01"),
           y=7.5,
           yend=8.5,
           arrow=arrow(),    # 화살표
           color="blue") +
  annotate("text",
           x=as.Date("1985-01-01"),
           y=15,
           label="소리없는 아우성") +  # 원하는 위치에 문자열
  labs(x="연도", y="개인별 저축률",
       title="연도별 개인저축률 추이") +  # 차트, x축, y축 title
  theme_classic()   # 회색 줄이 없어짐
    
  






















