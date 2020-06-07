#######문제 1번
library(ggplot2) #라이브러리함수를 통해 설치된 패키지를 불러옴
x <- table(diamonds$cut)
barplot(x,main = "등급별 분포", xlab='다이아몬드 등급',ylab='해당 등급별 갯수', col=rainbow(length(x)), col.axis ='black', col.main='brown')


(y = table(diamonds$clarity))
pie(y, main='Clarity', col=rainbow(length(1:8)) ,radius = 1.1)


#######문제 2번
library(MASS)
str(iris)
stem(iris$Sepal.Length)
boxplot(iris$Sepal.Width, col='skyblue')
hist(iris$Petal.Length, breaks=nclass.FD(iris$Petal.Length), col='magenta', main = 'Petal Length의 길이별 분포도', xlab='Petal.Length의 계급',ylab='계급별 분포')


#######문제 3번
#공공데이터 출처 : 통계청 
#경찰관 수 - (URL : http://kosis.kr/statHtml/statHtml.do?orgId=110&tblId=DT_11001N_2013_A051)
#인구 천명당 범죄발생건수 - (URL : http://kosis.kr/statHtml/statHtml.do?orgId=101&tblId=DT_1YL3001)

#우리나라의 각 광역시,도별 경찰관 수와 범죄발생횟수,인구천명당 범죄피해 발생건 수를 이용하여 서로의 상관관계 파악
print("우리나라 각 광역시,도를 중심으로 범죄발생횟수와 경찰관들의 비율이 어느 정도 상관관계가 있는 지 파악하려 합니다. 데이터의 정확성을 높이기 위해 두 데이터에 모두 존재하는 2017년 데이터를 기준으로 진행하겠습니다.")
police <- read.csv("C:/Users/user/Documents/R/R-Programming/data/경찰관수_20200509213200.csv", stringsAsFactors=F); police
crime <- read.csv("C:/Users/user/Documents/R/R-Programming/data/인구_천명당_범죄발생건수_시도__20200509203037.csv", stringsAsFactors=F); crime

region = c(police[4:20,1])                             #어떤 광역시.도의 데이터가 있는 지 확인
region = c(region[ -8]); region                        #세종특별자치시의 경우는 데이터가 존재하고 있지 않기 때문에 삭제

new_police1 = police[4:20, 3, drop=F]                      #2017년 각 광역시, 특별시의 경찰관 수
new_police1 = new_police1[-8, , drop=F]; new_police1       #세종특별자치시의 경우는 데이터가 존재하고 있지 않기 때문에 삭제
colnames(new_police1)=c("경찰 수")
rownames(new_police1)=region; new_police1

new_crime <- crime[ 3:18, 12, drop=F]; new_crime      #2017년 각 광역시 ,특별시의 범죄 발생 횟수
colnames(new_crime)=c("범죄 발생횟수")
rownames(new_crime) = region; new_crime

cp = as.integer(c(new_crime$`범죄 발생횟수`)) / as.integer(c(new_police1$`경찰 수`)); cp #확인결과 두 벡터 모두 수치가 아니어서 강제 형변환을 해서 나누기 시도

par(mfrow=c(1,3))   #구글링으로 그래프 여러개 그릴 떄 사용하는 함수를 찾아냄

result = cbind(new_crime, new_police1, "범죄 수 / 경찰 수"=cp); result  #2개의 데이터프레임 병합

barplot(result$`범죄 수 / 경찰 수` , xlab='각 광역시,도', ylab='비율', main='각 광역시,도별 범죄 수 / 경찰 수', names=region, horiz=F, col=rainbow(length(region)))
print("확인 결과 , 각 특별시, 광역시를 중심으로 봤을 떄 범죄 발생횟수를 경찰관의 수로 나우었을 떄, 경기도와 전라남도, 전라북도를 제외하고는 서로 크게 차이나는 곳은 없었습니다. 그렇다면 이제 인구 천명당 범죄발생건수와 비교해보도록 하겠습니다.  ")

new_crime_2 <- crime[ 3:18, 11, drop=F]          #2017년 인구 천 명당 범죄 발생건수
rownames(new_crime_2) = region; new_crime_2 
barplot(as.integer(new_crime_2$X2017), xlab = '각 광역시,도', ylab = '인구 천 명당 범죄 발생건수', main = '각 광역시,도별 인구 천명당 범죄 발생건수', names=region, col=rainbow(length(region)))

new_police2 = police[4:20, c(2,3), drop=F]                 #각 광역시, 특별시의 경찰관 수
new_police2 = new_police2[-8, , drop=F]                    #세종특별자치시의 경우는 아직 데이터가 없기 때문에 삭제
colnames(new_police2)=c("각 광역시,도별 시민 수" , "각 광역시,도별 경찰 수")
rownames(new_police2)=region; new_police2 

cp2 = as.integer(c(new_police2$`각 광역시,도별 시민 수`))/ as.integer(c(new_police2$`각 광역시,도별 경찰 수`)); cp2   #각 광역시,도별 시민 수 / 경찰 수
barplot(cp2, xlab='각 광역시,도', ylab='비율', main='각 광역시,도별 시민 수 / 경찰 수', names=region, horiz=F, col=rainbow(length(region)))

print("이렇게 봤을 때, 첫 번째 그래프와 두 번째 그래프의  상관관계는 존재하지 않는 것을 볼 수 있다.")
print("하지만 첫 번째 그래프와 세 번째 그래프의 양상은 매우 흡사하다는 판단을 할 수 있다.")
print("즉, 각 광역시,도의 시민에 대한 경찰의 비율이 높을 수록 각 광역시,도에서 발생한 범죄 수에 대한 경찰의 비율도 높아진다고 생각할 수 가 있다")
print("결론 : 한 지역의 경찰 1인당 시민의 수가 크다면 그 지역에서 발생한 범죄 횟수도 큰 모습을 띄는 것을 알 수 있다.")

      