#example_1
#dbinom( 성공횟수, 시행횟수, 성공확률)을 이용하여 이항분포를 구한다.

( S <- dbinom(0,3,1/3)) #성공횟수가 0인 경우
( S <- dbinom(1,3,1/3)) #성공횟수가 1인 경우
( S <- dbinom(2,3,1/3)) #성공횟수가 2인 경우
( S <- dbinom(3,3,1/3)) #성공횟수가 3인 경우

( S <- dbinom(0:3,3,1/3))
( S <- dbinom(c(0,1,2,3),3,1/3)) #성공횟수가 0인 경우

#as.fractions()를 이용하여 소수를 분수로 표현함
library(MASS)
( S <- as.fractions(c(0.29629630 , 0.44444444 , 0.22222222, 0.03703704)))
# 열 이름(변수명)을 출력하기
names(S)
#names()를 이용하여 변수명을 변경(첨가)하여 이항확률분포표의 형태로 나타내자.
( names(S) <- c("0","1","2","3"))
S
names(S)


#example_3
#dbinom(성공횟수, 시행횟수, 성공확률)을 이용하여 이항분포를 구하자.
( S <- dbinom(0:5, 5, 1/2))
( S <- dbinom(c(0,1,2,3,4,5),5,1/2))

#names()를 이용하여 변수명을 변경(첨가)하여 이항확률분포표의 형태로 나타내자.
( names(S) <- c("0","1", "2", "3","4","5"))
S

#pbinom()함수를 이용하여, 이항누적확률을 구하기
library(MASS)
as.fractions( pbinom(2,5,0.5))

#Binom(시행횟수, 성공확률)으로 이항분포를 정의한 후, E( )와 var( )함수를 이용하여 평균과 분산을 구한다.
install.packages("distrEx")
library(distrEx)
BD <- Binom(5,0.5)
BD
as.fractions(E(BD))
as.fractions( var(BD))
