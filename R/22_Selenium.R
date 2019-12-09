2019-10-31

#### Selenium을 이용한 동적 page scraping ####

# Selenium을 R에서 사용할 수 있도록 도와주는 package를 설치
# cmd에 띄워놓은창 R이 접근할 것이다
install.packages("RSelenium")
library(RSelenium)

# R 프로그램이 Selenium Server에 접속한 후 remote driver객체를 return 받는다
# 원격드라이버로 셀레니움을 R이 원격으로 크롬브라우저를 제어할 것이다

remDr <- remoteDriver(remoteServerAddr="localhost",
             port=4445,
             browserName="chrome")
# selenium이 가지고 있는 함수
# R프로그램이 selenium 서버에 접속하기 위한 함수
# 현재주소
remDr
# 접속이 성공하면 remote driver을 이용해서
# chrome browser를 R code로 제어할 수 있다

remDr$open()
# browser open

# 크롬을 직접제어할 수가 없어서 매개체인 셀레니움을 이용해서 제어해줌
# 셀레니움은 드라이버가 필요해

# open된 browser의 주소를 변경
remDr$navigate("http://localhost:8080/bookSearch/index.html")
# "내가 browsing한 주소"를 줌

# 입력상자를 찾자
inputBox <- remDr$findElement(using="css", 
                              "[type=text]")
  # remDr : 브라우저를 지칭
  # 찾을거야
  # using : 어떻게?
  # 화면에서 상자를 찾은거임


# 찾은 입력상자에 검색어를 넣자
inputBox$sendKeysToElement(list("여행"))
  # 어떤 key값을 input상자에 넣는다
  # list형태로
  # list 된이유 : 값을 여러개 넣을 수 있어서

# AJAX 호출을 하기 위해 버튼을 먼저 찾아야 해
btn <- remDr$findElement(using="css", 
                        "[type=button]")

# 찾은 버튼에 click event를 발생
btn$clickElement()S

# AJAX 호출이 발생해서 출력된 화면에서 필요한 내용을 추출
li_element = remDr$findElements(using="css", 
                               "li")
li_element
# findElement's'

# 이렇게 얻어온 element각각에 대해서 함수를 호출
myList <- sapply(li_element, function(x) {
  x$getElementText()
})
# sapply 내가얻어온element각각에대해서 함수적용할 것이다
#
myList

for(i in 1:length(myList)){
  print(myList[[i]])
}






