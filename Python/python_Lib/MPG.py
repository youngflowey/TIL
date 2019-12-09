
        
class Car:
    def __init__(self,f,m,d,y,cy,t,dr,ct,h,fl,c):
        self.cManu = f
        self.cModel = m
        self.cDis = int(d)
        self.cYear = int(y)
        self.cCyl = int(cy)
        self.cTrans = t
        self.cDry = dr
        self.cCty = int(ct)
        self.cHwy = int(h)
        self.cFl = fl
        self.cClass = c
    
#     # method
#      def Dis_hwy(self):
#             Dis_4 = self.Dis<=4
#             Dis_5 = self.Dis>=5
#             return Dis_4
                 
                 
def Dis_hwy(self):
    car_4=[]
    car_5=[]
    if self.cDis<=4:
        car_4.append(self.cHwy)
    elif self.cDis>5:
        car_5.append(self.cHwy)
    else:
        pass
    return(car_4)
                 
                 
                 
                 
                 