월급 <- c(360, 420, 480, 320,465,390); sort(월급)
월급 <- c(360, 420, 480, 320,465,390); order(월급)

 x<-data.frame(성별=c('M', 'F', 'M', 'F','F', 'M'), 월급= c(360, 420, 480, 320,465,390), 지출=c(320, 270, 260, 280, 350, 230)); x
str(x)
sort(x$월급)
order(x$월급)
x$월급

x <- x[order(x$월급),]; x
rownames(x) <- NULL; x
x <- x[order(x$성별, x$월급), ]; x
x <- x[order(x$월급, x$성별), ]; x
x <- x[order(x$성별, -x$지출), ]; x #성별에 따른 지출의 내림차순
x <- x[order(x$성별, -x$지출, decreasing=T), ]; x #성별은 내림차순, 지출은 오름차순
x <- x[order(x$성별, x$지출, decreasing=T), ]; x #성별에 따라 지출이 내리차순이됨

x<-data.frame(성별=c('M', 'F', 'M', 'F','F', 'M'), 월급= c(360, 420, 480, 320,465,390), 지출=c(320, 270, 260, 280, 350, 230)); x
y = cbind(x, list(나이=c(35,29,33,30,31,34))); y #x의 오른쪽열에 나이 열추가
y = cbind(x, 나이=c(35,29,33,30,31,34)); y #x의 오른쪽열에 나이 열추가
y = cbind(x, 나이=c(35,29,33,30,31,34), 도시=c('서울', '울산', '수원,','전남','용인','죽전')); y   
y[,-4] #y의 4번쨰 열을 제외한 모든 데이터프레임

x = data.frame(key=c('룩셈부르크', '스위스','노르웨이', '아일랜드', '아이슬란드', '미국', '덴마크' ,'오스트레일리아', '스웨덴', '네덜란드'),GDP=c(114340,82839,81807,77450,73191,62641,60596,57305,54112,52978)); x
y = data.frame(key=c('아이슬란드', '덴마크','룩셈부르크', '노르웨이', '한국', '영국','네덜란드','스웨덴','독일','에스토니아'), 인터넷=c(99.0,97.6,97.1,96.5,95.9,94.9,94.7,92.1,89.7,89.4))
merge(x,y) #두 데이터프레임의 공통적인 부분만 병합, KEY 가나다라순 정렬되서 나옴
merge(x,y, all=T) #X,Y의 키를 모두 합친 부분이 병합, 없는 부분은 결측치(NA)로 출력됨, KEY값 가나다라순 정렬되서 나옴
merge(x,y, all.x=T) #X의 키를 기준으로 병합됨 , KEY 가나다순
merge(x,y, all.y=T) #Y의 키를 기준으로 병합됨, KEY 가나다순

read.table("http://itpaper.co.kr/demo/r/grade.txt", sep='\t', header=T, na.strings=" ", 
           fileEncoding="euc-kr")

grade <- read.table("http://itpaper.co.kr/demo/r/grade.txt", sep='\t', fileEncoding="euc-kr") ; grade

grade <- read.table("http://itpaper.co.kr/demo/r/grade.txt", sep='\t', 
                    header=T, na.strings=" ", fileEncoding="euc-kr") ; grade

KOSPI <- read.csv("~/R/R-Programming/data/코스피지수.csv", stringsAsFactors=F); KOSPI
str(KOSPI) 

##install.packages("readxl") #라이브러리 설치, 한번만 하면됨
library() #명령어를 실행시키면 설치된 패키지를 검색할수 있다
.libPaths() #명령어로 현재 패키지가 설치된 디렉토리를 확인할 수 있음
library(readxl) #책(readx1)패키지를 (도서관)library에 등록
getwd() #파일경로확인
setwd("C:/Users/user/Documents/R/R-Programming") #파일경로지정

download.file("https://www.incheon.go.kr/comm/getFile?srvcId=MFNewInfo&upperNo=2039191&fileTy=ATT ACH&fileNo=1", "인천-마스크-공적-판매처-현황.xlsx", mode='wb') 
mask <- read_excel('~/R/R-Programming/data/인천-마스크-공적-판매처-현황.xlsx', sheet="우체국"); mask

KOSPI <- read.csv("~/R/R-Programming/data/코스피지수.csv", stringsAsFactors=F); KOSPI
컬럼이름 <- names(KOSPI); 컬럼이름
크기 = dim(KOSPI); 크기
상위데이터 = head(KOSPI, 10); 상위데이터 #head()는 데이터의 상위 6개 항목을 보여주는 명령어, 데이터의 갯수는 임의로 지정가능, 고로 10행까지 출력, 10x7행렬
하위데이터 = tail(KOSPI, 3); 하위데이터 #하위 6개, 지금은 지정해서 하위3행까지 출력,3x7행렬
View(KOSPI) #명령어를 사용하면 데이터를 새창에서 볼수 있음
print(KOSPI$등락률) #KOSPI에서 등락률이라는 열을 전부 나열
KOSPI$등락률
KOSPI[1, ] #1행을 모두 출력
KOSPI[c(1,3) , ] #1행,3행을 모두 출력
KOSPI[1,c('시작일기준가', '종료일종가')] #1행에서 해당열에 해당하는 항목출력
KOSPI[1,3] #1행에서 3열만 출력
