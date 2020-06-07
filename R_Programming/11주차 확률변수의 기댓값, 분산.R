#example_1
intall.packages("prob")
#"prob"패키지 불러오기
library(prob)
#tosscoin을 이용하여 표본공간을 생성
S <- tosscoin(3, makespace = T); S
# 앞면의 개수를 세는 함수를 정의
Hcount <- function(x) sum(x=='H')
#확률변수 X의 정의 => apply()함수를 행별로 적용
( X <- apply(S, 1 , Hcount))


#addrv()을 이용하여 S에 확률변수 X를 추가하자
( S1 <- addrv(S , X=X, name=c("X")))
#marginal()을 이용하여 X의 주변확률분포를 구함
( S2 <- marginal(S1, var=c("X")))
#X의 기댓값을 구한다.
  (S2$X * S2$probs)
  (EX <- sum(S2$X * S2$probs))
  (EX <- sum(S2[,1] * S2[,2]))
  
#분수로 표현하기
  library(MASS)
  as.fractions(EX)
  

  
#example_2
  #확률밀도함수에 x를 곱하여 객체에 할당함
  xfx <- function(x) x*2*x
  #기댓값을 구한다.
  ( EX <- integrate(xfx, 0,1))
  #분수로 표현하기
  library(MASS)
  as.fractions(0.6666667)

#example_4
  #library()함수를 이용하여 패키지 "prob"을 불러오기
  library(prob)
  #rolldie()를 이용하여 표본공간 S를 구하기
  ( S <- rolldie(2, makespace = T))
  # 두 주사위 눈의 합에 100을 곱한 확률변수 Y를 정의하자.
  Y <- 100*(S$X1+ S$X2)
  #addrv()을 이용하여 , 두 주사위 눈의 합에 100을 곱한 확률변수 Y를 정의하자
  ( S1 <- addrv(S, Y=Y))
  ( S1 <- addrv(S, Y=(X1 + X2)*100))
  #확률변수 Y의 기댓값을 구하기
  (EY <- sum(S1$Y * S1$probs))
  (EY <- sum(S1[,3] * S1[ ,4]))
  
#example_5
  #library()함수를 이용하여 패키지 "prob"을 불러오기
  library(prob)
  #rolldie()를 이용하여 표본공간 S를 구하기
  ( S <- rolldie(2, makespace = T))
  # 두 주사위 눈의 합인 확률변수 X를 정의하자.
  X <- S$X1 + S$X2
  #addrv()을 이용하여, 표본공간 S에 확률변수 X를 추가하자.
  ( S1 <- addrv(S, X=X))
  ( S1 <- addrv(S, X = (X1+X2)))
  #확률변수 X의 기댓값을 구하기
  ( EX <- sum(S1$X * S1$probs))
  ( EX <- sum(S1[,3] * S1[,4]))
  #확률변수 X의 분산을 구하자.
  ( VX <- sum( ( (S1$X)- EX)^2 * S1$probs))
  ( VX <- sum( S1$X^2 * S1$probs) - EX^2)
  
  as.fractions(5.833333)
  
  