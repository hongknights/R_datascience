sort(c(45, 37, 40, 41, 47, 41, 45, 51, 42, 44, 45, 32, 46, 42, 43, 47, 49, 39,
       50, 41)) #데이터를 오름차순으로 정렬
order(c(45, 37, 40, 41, 47, 41, 45, 51, 42, 44, 45, 32, 46, 42, 43, 47, 49, 39,
        50, 41)) 
# 자료를 오름차순으로 정렬했을 떄의 순위, 위 결과와 같이 보면 이해 됨

x <- c(45, 37, 40, 41, 47, 41, 45, 51, 42, 44, 45, 32, 46, 42, 43, 47, 49, 39,
       50, 41)
quantile(x) 
# 4분의수, quantile의 사용법(사분위수를 계산하는 9가지 유형)
# 0% : 데이터의 최솟값
# 25% : 제1사분위수, 1/4에 해당하는 데이터
# 50% : 제2사분위수, 2/4에 해당하는 데이터, 중앙값(43과 44의 평균)
# 75% : 제3사분위수, 3/4에 해당하는 데이터
# 100% : 데이터의 최댓값


? quantile # help(quantile)

quantile(x, probs=0.4) # 제20백분위수, numeric vector of probabilities with values in [0,1].
median(x) #데이터의 중앙값 (43과 44의 평균)

IQR(x) # 사분위수의 범위 = 제3사분위수(75%) - 제1사분위수(25%)

# boxplot( ) 함수를 사용하여 상자그림으로 나타냄
boxplot(x, main="고혈압 환자의 나이", col="skyblue") 
#대상, main = 그래프나 그림의 타이틀, col = 색깔
#수직형 상자 #상자에서 뻗어나가는 선 : 수염이라고 함
#멀리 떨어져있는 점 : 이상점

boxplot(x, horizontal=TRUE, main="고혈압 환자의 나이", col="skyblue")
#수평 상자 #상자에서 뻗어나가는 선 : 수염이라고 함
#멀리 떨어져있는 점 : 이상점

str(mtcars) #R에 내장된 데이터
#명목형데이터 : 0이나 1로 표현되는 경우 상자형으로는 의미가 없고
#수치형으로는 의미가 있음

boxplot(mtcars, main="연비", col="GreenYellow")
#mtcars의 11개 변수에 대한 boxplot
#상자에서 뻗어나가는 선 : 수염이라고 함
#멀리 떨어져있는 점 : 이상점

boxplot(mtcars$mpg, main="연비", col="GreenYellow")
#mtcars의 mpg 변수에 대한 box plot
#상자에서 뻗어나가는 선 : 수염이라고 함
#이상치가 없는 데이터도 존재