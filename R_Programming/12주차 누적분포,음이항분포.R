#example_1
#푸아송분포

#dpois(발생건수, 평균)을 이용하여 포아송분포로부터 P(X=2)를 구한다.
dpois(2,1)

#포아송분포그래프
win.graph(7,6)
plot(dpois(x=c(0,1,2,3,4,5), lambda=1), main="Poisson distribution, lambda=1", type='h', col = "Orange")


#example_2
#푸아송 분포
#ppios(분위수, 평균발생건수)을 이용하여 포아송분포로부터 P(X<=2)를 구한다.
ppois(2,5)

#다음은 누적분포함수 ppois()의 결과와 같다.
sum(dpois(x=c(0:2), lambda = 5))

#pbinom(분위수, 시행횟수, 성공확률)을 이용하여 이항분포로부터 P(X<=2)를 구하여 비교한다.
pbinom(2,50000,0.0001)

#lambda=5인 포아송분포에서 임의로 100개의 데이터를 추출한다.
rpois(100,5)
mean(rpois(100,5))
mean(rpois(100,5))
mean(rpois(100,5))
mean(rpois(100,5))

#example_1
#누적확률분포 (이항확률)

#확률분포함수(x=실패횟수, p=성공확률)
dgeom(0,1/6); dgeom(1,1/6); dgeom(2,1/6);
dgeom(3,1/6); dgeom(4,1/6); dgeom(3,1/6);

#기하분포그래프
win.graph(7,6)
plot(dgeom(x=c(0,1,2,3,4,5), 1/6), main="Geometric distribution", type='h', col = "Orange")

#pgeom(분위수, 성공확률)을 이용하여 기하분포로부터 P(X<=6)를 구한다.
pgeom(5,1/6)
sum(dgeom(x=c(0:5), 1/6))

#성공확률이 1/6일  때, 누적확률이 0.5가 될 때가지의 실패한 횟수이다. 이산확률분포이기 때문에 누적확률이 0.5 이상인 x중 최소값을 반환한다.
qgeom(0.5,1/6)

# 성공확률이 1/6인 기하분포에서 임의로 100개의 데이터를 추출한다.(실패한 횟수)
rgeom(100, 1/6) 
mean(rgeom(100, 1/6))  # 실패한 횟수의 평균 
mean(rgeom(100, 1/6)+1)  # 처음으로 성공할 때까지 시행한 횟수의 평균 
mean(rgeom(1000, 1/6)+1) 
mean(rgeom(1000, 1/6)+1) 
mean(rgeom(1000, 1/6)+1) 
mean(rgeom(1000, 1/6)+1) 

var(rgeom(1000, 1/6)+1)


#example_4
#음이항분포
# 확률분포함수 (x=실패횟수, size=달성할 성공 횟수, prob=성공확률) dnbinom(0, 3, 0.52)  # 3번째 경기에서 우승할 확률 
dnbinom(1, 3, 0.52)   # 4번째 경기에서 우승할 확률 
dnbinom(2, 3, 0.52)   # 5번째 경기에서 우승할 확률 
dnbinom(3, 3, 0.52)  ? 
  
dnbinom(x=0:2, size =3, prob=0.52) #0~2번 실패하고, 3번 성공할 확률 # 누적분포함수 (q=분위수, lower.tail=T) 

pnbinom(2, 3, 0.52)    # A팀이 경기에서 우승할 확률 

sum (dnbinom(x=0:2, size =3, prob=0.52)) 

# 누적확률이 0.4인 누적확률변수 X(실패한 횟수) 
qnbinom(0.4, size=3, prob=0.52)

# 음이항 확률변수(n=난수의 개수) 임의 추출 
rnbinom(100, 3, 0.52) 
mean(rnbinom(100, 3, 0.52)) ; mean(rnbinom(100, 3, 0.52)+3) 
var(rnbinom(100, 3, 0.52))
