2019-10-23

# 데이터 입출력
# 키보드로부터 데이터를 받을 수 있다


# 1. scan() 
# 함수를 이용해서 숫자데이터를 받을 수 있다
myNUM <- scan()
myNUM
  # 문자를 넣으면 : Error in scan() : scan() expected 'a real', got 'a'
  # => 숫자만 넣어야해
  # default = 숫자

# scan()을 이용해서문자열도 입력받을 수 있다
var1 = scan(what = character())
var1


# 2. edit()
# 키보드로부터 데이터를 받기 위해서 edit() 함수를 이용할 수 있다

var1 = data.frame()
df = edit(var1)
df

###########################################################

















