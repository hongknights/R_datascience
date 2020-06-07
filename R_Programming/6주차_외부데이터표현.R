library(MASS)
str(quakes) #객체의 구조확인 , 1000개의 관찰값, 5개의 변수
View(quakes) #V는 대문자에 유의
data(quakes); quakes #data 출력 (200개만 출력됨, 800개는 생략됨)
str(quakes)
head(quakes,200) #1행~200행까지 출력 (상위 200개)
tail(quakes, 200) #하위 200개
summary(quakes$mag) #qukes라는 데이터프레임의 mag라는 열에 접근해서 요약한 값

hist(quakes$mag, breaks=seq(4,6.5,by=0.5), right=F, main = '지진의 진도 분포', xlab='진도',ylab='발생횟수')
#객체(대상)에 breaks는 끊어달라는 의미 여기서는 4~6.5까지 0.5단위로 끊어달라는 것
#right=F break의 첫번쨰 범위표시숫자(4) 대신 마지막 범위표시 숫자(여기서는 6.5)를 포함할지 여부, F=포함X(~이상 ~미만), T=포함O(~초과~이하) 
#main 은 히스토그램의 제목을 나타냄
#xlab 은 x축의 명칭
#ylab 은 y축의 명칭
#히스토그램의 기본적인 형태

hist(quakes$mag, breaks=seq(4,6.5,by=0.5), right=F, main = '지진의 진도 분포', xlab='진도',ylab='발생횟수', col="grey",border='white')
#색상추가 
#히스토그램 꾸미기

hist(quakes$mag, breaks=seq(4,6.5,by=0.3), right=F, main = '지진의 진도 분포', xlab='진도',ylab='발생횟수', col="palegreen",border='white')
#색상 추가,출력 구간 간격변경 
#히스토그램 꾸미기

####################막대그래프
x<-c(14.5,17.9,23.4,16.1) #데이터 벡터
label<-c('영업 A팀', '영업 B팀','영업 C팀', '영업 D팀') #위 데이터 하나하나에 대한 명칭
barplot(x, horiz=T, width=5,
        xlim=c(0,25),
        col=rainbow(length(x)),
        xlab='매출(억원)',ylab='영업부',
        names.arg=label, 
        main='2019년도 영업팀별 매출')
#막대그래프 구현
#막대를 가로로 세운 그래프
#barplot함수 사용
#데이터객체, horiz 는 막대를 가로로 놓을 지 , 기본값은 F
#width는 막대하나하나의 폭, 너비
#xlim 은 막대그래프에서 x축의 길이를 지정 , x축 길이 0~25
#col은 컬러, 여기서는 x축의 길이(막대의 갯수)에 따라 무지개색상으로
#names.arg 는 히스토그램 막대 개별 하나하나의 이름, 데이터를 이름으로 구분해주는 역할

barplot(x, 
        ylim=c(0,25),
        col=rainbow(length(x)),
        xlab='영업부',ylab='실적(억원)',
        names.arg=label, 
        main='2019년도 영업팀별 매출')
#막대를 세로로 세운 그래프
#데이터객체, horiz 는 막대를 가로로 놓을 지 , 기본값은 

###################그룹화된 bar차트
x<-c(14.5,17.9,23.4,16.1)
y<-c(2.1,3.1,4.9,2.9)
chart <- rbind(x,y) #두 벡터의 행 결합
barplot(chart,
        main='연도별 영업부 매출',
        xlab='영업부',ylab='매출(억원)',
        ylim=c(0,50),
        col=c('Orange', 'Dodger Blue'),
        legend.text=c('2019년', '2020년 4월 현재'))
#객체 = 두 벡터를 행결합 한 것
#그래프의 이름
#y축 범위 0~50
#color x(2020년)는 오렌지 y(2019년)는 블루
#범례를 표시

##############################원형그래프
library(MASS) #라이브러리 실행
data(Cars93) #data를 가져옴
str(Cars93) #구조 파악
table(Cars93$Type) #객체 유형마다의 데이터 갯수, 즉 도수 출력

pie(table(Cars93$Type)) #원형그래프 출력

table(Cars93$Cylinders) #객체 유형마다의 데이터 갯수, 즉 도수 출력
x <- table(Cars93$Cylinders)

pie(x, main='실린더 수',col=rainbow(length(x)),paste(round(x/sum(x)*100), '%'),radius = 0.5)
#radius= 원형그래프의 반경 (원형그래프의 크기)    


############################3차원 원형그래프
install.packages('plotrix') #3차원 pie chart
library(plotrix)
x<-table(Cars93$Cylinders)
pie3D(x, main='실린더 수') #기본값만 부여
pie3D(x, main='실린더 수', explode=0.2) 
#explode 속성으로 그래프 각 조각들을 분리할 수 있음
#explode 숫자가 커질수록 분리되는(벌어지는) 정도 커짐


########################줄기, 잎 그림

#stem()함수로 생성가능
x <- read.table("C:/Users/user/Documents/R/R-Programming/data/english.txt")
#텍스프 파일을 경로를 이용해 읽어옴
is.list(x)
is.data.frame(x)
str(x)

x <- unlist(x) #벡터로 변환
is.vector(x)
#파일을 읽었을 떄 기본값은 리스트 또는 데이터프레임으로 갖고 옴. 
#cvs나 txt 둘 다 해당됨
#기본적인 통계함수들은 벡터에는 작동하지만 리스트에는 작동X
#그러므로 벡터 형식으로 바꿔줘야 함

stem(x) #줄기 잎 그림 표현
#십의 자리 수만 따로 줄기로 분류, 일의 자리 수는 잎

x<-read.table("C:/Users/user/Documents/R/R-Programming/salary.txt")
x<-unlist(x)
stem(x)
#백의 자리+십의 자리수가 줄기, 일의 자리수가 잎

#정수만 표현가능한가? 소수눈 안되는가? 외부데이터를 사용해보자
str(mtcars)
View(mtcars)
stem(mtcars$mpg) #mtcars의 mpg열을 줄기 잎 그림으로 출력
#소숫점 위 첫째 자리까지 즉 정수부분을 잎으로 소수부분을 잎
#이제 알았다. 잎은 마지막 한자리만 표현