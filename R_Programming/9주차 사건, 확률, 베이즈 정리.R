threetimes <- function(x){     # x : 입력변수이름
  y = 3 *x                     #출력변수를 만드는 명령( 함수 구성)
  return (y)                   #return(출력변수이름)
}

#만들어진 함수를 사용하려면 함수이름과 그 뒤에 괄호 안에 입력값을 넣으면 된다
threetimes(10) #출력값 = 30

#입력변수가 2개의 function 예제 (제곱 합 구하기)
squaresum <- function(x,y){
  z <- x^2 + y^2
  return (z)
}

squaresum(3,4)


#apply 함수는 행렬의 행(1) 또는 열(2)방향으로 특정함수르 적용한다
#apply(array, 방향(1 또는 2), 함수)
#1 : 행, 2 : 열
x <- matrix(1:9, c(3,3)); x
apply (x, 1, function(x) {2*x} )

#예제 11(교재 140p) : 세 개의 동전을 동시에 던질 떄, 뒷면이 적어도 한 개 나올 확률을 구하라
#여사건의 확률
# 1 - (세 개 모두 앞면이 나올 확률) = 뒷면이 적어도 한 개 나올 확률
library(prob)

#tosscoin()으로 표본공간을 구함
( S <- tosscoin(3))

#function()을 이용하여 앞면의 갯수를 세는 함수르 정의함
Hcount <- function(x) {sum(x=="H")}

#subset을 이용하여 모두 앞면이 나오는 사건 Ac를 구함
( Ac <- subset(S, apply(S, 1 , Hcount) == 3 ) )

#참고. 여사건을 이용하지 않고 그냥 확률 구하기
Tcount <- function(x) {sum(x=='T')}
(A <- subset(S, apply(S, 1 , Tcount) >= 1))

#setdiff()를 이용하여 여집합을 구함
(A <- setdiff(S, Ac))

#cat()을 활용하여 서식과 함꼐 여러 객체를 출력함
cat("P(A) = 1 - n(Ac) / n(S) = ", nrow(A), "/", nrow(S), '\n')


#조건부 확률 / 예제1 : 2개의 주사위를 던지는 실험에서 두 주사위의 눈의 합을 X라고 하자
#X가 홀수라고 할때 , X가 8보다 작을 확률을 구하라

#조건부 확률 : 어떤 사건 B가 발생했다는 조건 하에서 다른 특정사건 A가 발생할 확률
#표본공간이 S인 원래 실험으로부터 S의 부분집합인 사건 B를 새로운 표본공간으로 축소한 것
#P(A | B) = A와 B의 교집합의 원소 갯수 / B에 속한 원소 갯수
library(prob)

#rolldie()를 이용하여 , 표본공간을 구함
S <- rolldie(2); S

#subset()을 이용하여, 두 주사위의 눈의 합이 홀수인 사건 B를 구하라
(B <- subset(S, ((X1 + X2) %% 2) ==1))

#subset()을 이용하여, 두 주사위의 눈의 합이 8보다 작은 사건 A를 구하라
( A <- subset(S, X1 + X2 <8))

#intersect()를 이용하여 교집합(사건)을 구함
( AB <- intersect(A,B))

#cat()을 활용하여 서식과 함꼐 여러 객체를 출력함
cat("P(A | B) = P(AB) / P(B) = " , nrow(AB), "/", nrow(B), "\n" )


#다른 방법
S <- rolldie(times = 3, makespace=TRUE); S
#times : 시행횟수
#makespace : 표본공간을 만들지 여부 (각 경우에 대한 확률이 추가됨), 기본값은 FALSE

#Prob(S, event = , given = , )
#확률을 구하는 함수
#S : 표본공간
#evnet : 사건 , 조건
#given : 이러한 조건하에서의 event가 일어날 확률 즉, 조건부 확률  

#예제
S <- rolldie(times = 3, makespace = TRUE)
Prob(S, X1+X1 >9)
Prob(S, X1 + X2 >9, X1+X2+X3 > 7) #조건부 확률

#주사위 예제 1번 다시 풀기 
#또는 표본공간에 확률을 할당한 후, given을 이용하여 조건부 확률을 구할 수 있다
S <- rolldie(2); S
S <- rolldie(times = 2, makespace = TRUE); S 
#rolldie()의 속성을 다 사용한 것과 안한것의 차이는 크지 않다

Prob(S, event=(X1+X2 < 8), given = (X1+X2)%%2 == 1)
Prob(S, event=X1+X2 < 8, given = (X1+X2)%%2 == 1)
Prob(S, X1+X2 < 8, (X1+X2)%%2 == 1) #모두 다 같은 결과

help(Prob)

#as.frations()를 이용하여 분수로 표현함. 오류가 발생하는 경우에는 library(MASS) 실행
library(MASS)
as.fractions( Prob(S, X1 + X2 <8, given = ((X1 + X2) %% 2) == 1)

data() #현재 로드 된 모든 패키지가 제공하는 데이터셋의 목록을 확인하는 함수
data(package = "MASS") #특정패키지가 제공하는 데이터셋의 목록을 확인하는 함수
             




#########독립 사건
#어떤 사건 A가 일어났다는 사실이 사건 B가 일어날 확률에 영향을 미치지 않는 경우
#반대로 사건 B가 일어났다는 사실이 사건 A가 일어날 확률에 영향을 미치지 않는 경우
#P(A | B) = P(A) or P(B | A) = P(B)
#P(A | B) = P(A) =  P(A 교집합 B) / P(B)
#P(A 합집합 B) = P(A) * P(B)


#예제 1에서 사건 A와 B는 서로 독립인가?
library(prob)
S <- rolldie(times = 2, makespace = TRUE)
PA <- as.fractions(Prob(S, event = (X1 + X2 < 8))); PA
PB <- as.fractions(Prob(S, event = (X1 + X2) %% 2 == 1 )); PB
PAB <- as.fractions(Prob(S, event = X1 + X2 <8 & (X1 + X2) %% 2 == 1 )); PAB
PA * PB == PAB
PA * PB - PAB 


################베이즈 정리
#예제 1번
#사전 확률을 prior 객체에 할당함, 무작위로 뽑은 하나의 제품이 불량품인 사건
prior <- c(0.2 , 0.3, 0.5)

#조건부확률(우도)을 객체에 cond 할당함, 각 라인에서 생산된 하나의 상품이 불량품일 확률
cond <- c(0.01, 0.02, 0.03)

#sum()을 이용하여 전확률을 구하고 tot 객체에 할당함 . tot = 전확률
( tot <- sum(prior*cond))
library(MASS)
as.fractions(tot)

#불량품일 확률을 구함
post <- (prior* cond / tot) ; post
as.fractions( post )

#불량품이 라인 A_2에서 생산되었을 확률을 구함, round()를 사용하여 반올림함
round(post[2] ,2)

