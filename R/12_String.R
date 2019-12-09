2019-10-23

## 문자열 처리

# 빅데이터 : 많은 양의 데이터
#          : 3V
#          : 1. Volume : 정해진 시간내에 처리할 수 없는 많은 양의 데이터
#            2. velocity : 데이터 생성속도
#            3. variety : 다양성
# 일반적으로 빅데이터 처리는 문자열 처리를 동반하는 경우가 많다.
# 문자열 처리는 stringr package를 이용하면 쉽고 편하게 할 수 있다.
install.packages("stringr")
library(stringr)

var1 = "Honggd1234Leess9032YOU25최길동2009"

# 1. 문자열의 길이를 구해보자
str_length(var1)    # 31 (한글1글자도 1개)
# 직접세어봐야해 한글을 어떻게 처리하는지 모름

# 2. 찾는 문자열이 시작과 끝을 알려주는것
str_locate(var1,"9032")
# 내가 찾고 싶은 것의 위치를 알아 내는것
class(str_locate(var1,"9032"))
# class : 자료구조를 알려주는 method
# mode : data type 알려주는 method
# 결과로 return되는 형태 matrix

# 3. 부분문자열을 구해봐라
str_sub(var1,3,8)   # 시작과 끝 둘다 

# 4. 대소문자 변경
str_to_lower(var1)
str_to_upper(var1)

# 5. 문자열 교체
var1 = "Honggd1234Leess9032YOU25최길동2009"
str_replace(var1, "Hong","KIM")
# 처음찾은 하나만!
str_replace_all(var1,"Hong","KIM")

# 6. 문자열 결합
var2 = "홍"
var3 = "길동"
str_c(var2,var3)

# 7. 문자열 분할
var1 = "Honggd1234,Leess9032,YOU25,최길동2009"
# , 기준으로 분할해서 vector 형태로
str_split(var1,",")
# return타입까지 신경써야함

# 8. 문자열 결합
var1 = c("홍길동","김길동","최길동")
# 세개를 연결하려고 해
str_c(var1)     # [1] "홍길동" "김길동" "최길동"
# 안된다,vector안에 문자열이 여러개를 하나로 연결
paste(var1, collapse = "-")
              # 어떤 seperate로 붙이려는지

#################################################

# 문자열 처리를 쉽고 편하게 하기 위해서는 정규 표현식(regular expression)

var1 = "Honggd1234,Leess9032,YOU25,최길동2009"

# 조건에 부합하는 모든 문자를 추출함
str_extract_all(var1,"[a-z]{4}")
# "ongg" "eess"
# [] : 정규 표현식, 한글자를 지칭, 
# {} : 반복의 의미
str_extract_all(var1,"[A-Z]{2}")
# "YO"
# 연속적으로 두개 나오는 것
str_extract_all(var1,"[a-z]{2,}")    
# "onggd" "eess" 
# 2 이상
str_extract_all(var1,"[a-z]{2,3}")
# "ong" "gd"  "ees"
# 2개에서 3개 
str_extract_all(var1,"34")

# 한글만 추출해보아요
str_extract_all(var1,"[가-힣]")
                  # 한글의 시작과 끝
# 컴퓨터는 사실 숫자만 인식
# 문자표를 심어놓은것. 숫자 몇은 문자 몇이야
# 대표적인 것 : 아스키코드
# but, 영어밖에안돼
# ==> 유니코드(다국어표현 가능)
# R은 통계툴이라 자세하게 나누지 않음

# 숫자문자를 추출해 보아요
str_extract_all(var1,"[0-9]{2,}")

# 한글을 제외한 나머지 문자들 추출
str_extract_all(var1,"[^가-힣]{5}")
# ^ : not

# 주민등록번호를 검사해 보아요
myId = "801112-1210410"
# 양식(형식)이 맞는지 확인
str_extract_all(myId,"[0-9]{6}-[1234][0-9]{6}") 
# []는 한개를 지칭 여러개 들어갔어도 그 중 하나를 지칭

















