factor(x,level,ordered) #x는 factor로 표현하고자 하는 데이터
#(주로 문자열벡터로 지정. c("상","중","하","중","상")
#levels : 값의 레벨
#ordered : TRUE면 순서형, FALSE면 명목형 데이터를 뜻한다 . 기본값을 FALSE 형
#반환값을 factor형 데이터 값이다.
 

x <- factor(c("yes", "no", "no","yes","yes")); x

x <- c("yes", "no", "no", "yes", "yes")
y <- factor(x); y #8행과 같은 결과
str(y) # y객체의 구조확인
#"no"는 1로 "yes"는 2으로 왜냐하면 no가 yes보다 알파벳 순서가 앞에 있으니 no먼저 1 ,yesr가 2

x<-factor(c("보통이다", "보통이다","매우 그렇지 않다", "그렇다", "매우 그렇다")); x
str(x) #x객체의 구조확인, 4개의 레벨 "그렇지 않다" 포함 X
#한글은 알파벳 순으로 번호 할당

x<-factor(c("보통이다", "보통이다","매우 그렇지 않다", "그렇다", "매우 그렇다"), level=c("매우 그렇지 않다", "그렇지 않다", "보통이다", "그렇다", "매우 그렇다")); x
#level을 정해줌 , 순서가 있다. 5개의 레벨 "그렇지 않다"가 레벨에는 있지만 조사되지 않았음을 알 수 있다.
str(x)

BloodType <- c("A", "B", "AB", "O", "O", "A","A","O","B","B")
BloodType <- factor(BloodType); BloodType

summary(BloodType)
#factor형 데이터의 summary, 도수 분포(일종의 통계요약)를 알려줌
#factor형 데이터에서는 객체가 각각의 level마다 몇 개의 데이터가 존재하는 지 알 수 있다. 일종의 도수

gender <- c(2,1,2,2,1,2,1,2,1,2); str(gender)
summary(gender) 
#수치형 데이터의 summary, 일종의 통계 유형을 알려줌
#수치형 데이터에서는 최솟값 min, 제1사분위수(데이터를 4등분 했을 떄 가장 첫 번째 데이터, 4분의 1에 위치), 중앙값(제2사분위수) median, 평균 mean, 제3사분위수(데이터를 4등분 했을 떄 세 번째 데이터, 4분의 3에 위치), 최댓값 max

gender <- factor(gender); gender #factor 생성함수, 수치형데이터를 factor형으로 변환
gender <- as.factor(gender); gender #데이터의 유형을 강제변환, 35행과 동일한 결과
is.factor(gender); #데이터유형을 알려주는 함수 is.factor()

summary(gender)

gender <- c(2,1,2,2,1,2,1,2,1,2);
gender <- factor(gender,levels=c(1,2), labels=c("male", "female")); gender
# level과 level에 따른 명칭인 label을 부여
summary(gender)
#factor형이니깐 summary함수 사용하면 도수분포를 파악가능
