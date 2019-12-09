2019-10-31

#### KAKAO API(이미지검색)을 이용해서 이미지를 찾고 파일로 저장 ####

# R은 프로그램적 접근 보다는 사용하기 쉬워서 어떻게 로직을 사용할까에 초점

# 사용하는 packages는 network 연결을 통해서 서버에 접속해서 결과를 받아올 때 사용하는 package를 이용

install.packages("httr")   # 일반적인 서버쪽 접속할때 쓰는 패키지
                          # jsonlite는 json에 특화된 것
library(httr)
library(stringr)

# Open API 의 주소를 알아야 호출하지!
url <- "https://dapi.kakao.com/v2/search/image"

keyword <- "query=차은우"

request_url <- str_c(url,
                     "?",
                     keyword)

# r은 한글처리 잘 되어있지 않아
request_url <- URLencode(request_url)
request_url    # api 호출 주소를 만듦

# Open API 를 사용할 때 거의 대부분 인증절차를 거쳐야 사용가능
apiKey <- "b2823edeaca9a23512b8b67ed7e312e8"

# rest api 키


# web에서 클라이언트가 서버쪽 프로그램을 호출할 때 호출 방식이라는게 있다
# GET, POST, PUT, DELETE (기본적으로 4가지 방식)
# GET, POST 주로 이용
# GET 방식 : 서버 프로그램을 호출할 때
#            전달 데이터를 URL뒤에 붙여서 전달
# but, 주소 길이 한정 : 데이터 보내는데 제한이 있다

# POST 방식 : 서버 프로그램을 호출할 때 
#             전달 데이터가 request header에 붙어서 전달

GET(request_url,add_headers(Authorization="bearer <your api key>"))
result <- GET(request_url,
              add_headers(
              Authorization=paste("KakaoAK",
                                    apiKey)))


http_status(result)    # 접속상태 결과

result_data <- content(result)   # 결과를 추출
  # 접속된 결과 말함 여기서데이터 가져올거야
result_data;

View(result_data)
thumbnail = result_data[["documents"]][[1]][["thumbnail_url"]]
result_data$documents[[1]]$thumbnail_url
thumbnail

for(idx in 1:80){
  print(result_data[["documents"]][[idx]][["thumbnail_url"]])
}

# sol)
for(i in 1:length(result_data$documents)) {
  req = result_data$documents[[i]]$thumbnail_url
  # 요청(request)
  res = GET(req)   # 이미지에 대한 응답
  # 응답(response)
  imgData = content(res, "raw")   # 데이터 타입 설정
  # 이미지, 동영상 데이터("raw" data)는 다르게 처리해야해
  # 결과로 받은 이미지를 raw형태로 추출
  writeBin(imgData,
           paste("C:/R_lecture/image/img",
          # 파일명을 명시
          i,
          ".png"))
        # img1.png
  }

# 이미지에 대한 정보 json형태로 쓱 묶어서 던져주는것
# jsonlite 이용 안하고 왜 이걸썼나?
#    -> httr쓰는이유 : apiKey때문 인증이 없었다가 생겼기 때문에
#                     GET이나 POST 씀
# fromjson이 훨씬 간편함
# 동영상 pdf binary data -> content한다음 -> raw데이터 처리


  













