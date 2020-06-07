data <- data.frame("답"=c("좋다", "보통이다", "싫다", "무응답", "합"), "도수"=c(71,42,28,9,150)); data
data$상대도수 <- round(data$도수/150,3) #data에 상대도수라는 열 추가
#3은 반올림하여 소숫점 3자리까지
data

data <- data.frame("답"=c("좋다", "보통이다", "싫다", "무응답", "합"), "도수"=c(71,42,28,9,150)); data
상대도수 <- round(data$도수/150,3)
data <- cbind(data, 상대도수) #data에 상대도수라는 열을 병합한다
data

#데이터프레임으로 도수분포표를 만들었을 떄의 단점을 알아보자
sum(data$도수); sum(data$상대도수) #각각의 합 계산 가능
c(sum(data$도수), sum(data$상대도수)) #벡터로도 각각의 합 표현 가능
#어려움 존재

library(MASS) #MASS라는 패키지를 불러옴
str(Cars93) #MASS패키지의 Car93 데이터셋을 불러와서 자료구조 파악
str(Cars93$Type) #데이터셋 내부에서 Type이라는 변수를 불러옴

#이산형 도수분포표
freq <- table(Cars93$Type); freq #'차종형태'변수의 유형별 도수
propfreq <- prop.table(freq); propfreq #상대도수분포표
propfreq <- round(propfreq,3); propfreq # propfreq객체를 소수점 아래 3자리에서 반올림

table <- rbind(freq, propfreq); table #도수와 상대도수의 행 결합
addmargins(table) #table 객체의 행과 열의 합 (여기서 열의 합, 도수와 상대도수의 합은 의미가 없음)
table <- addmargins(table, margin=2); table
#그냥 addmargin을 사용하면 열끼리 의 합이 의미가 없음에도 출력이 되서 행의 합만 출력되도록 수정
#margin=1은  행의 합 ,margin=2는 열의 합 
#왜 열의 합으로 되는거지? 왜냐면 데이터가 하나의 열벡터로 구성되어 있음
#쉽게 얘기하면 벡터로 표현하면 열과 행이 뒤바뀌어표현되어 있음, 열벡터의 관점에서 봐야함
#도수가 밑으로 쫙 있고 그 옆에 상대도수가 밑으로 쫙 있는 걸 상상할 것