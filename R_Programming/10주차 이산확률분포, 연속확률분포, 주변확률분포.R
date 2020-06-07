#example_1
library(prob)
S <- tosscoin(3); S
Hcount = function(x) sum(x=="H") #앞면의 갯수를 세는 함수를 정의, 단지 함수를 정의한 것 뿐
( X <- apply(S,1,Hcount))        
#확률변수 X의 정의 : apply()함수로 행별로 적용. 
#정의한 함수를 적용




#example_2
#예제 1을 수행한 후 table()함수를 이용하여 도수 분포표 (X의 확률분포) 를 구하라
(freq = table(X))
#length() 또는 nrow()를 이용하여 , 원소의 개수 또는 표본 공간의 행의 개수를 계산
( prob = freq/length(X)) 
( prob = freq/nrow(S)) #윗 줄의 코드와 결과는 동일

#확률은 분수로 표현하기
library(MASS)
as.fractions(prob)

#plot을 이용하여 제목(main), x축 이름(xlab) , y축 이름(ylab)
#각 점에서 축까지의 수직선(type)을 그리고 그래프의 색상(col) y축 범위(ylim) 선의 굵기(lwd)를 지정하고
#확률분푸표를 그래프로 나타낸다

win.graph(7,6)  #그래프를 새로운 팝업창에 그리는 명령어, (가로의 크기, 세로의 크기)
plot(prob, main="동전 3개를 던졌을 때 앞면의 수에 대한 확률 분포", xlab='앞면의 수',
     ylab='f(x)', type='h', col='Orange', ylim=c(0,max(prob)+0.01), lwd = 4)

#lwd의 기본값 = 1 , 상당히 굵어지면 히스토그램과 같아짐
#y축의 길이는 0 ~ prob의 최댓값+0.01
  



#연속확률분포 = 확률밀도함수 
f1 <- function(x) {4*x - 2*x^2} 
( c1 <- integrate(f1,0,2)) #f1함수를 0~1까지 적분하라
  
#as.fraction을 이용하여 c1을 분수로 표시한 후 역수를 취함
library(MASS)
as.fractions(2.666667)
as.fractions(1/2.666667) #역수를 취함
as.fractions(c1) #변수를 취한 경우 error발생, 왜? c1은 현재 유한소수이기 떄문

c2 = 2.666667
as.fractions(c2) #이 경우 c2는 유한 소수이기 떄문에 error발생 X

#integrate를 이용하여 확률밀도함수(pdf)를 구함
pdf = function(x) {(3/8) * (4*x - 2*x**2)} 
#integrate를 이용하여 확률을 구함
( integrate(pdf, 1,2)) #1~2까지 정적분함




##3_2, 고장나서 교체될 확률
pdf <- function(x) {100/x^2} #확률밀도함수
( c <- integrate(pdf, 100,150)) #사건 A가 일어날 확률 , 100~150까지의 정적분

library(MASS)
as.fractions(0.3333333)
( p <- choose(5,2) * (1/3)^2 * (2/3)^3 ) #사건이 발생할 확률
#choose(5,2) : 5개 중에서 2개를 고르는 조합(Combination)
as.fractions(p)





##3_5,,누적분포확률 
#조건문
#x의 분포함수를 그래프로 나타내기 위해 분포함수를 정의함
Px = function(x) {if(x<0) {y = 0}
else if(x<1) {y = 1/4}
else if(x<2) {y = 3/4}
else y = 1
return(y)}

#points()함수 , 좌표평면에 점을 그리는 함수, 이미 생성된 plot에 점을 추가로 그려줌






####이변량분포, 결합확률함수
#add random variable
S <- rolldie(3, makespace = T);S
addrv(S, sum, name='Y')
addrv(S, Z=X3-X2)

#marginal, 확률변수의 주변확률분포를 계산하는 함수


library(prob)
( S = tosscoin(3, makespace = TRUE)) #tosscoin으로 표본공간을 구하고 S 객체에 할당함
Hcount = function(x) sum(x == 'H') #동전의 앞면의 갯수를 구하는 함수를 정의함
( Hcount_x = apply(S[ , c(1:2)], 1, Hcount)) #apply()를 이용하여 처음 두 번(1열과 2열) 동전을 던졌을 때 까지 관찰되는 앞면의 개수를 Hcount_x 객체에 할당함
( Hcount_y = apply(S,1,Hcount))              #apply를 이용하여 세 번 모두 동전을 던졌을 때 관찰되는 앞면의 개수를 Hcount_y 객체에 할당함
( S1 = addrv(S, X=Hcount_x, Y=Hcount_y, name=c("X","Y"))) #addrv를 이용하여 S에 Hcount_x와 Hcount_y를 첨가함

( XY = marginal(S1, var = c("X", "Y"))) #marginal을 이요하여 (x,y)가 중복되지 않는 값을 갖도록 정리함
#X,Y만 추출한다고 보면 됨

#xtabs()를 이용하여 X와 Y의 결합확률분포를 표로 나타냄
#round(probs, 3) probs를 반올림하여 소숫점 아래 3자리까지
( JXY <- xtabs(~ X + Y, data= XY))
( JXY <- xtabs(round(probs,3) ~X+Y, data=XY ))

#P(X>=1, Y>=1)을 구하고, as.fraction을 이용하여 분수로 나타냄
library(MASS)
as.fractions(1 - (JXY[1,1] + JXY[1,2]))
  
#P(X=2)를 구하고 as.fractions을 이용하여 분수로 나타냄
sum(JXY[3,])  
as.fractions(sum(JXY[3,]))
 

#marginal 을 이용하여 X의 주변확률분포를 구함
marginal(XY, vars= 'X')
#marginal 을 이용하여 Y의 주변확률분포를 구함
marginal(XY, vars= 'Y')
