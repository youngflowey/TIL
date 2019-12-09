# data : excel 파일(exec1105.xlsx)

# 만약 결측값이 존재하면 결측값은 결측값을 제외한 
# 해당 과목의 평균을 이용합니다.

# 만약 극단치가 존재하면 하위 극단치는 극단치값을 제외한
# 해당 과목의 1사분위 값을 이용하고 상위 극단치는
# 해당 과목의 3사분위 값을 이용합니다.

# 1. 전체 평균이 가장 높은 사람은 누구이며 평균값은 얼마인가요?

# 2. 남자와 여자의 전체 평균은 각각 얼마인가요?

# 3. 수학성적이 전체 수학 성적 평균보다 높은 남성은 누구이며
#    수학성적은 얼마인가요?

library(xlsx)
library(reshape2)

sheet1 <- read.xlsx(file = "C:/R_lecture/data/exec1105.xlsx",
                    header = F,
                    1)
sheet1                    
group_by(sheet1,
         X1)

X2
sheet_1= dcast(sheet1,
         formula = X1 ~ X2, 
         value.var = "X3") 

sheet2 <- read.xlsx(file = "C:/R_lecture/data/exec1105.xlsx",
                   header = F,
                   2,
                   encoding = "UTF-8")
sheet2
sheet_join = full_join(sheet_1,sheet2)
sheet_join
####################결측값###################
sheet_join$math= ifelse(is.na(sheet_join$math),
                       mean(sheet_join$math, na.rm = T),
                        sheet_join$math)

boxplot(sheet_join)

summary(sheet_join)
Eng = c(50,55,41,1,17,95)
Kor = c(3,50,11,56,20,70)
Math = c(68,78.7,45,63,18,78)
summary(Eng)
summary(Kor)
summary(Math)

iqr_eng = summary(Eng)[5] - summary(Eng)[2];iqr_eng
iqr_kor = summary(Kor)[5] - summary(Kor)[2];iqr_kor
iqr_math = summary(Math)[5] - summary(Math)[2];iqr_math

deter_eng = iqr_eng * 1.5 ;deter_eng
deter_kor = iqr_kor * 1.5 ;deter_kor
deter_math = iqr_math * 1.5 ;deter_math

summary(Eng)[5] + deter_eng
summary(Eng)[5] + deter_eng
summary(Eng)[5] + deter_eng

# 1. 
sheet_join$mean = (sheet_join$eng + sheet_join$kor + sheet_join$math)/3
sheet_join


df$math = ifelse(is.na(df$score),
            (sheet_join$eng + sheet_join$kor + sheet_join$math)/3, na.rm = T),
             )


df$score = ifelse(is.na(df$score),
                  mean(df$score, na.rm = T),
                  df$score)

df



