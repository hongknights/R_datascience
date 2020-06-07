###########문제 1
library(prob)
library(MASS)
S <- rolldie(times = 2)
A <- subset(S, X1 + X2 == 3 | X1 + X2 == 6)
cat("P(A) = n(A) / n(S) = ", nrow(A),"/", nrow(S))

############문제 2
S <- c(1:30)
S = data.frame(S); S
A <- subset(S, (S%%4) ==0 | (S%%9) ==0)
cat("P(A) = n(A) / n(S) = ", nrow(A) , "/", nrow(S))


############문제 3
All <- c(5,5,5)   #주머니 마다 5개씩 공 존재
White <- c(1,2,3) #주머니 마다 다른 하얀색 공
 
Prior <- White/All; Prior                 #주머니 마다 하얀색 공이 선택될 확률
Prior <- 1/length(All) * Prior ; Prior    #주머니 하나를 선택하고 꺼낸 공이 하얀색일 확률

as.fractions(Last <-  Prior[3] / sum(Prior)) #하얀 공이 추출되었다는 조건하에서 추출된 하얀 공이 번 주머니에서 나왔을 확률




#############문제 4
age <- c(0.15, 0.24, 0.26, 0.20, 0.15)
A <- c(0.58, 0.52, 0.04, 0.4, 0.35)

#4-(1)
(Prob_A <- age * A)
sum(Prob_A)

#4-(2)
(Last <- Prob_A / sum(Prob_A))
as.fractions(Last)



##############문제 5번
S <- rolldie(3)
count_1 = function(x) sum(x==1) #1의 갯수를 세는 함수를 정의, 단지 함수를 정의한 것 뿐
( X <- apply(S,1,count_1)) 

#확률분포표
X.prob = table(X) / (6^3)

#그래프
plot(X.prob, type='h', col="blue", xlab='주사위 3번 던졌을 때 1의 개수', ylab = '확률', main ='주사위 3번 던지는 실험에서 1의 눈이 관찰된 횟수의 확률')




###############문제 6번
f <- function(x) {9 - x^2}

#상수 c 결정
( c <- integrate(f,-3,3)) 
c = 1/36

#P(x >= 2)
P_2 = function(x) {c* f(x)} 
(Result <- integrate(P_2,2,3))
as.fractions(0.07407407)



###################문제 7번
S <- rolldie(2); S

#7-(1)
X <- apply(S,1, sum); X
table(X)


#7-(2)
f_y <- function(x1 , x2) { abs(x1 - x2)}
Y = f_y(S$X1 , S$X2)
table(Y)

#7-(3)
S <- rolldie(2, makespace =T ); S
S_XY <- addrv(S, X=X, Y=Y ); S_XY

XY <- marginal(S_XY, var=c('X', 'Y')); XY
(probs_XY <- xtabs(round(probs,2) ~ X + Y, data=XY))



  