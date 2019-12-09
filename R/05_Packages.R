2019-10-22

# package : 함수의 집합
# R은 처음 설치할 때 base package가 같이 설치된다
# 추가적인 기능을 이용하기 위해서 외부 package를 찾아서 설치해야 한다.
# 그래프를 그리기위해서 많이 사용하는 package는 ggplot2를 이용

# package를 설치하기 위해서
install.packages("ggplot2")

# 설치된 package를 메모리에 load해야 사용할 수 있다
# 둘 중 하나 이용해서 로드
library(ggplot2)
require(ggplot2)

# 간단한 빈도를 나타내는 막대그래프를 그리기위해 vector하나 만들어 보자
var1 = c("a","b","c","a","b","a")

# package안의 함수를 이용해서 빈도그래프 그리기
# quick plot
qplot(var1)

# R은 차트그리기 기능들이 잘 제공됨

# 설치된 package를 삭제하려면
remove.packages("ggplot2")

# 직접파일을 지우던가 remove해서 지우던가 

# packages가 설치된 폴더 경로 알아보자
.libPaths()    # library path

# package 설치 경로를 변경하고 싶을 때
.libPaths("c:/R_lecture/lib")
# ggplot2만 설치했는데 왜 여러개?
# ggplot2을 같이 사용하는 (dependent한) 다른 패키지도 설치한 것임

# 많은 package에 대한 정보, 사용법 등을 알면 알수록 R을 잘 사용할 수 있다

# package를 설치하면 package에서 제공하는 함수를 이용할 수 있다

help(qplot)
library(ggplot2)

args(qplot)

example(qplot)

# working directory
getwd()
setwd("c:/R_lecture")









