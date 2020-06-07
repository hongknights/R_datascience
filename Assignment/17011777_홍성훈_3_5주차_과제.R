####################문제 1 

#(1) : #MASS 패키지 설치여부 확인, UPDATE도 실행하기
library(MASS)
update.packages()

#(2) : MASS패키지 내 iris 데이터의 구조 파악하기
str(iris) 

#(3) : View(iris)를 실행하기
View(iris)

#(4) : iris의 컬럼명을 names(iris)방법말고 다른 것을 사용해서 출력하기
colnames(iris)

#(5) : iris의 Sepal.Length와 Petal.Length를 출력하기
iris$Sepal.Length
iris$Petal.Length


#(6) : iris의 5열(Species)을 제외한 열별 합계와 열별 평균을 구하기. 5열은 명목형이므로 합과 평균의 의미가 없다.
sub1 = iris[-5]
colSums(sub1)
colMeans(sub1)


#(7) : iris의 1열, 3열의 평균을 함께 구하여라.
sub2 = iris[,c(1,3)]
colMeans(sub2)


#(8) : iris의 Species의 데이터를 출력해라
View(iris$Species)


#(9) : Species에 대한 도수, 상대도수, 상대도수의 합을 포함하는 도수분포표를 작성하여라
freq1 = table(iris$Species); freq1      #도수
freq2 = prop.table(freq1); freq2        #상대도수
table <- rbind(freq1, freq2); table     #도수와 상대도수를 포함하는도수분포표 
addmargins(table)                       #도수, 상대도수, 상대도수의 합을 포함하는 도수분포표







###########################문제2

#(1) : iris의 Sepal.Length의 데이터를 출력해라
View(iris$Sepal.Length)


#(2) : Sepal.Length의 데이터를 요약해라
summary(iris$Sepal.Length)


#(3)-1 : Sturges의 공식으로 계급의 수 계산하기
n = 1 + log(150, base=2); n


#(3)-2 : floor(k)을 실행해라. floor(x)는 x를 넘지 않는 최대정수
floor(n);

#(4) : 위에서 구한 값을 계급의 수(floor(k))로 하여 도수, 상대도수, 누적도수, 누적상대도수를 포함하는 연속형 도수분포표를 작성해라
sub = cut(iris$Sepal.Length, breaks=floor(n)) ; sub

freq1 <- table(sub); freq1               #도수
freq2 <- prop.table(freq1); freq2        #상대도수
cumfreq <- cumsum(freq1); cumfreq         #누적도수
cumpropfreq <- cumsum(freq2); cumpropfreq #누적상대도수

table <- rbind(freq1, freq2, cumfreq, cumpropfreq); table   #도수분포표

