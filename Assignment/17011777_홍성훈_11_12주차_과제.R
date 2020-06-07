######문제1
library(prob)

( S <- rolldie(1, makespace = T))
Y <- ( (S$X1-3)^2 )
( S1 <- addrv(S, Y=Y) )
(EY <- sum(S1$Y * S1$probs) )





######문제2
xfx <- function(x) 2*(1-x)*x
xfx_x <- function(x) 2*(1-x)*x^2

( EX <- integrate(xfx, 0,1) )
( EX_X <- integrate(xfx_x, 0,1) )

EX <- as.fractions(0.3333333)
EX_X <- as.fractions(0.1666667)

( EY <- (6*EX + 3*EX_X) )





######문제3
#(1)
( S <- dbinom(5,5,1/5))                 #건강한 사람 5명 모두 감염될 확률

#(2)
( S <- data.frame(X=c(0:5), prob= dbinom(c(0:5),5,1/5)) )

( EX <- sum(S$X * S1$prob) )             #감염자 수의 기댓값

( VX <- sum( (S$X)^2 * S$prob) - EX^2 )  #감염자 수의 분산
( VX <- sum( ( (S$X)- EX)^2 * S$prob))


######문제4 
pbinom(3, 200, 0.01)


######문제5
qpois(0.3, 15, lower.tail = T)

######문제6
#(1)
dnbinom(4,1,0.1)

#(2)
pnbinom(2,1,0.3,lower.tail=T)


######문제7
EX <- 5/0.1; EX                                 #5개의 불량품을 찾아낼 때까지 검사해야 할 제품의 갯수에 대한 기댓값

pnbinom(20,size=5, prob=0.1, lower.tail = F)    #5개의 불량품을 찾아낼 때까지 검사해야 할 제품의 개수가 25개보다 클 확률

######문제8
dnbinom(2,4,0.6)              #시리즈를 우승할 확률

pnbinom(3,4,0.6,lower.tail=T) #시리즈를 우승할 확률

 
