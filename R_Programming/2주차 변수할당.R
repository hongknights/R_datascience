x <- 3
x
x <- -5
x #기존에 만들어 놓았던 변수에 다른 값을 할당하면 기존값에 덮임
assign('x', 3)
x
rm(x) #remove의 약자, 변수에 저장된 값 삭제
x #그러므로 에러가 발생되며 출력 x 

x1 <- pi #pi = 원주율
x1
mode(x1);class(x1); class(pi) #세미콜론은 명령아가 끝났음을 의미, 동시실행가능, 한줄에 하나의 명령문의 경우 사용안해도 됨
is.numeric(x1) ; is.numeric(pi) ; is.integer(pi) #데이터 유형 학인
x1 <- as.integer(x1) #데이터 유형 변경 , as.유형명()
class(x1)
x1 <- as.double(x1)
mode(x1)
is.double(pi); is.integer(pi)

x <- -8
x/3
as.integer(x/3); as.integer(-8/3)

x <- "Big data"
class(x)
x <- as.factor(x) #데이터 유형 변경
mode(x)

x <- True
x <- T
x

x <- TRUE; y <- FALSE #TRUE or T 만 인식 나머지(true, True)는 그냥 변수
as.numeric(x); as.numeric(y) #TRUE는 1, FALSE는 0

x <- NULL
is.null(x)
is.null(1)
is.null(NA)

x1 <- 80
x2 <- 90
x3 <- 75
x4 <- NA
is.na(x4)
x5 <- x1+x2+x3+x4 #x5에도 x4 저장
is.na(x5) #그러므로 TRUE  출력




