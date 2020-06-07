library(MASS) #MASS라는 패키지를 불러옴
str(Cars93) #MASS패키지의 Car93 데이터셋을 불러와서 자료구조 파악
str(Cars93$Price) #데이터셋 내부에서 Price라는 변수를 불러옴
print(Cars93$Price) 
summary(Cars93$Price) #객체의 자료구조 파악

#연속형 자료는 도수분포표를 위해서 구간을 나누어야 하며, 이를 계급이라고 함
help(cut) #cut이라는 함수에 대한 설명

cut(Cars93$Price, breaks=7) #cut(객체, 몇개의 구간으로 나눌건지) '('-열린구간 , ']'-닫힌구간
Price <- cut(Cars93$Price, breaks=7); Price
freq <- table(Price); freq #각 구간에 속하는차량가격 변수의 유형별 빈도수
propfreq <- prop.table(freq); propfreq   #상대도수분포표, 이산형 자료의 상대도수분포표 표현과 동일
propfreq <- round(propfreq, 3); propfreq #객체를 소숫점 아래 3자리에서 반올림

table <- rbind(freq, propfreq); table #도수와 상대도수의 행 결합
addmargins(table) #행끼리의 합, 열끼리의 합을 추가 (여기서 열의 합은 의미가 없다)
table <- addmargins(table, margin=2); table #도수의 합. 상대도수의 합
#그냥 addmargin을 사용하면 열끼리 의 합이 의미가 없음에도 출력이 되서 행의 합만 출력되도록 수정
#margin=1은  행의 합 ,margin=2는 열의 합 
#왜 열의 합으로 되는거지? 왜냐면 데이터가 하나의 열벡터로 구성되어 있음
#쉽게 얘기하면 벡터로 표현하면 열과 행이 뒤바뀌어표현되어 있음, 열벡터의 관점에서 봐야함
#도수가 밑으로 쫙 있고 그 옆에 상대도수가 밑으로 쫙 있는 걸 상상할 것

#연속형 자료이므로 누적도수 또는 누적상대도수는 cumsum()함수를 이용
cumfreq <- cumsum(freq); cumfreq #객체의 누적도수
cumpropfreq <- cumsum(propfreq); cumpropfreq #누적상대도수

#위의 예에서는 계급의 개수를 입력하여 구간을 나눴지만, 구간은 직접 break포인트를 설정하여 임의로 설정 가능
cut(Cars93$Price, breaks = c(1,10,20,30,40,50,60,70))
table(cut(Cars93$Price,  breaks = c(1,10,20,30,40,50,60,70)))
