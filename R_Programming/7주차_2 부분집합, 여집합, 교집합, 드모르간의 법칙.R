intall.packages("prob")
library(prob) #library()를 이용하여  prob 불러오기
tosscoin(2) #tosscoin을 이용하여 표본공간을 구함
tosscoin(3)

install.packages("ggplot2")
library(ggplot2)
str(diamonds)  #10개의 변수를 갖고 있는것을 확인 가능
View(diamonds) 

subset(diamonds, cut == 'Premium')
subset(diamonds, cut == 'Fair')

# '또는' 조건을 적용하기 위해선 c나 | 로 묶어 주어야함
subset(diamonds, c(cut =='Premium', cut == 'Fair')) #오류로 출력 X

subset(diamonds, cut=='Premium' | cut == 'Fair')
subset(diamonds, cut=='Premium' | color=='E')

#여러 조건을 만족시켜야하는 '그리고' 조건은 &을 사용
subset(diamonds, cut== 'Premium' & color=='E')

#select로 지정한 열만 반환
subset(diamonds, cut =='Premium' & color=='E', select = clarity)

#2개 이상의 열을 선택하는 경우 c로 묶어주거나 ':' 사용
subset(diamonds, cut =='Premium' & color=='E', select = c(clarity , price))
subset(diamonds, cut =='Premium' & color=='E', select = clarity : price)


#예제4
library(prob)
rolldie(1)
( S <- rolldie(1)) #rolldie()를 이용하여 표본공간을 구함
nrow(S) #표본공간 원소의 갯수

S = rolldie(1)
elements(S)
nrow(S) #표본공간 원소의 갯수

#subset() 함수를 이용하여 X1을 2로 나눈 나머지가 0인 사건 A를 구할 수 있음
( A <- subset(S, X1 %% 2 ==1)) # cf) X1 %/%2 : X1를 2로 나눈 몫
nrow(A)

nrow(A) / nrow(S) #사건 A가 일어날 수학적 확률
cat("P(A) = n(A) / n(S) = ", nrow(A) / nrow(S) , "\n") 
#R에서 문자열은 스칼라, 벡터, 행렬 등으로 저장된다
#cat() 함수 : 문자열을 합쳐서 출력하는 함수
cat("사건 A가 일어날 확률은 ",nrow(A) /  nrow(S) , "이다.", "\n")

#X1을 2로 나눈 나머지가 1인 사건 B를 구함
( B <- subset(S, X1 %% 2 ==1))

#X1을 3로 나눈 나머지가 0인 사건 C를 구함
( C <- subset(S, X1 %% 3 ==0))



#예제 5
library(prob)
S <- c(1:9); S   #c()를 이용하여 표본공간을 객체 S에 할당함

#A,B,C 사건을 각각 구함
A = subset(S, S %% 2 ==1); A
B = subset(S, 8%%S == 0); B
C = subset(S, S %% 3 ==0); C

# (1) union()을 이용하여 합집합(사건)을 구함
union(A, B)
subset(S, S %% 2 == 1 | 8 %% S ==0) #순서의 차이만 있지 위의 줄과 같은 결과

# (2) intersect()를 이용하여 교집합(사건)을 구함
intersect(A,C)
subset(S, S %% 2 == 1 & S %% 3 ==0)

#(3) intersect()를 이용하여 교집합을 구하며, integer(0)은 공집합을 의미
intersect(B, C)
subset(S, 8%% S ==0 & S %% 3 ==0)


#(4) setdiff()를 이용하여 여집합을 구함
setdiff(S,A)
subset(S, S %% 2 != 1)

#(5) setdiff()를 이용하여 여집합을 구함
setdiff(S,B)
subset(S, 8%%S != 0)


#(6) setdiff()를 이용하여 여집합을 구함
intersect(setdiff(S,A), setdiff(S,B))
subset(S, S %% 2 != 1 & 8 %% S != 0)
setdiff(S, union(A,B))    #드모르간의 법칙


