
## class 정의
class Student:                # 어떤 이름의 클래스를 만들거니
    # class variable (학생들이 공통으로 가지고 있는 variable) : 없음
    # student 한명을 객체로 만들거야
    
    # 생성자(constructor) instance vriable (자기만 가지고 있는 변수 self)
    def __init__(self,n,k,e,m):
                 # 인자 4개 : 이름 국어 영어 수학
        self.sName = n
        self.sKor = int(k)
        self.sEn = int(e)
        self.sMath = int(m)
        self.sAvg = self.calcul_avg()   # 내가가지고 있는 함수 호출해
        # self.sRank = 0   굳이
        
      
    # method
    def calcul_avg(self): # self 넣어햐해 :  자기가 가지고 있는 데이터를 처리할 수 있어
        return (self.sKor+self.sEn+self.sMath)/3
    
    def print_student(self):
        print("학생의 이름은 : {}  평균은 : {:.2f}".format(self.sName,self.sAvg))
        # :.2f : 소수점 2째자리까지
    
 