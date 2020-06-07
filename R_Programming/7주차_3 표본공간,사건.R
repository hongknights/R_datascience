install.packages("prob")
library(prob) #설치한 패키지를 라이브러리를 이용하여 prob(probablity) 불러오기
tosscoin(2) #tosscoin()이라는 표본공간을 구함, 괄호 내에는 시행횟수
tosscoin(3) #동전을 3번던지는 표본공간

install.packages("ggplot2")
library(ggplot2) #라이브러리함수를 통해 설치된 패키지를 불러옴
str(diamonds) #패키지에 내장된 데이터의 구조 파악, 각각의 열에 53940개의 데이터가 존재
View(diamonds) #데이터의 갯수가 워낙 많을 경우 View를 사용하여 데이터를 본다.

#######선별기준 조건이 하나일 떄
subset(diamonds, cut=='Premium')
#객체와 선별기준에 해당하는 데이터만 추출함 (등호 기호 2개에 주의)
subset(diamonds, cut=='Fair')

#######선별기준 조건이 두 개 이상일 떄
#'또는' 조건을 적용하기 위해선 c나 | (쉬프트+\)로 묶어줘야함
#묶어주지 않을 경우 쉼표 다음의 조건이 select인 것으로 오인하여 요류가 남
subset(diamonds, c(cut=='Premium', cut=='Fair') ) #오류 발생, 
subset(diamonds, cut=='Premium' | cut=='Fair' )
subset(diamonds, cut=='Premium' | color=='E')

#여러 조건을 만족시켜야하는 '그리고'조건은 &을 사용해 적용 가능
subset(diamonds, cut=='Premium' & color=='E')


####### select
##### 하나의 열만 선택
# select로 지정한 열만 반환
subset(diamonds, cut=='Premium' & color=='E', select=clarity)

#####두 개 이상의 열 선택
# c로 묶어주거나 ':'사용
subset( diamonds, cut=='Premium' & color=='E', select=c(clarity, price) )
subset(diamonds, cut=='Premium' & color=='E', select=clarity:price)

library(prob)
rolldie(1)
( S <- rolldie(1)) #rolldie()를 이용하여 표본공간을 구함
S = rolldie(1)

nrow(S) #표본공간 원소의 개수

#subset()함수를 이용하여, X1을 2로 나눈 나머지가 0인 사건 A를 구함
( A <- subset(S, X1 %% 2==0)) #X1 %/% 2 , X1을 2로 나눈 몫
nrow(A) #사건 A의 원소의 개수

nrow(A)/nrow(S) #사건 A가 일어날 수학적 확률
cat("P(A)=n(A)/n(S)=", nrow(A)/nrow(S), "\n")
cat(" 사건 A가 일어날 확률은 " , nrow(A)/nrow(S), "이다", "\n")

#X1을 2로 나눈 나머지가 0인 사건 B를 구함
( B <- subset(S, X1 %% 2 ==1))
#X1을 3으로 나눈 나머지가 0인 사건 C를 구함
( C <- subset(S, X1 %% 3 ==0))

#예제5
#] 1에서 9까지 숫자가 하나씩 적힌 개의 공이 들어 있는 주머니에서 한 개의
#공을 꺼내는 시행을 한다. 꺼낸 공에 적힌 숫자가 홀수인 사건을 A, 8의 약수인 사건
#을 B, 3의 배수인 사건을 C라고 할 때 다음을 구하여라.

#c()를 이용하여 표본공간을 객체 S에 할당함
S <- c(1:9); S

#A,B,C 사건을 각각 구함
A = subset(S, S%%2==1); A
B = subset(S, 8%%S==0); B #8의 약수를 구해서 집합으로 저장하는 것
C = subset(S, S%%3==0); C


# (1) union()을 이용하여 합집합(사건)을 구함
union(A,B) #union = 합집합을 계산
subset(S, S%%2==1 | 8%%S==0) #subset을 사용하여 합집합을 계산
#홀수이거나, 8의 약수인 것을 집합로으 만들어라

# (2) intersect()를 이용하여 교집합(사건)을 구함
intersect(A,C) #intersect = 교집합을 게산
subset(S, S%%2==1 & S%%3==0) #subset을 사용하여 교집합을 계산
#홀수이고, 3의 약수인 것을 집합으로 만들어라

# (3) intersect()를 이용하여 교집합을 구하며, integer(0)는 공집합을 의미
intersect(B,C)
subset(S, 8%%S ==0 & S%%3==0)

# (4) setdiff()를 이용하여 여집합을 구함
setdiff(S,A)
subset(S, S%%2!=1)

# (5) setdiff()를 이용하여 여집합을 구함
setdiff(S,B)
subset(S, 8%%S !=0)

# (6) setdiff()를 이용하여 여집합을 구함
intersect( setdiff(S, A) , setdiff(S,B))
subset(S, S%%2 !=1 & 8%%S !=0)

setdiff(S, union(A,B)) #DeMorgan's Laws
