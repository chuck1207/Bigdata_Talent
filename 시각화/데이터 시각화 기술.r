
y <- c(1,3,5,7,9,11)
plot(y)

# 평균의 선을 긋고 평균임을 명시 
y <- c(2,5,7,12,15,20)
plot(y)
title(main = "연구결과")
title(sub = '2016.11.23')

m <- mean(y)
abline(h=m)
text(3.5, m ,'평균')
text(3.5, 11 ,'평균')

# 작도 디바이스를 열고, 파일명을 지정
png(filename = 'result1.png')

par(mfrow = c(2,2))

# 수직선을 그리는 방법 
y <- c(2,5,7,12,15,20)
plot(y)
title(main = "연구결과")
title(sub = '2016.11.23')

m <- mean(y)
abline(v=2)

# 대각선을 그리는 방법 a = 절편 b = 기울기 y = a+bx
y <- c(2,5,7,12,15,20)
plot(y)
title(main = "연구결과")
title(sub = '2016.11.23')

m <- mean(y)
abline(a = 0,b = 1, col = 'black',lty = 6)

# 작도 디바이스를 닫는다. 이 시점에 파일이 저장 (위치는 작업 디렉토리)
getwd()
dev.off()

# 파일 준비 
df <- read.csv('customer.csv')
head(df)
str(df)

# 특정 컬럼을 벡터형식으로 저장 
xvec <- df$year
yvec<- df$customer

xvec 
yvec 

# 벡터의 각 요소에 접근
xvec[1]
yvec[3]

# 고수준 작도함수
plot(xvec,yvec)

# 저수준 작도함수 
title(main = '판매자료')
m <- mean(yvec)
abline(h = m)
text(2013.5,m+10,'평균')


# 수학함수를 입력 데이터로 
par(mfrow = c(2,2))
plot(sin)
plot(cos)
plot(tan)

# 100개의 난수에 대한 그래프
plot(rnorm(100))

plot(runif(n = 100, min = 0, max = 10))

x <- c(1,2,3,4,5,6)
y <- c(2,5,7,12,15,20)

plot(x,y,xlab = 'time',ylab = "effect",type = 'b', pch = 0)

x <- c(1,1,1,1,1,1,2,4,3,3,3,5,2,6,7,8,6,6,7,9,10,10,20,13,13,13,13,13)
hist(x)
hist(x,breaks = 8)

dona <- c(10000,20000,50000,40000,40000,40000,40000,30000,10000,10000)
hist(dona)
boxplot(dona)

x <- c(1,2,2,1,3,3,1,5)
hist(x)
barplot(x)

d1<- c(1,2,2,1,3)
d2 <- c("a",'b','c','d','e')

barplot(d1,names.arg = d2)

menu <- c("짜장면","짬뽕","우동","볶음밥","탕수육","짜장면","짜장면","우동","볶음밥","짜장면","탕수육",
         "우동","짜장면","볶음밥","탕수육","짜장면","짬뽕","짜장면","짬뽕")

menu_freq <- table(menu)
barplot(menu_freq)

x <- c(1,2,2,1,3,3,1,5)
pie(x)

pie(table(x))

par(mfrow = c(2,2))
sales <- c(5,19,12,9,7,29,15)
pie(sales)
x2 <- c("김무현","이희연","장흥식","노천수","박만연","최성락","김홍식")
pie(sales)
#정확한 수치를 명시하기 위해 label을 사용
pie(sales,label = sales)
# 수치와 판매사원에 대한 정보를 동시에 제공하기 위해 label과 paste를 활용
pie(sales,label = paste(x2,sales))


sales <- c("김영희","오영란","박춘길","조성해","윤득호","오미영","오영란","오미영",
          "김영희","윤득호","조성해","김영희","박춘길","박춘길","오미영","윤득호")

sales_freq <- table(sales)

pie(sales_freq)

# barplot(),pie() 로 그려지는 기본 그래프는 쉽고 유용하지만 보충정보가 필요 

x <- c(1,2,2,1,3,3,1,4) #자료업리겨
x2 <- table(x)
bp <- boxplot(x2)

percent <- (x2/sum(x2)*100)

text(x = bp, y = x2,labels = percent)
text(x = bp, y = x2,labels = percent,pos = 1)


x <- c(1,2,2,1,3,3,1,5)
x2 <- table(x)


install.packages("RColorBrewer")



library(RColorBrewer)
pal <- brewer.pal(12,'Set3')
bp <- barplot(x2,col = pal)
percent <- round(x2/sum(x2)*100, digit = 1)
text(x = bp, y = x2 - 0.1, labels = percent)





color <- c('black',"white","pink")
ea <- c(5,2,3)
barplot(ea, names.org = color)
pie(ea,labels = color)

# 나무지도를 만드는 라이브러리 
install.packages("treemap")
library(treemap)

data(GNI2014)

head(GNI2014)

treemap(GNI2014,
    index = c("continent","iso3"),
    vSize = 'population',
    vColor = 'GNI',
    type = 'value' ,
    bg.labels = 'yellow')


inedx = c("continet",iso3)

type = 'value'

# 대륙별 인구, 소득 구하기
GNI2014$GNI.total <- GNI2014$population*GNI2014$GNI

# 국가별 국민 총소득을 대륙별로 합계내서 GNI2014로 저장
GNI2014.a <- aggregate(GNI2014[,4:6],
                      by=list(GNI2014$continent),sum)

#대륙별 합계를 대륙 인구수로 냐눔
GNI2014.a$GNI.percap <- GNI2014.a$GNI.total/GNI2014.a$population

GNI2014.a

treemap(GNI2014.a,
    index = c("Group.1"),
    vSize = 'population',
    vColor = 'GNI.percap',
    type = 'value',
    bg.labels = 'yellow')


# 버블차트

library(MASS)

head(UScrime)

radius <- sqrt(UScrime$Pop)

symbols(UScrime$U2, UScrime$y, #원의 x,y좌표값
       circles = radius, # 원의 반지름
       inches = 0.3, # 원의 크기 조절값
       fg = 'white', #원의 테두리 값
       bg = 'lightgray', #원의 바탕색 
       lwd = 1.5, #원의 테두리선 두께
       xlab = 'unemployment 35-39 males',
       ylab = 'crime rate',
       main = 'UScrime Data')

text(UScrime$U2, UScrime$y,
    1:nrow(UScrime),
    cex = 0.8,
    col = 'brown')

df <- read.csv("Seoul_temp_2017.csv")

head(df)
summary(df)

boxplot(df$avg_temp,
       col = 'yellow',
       ylim = c(-20,40),
       xlab = '서울 1년 기온',
       ylab = '기온')

# 월별 평균 기온 계산
month.avg <- aggregate(df$avg_temp,by = list(df$month),median) [2]

# 평균 기온 순위 계산(내림차순)

odr <- rank(-month.avg)

#월별 기온 분포 
boxplot(avg_temp~ month, data = df,
       col = heat.colors(12)[odr],
       ylim = c(-20,40),
       ylab = "기온",
       xlab = '월',
       main = '서울 월별기온분포(2017)')

#matrix 형태로 데이터가 존재하는 경우 
hospital <- read.csv("hospital.csv")
head(hospital)
table(hospital)
mosaicplot(~freq + stay, data = hospital, color = TRUE, 
          main = '병원내원빈도 vs 치료기간')

mosaicplot(~freq + stay, data = hospital, color = c("green","blue","red"),
          main = '병원내원빈도vs치료기간')

# 두가지 방법으로 모자이크 플롯 그리기 
# 1
mosaicplot(~ freq + stay, data = hospital, color = T)

# 2 
tbl <- table(hospital)
mosaicplot(tbl,data = hospital, color = T)

#3차원 교차표 형태로 데이터가 존재하는 경우 
mosaicplot(Titanic,main = 'Survival on the Titanic',
           color= c("red",'green'), off = 3)

# plot을 만드는 여러가지 방법 
x <- c(1,2,3,4,5,6)
y <- c(2,5,7,12,15,20)
plot(x,y,xlab = 'time',ylab = 'effect')
library(ggplot2)
# 심미성이 높음 
qplot(x,y,xlab = 'time',ylab = 'effect')
# ggplot의 경우 df형태이어야 한다. 
df <- data.frame(time = x,effect = y)
ggplot(df,aes(x = time,y = effect)) + geom_point()

# ggplot의 두가지 스타일 

#스타일 1
ggplot(df,aes(x = time, y = effect)) + geom_line()

# 스타일2
ggplot() + geom_line((df,aesx = time, y = effect)) + .. 

# 스타일1은 단일 그래프를 그릴때, 스타일 2는 여러 그래프를 하나로 겹쳐 그릴때 편리 

ggplot(data = iris, aes(x = Petal.Length,y = Petal.Width)) + geom_point()

ggplot() + geom_point(data = iris, aes(x = Petal.Length, y = Petal.Width),
                     color = 'red')

# geom_point() 옵션 적용하기 

gp <- ggplot(data = iris, aes(x = Petal.Length, 
                              y = Petal.Width))  + geom_point(aes(color = Species, shape = Species),alpha = 0.5, size = 2)
gp

time <- c(1,2,3,4,5,6)
effect <- c(2,5,7,12,15,20)
effect2 <- c(1,3,5,8,11,18)
plot(time, effect , type = 'l')
lines(time,effect2,col = 'red')

df <- data.frame(time, effect, effect2)
ggplot() + geom_line(
    data = df,aes(x = time,y = effect)) + geom_line(
    data = df,aes(x = time, y = effect2),col = 'red') + geom_point(
    size = 2.7,color = 'white')

df <- read.csv('heightweight.csv',header = T)

head(df)

ggplot() + geom_line(data = df, aes(x = df$ageMonth,y = df$height, colour = df$sex))

ggplot() + geom_point(data = df, aes(x = df$ageMonth,y = df$height, colour = df$sex))

df = data.frame (table(mtcars$carb))
df
ggplot(df,aes(x = Var1, y = Freq) ) + geom_bar(stat = 'identity', width = 0.7, fill = 'steelblue')

# 박스플롯 그리기 

ggplot() + geom_boxplot(data = iris,
                       aes(x = Species, y = Petal.Length,fill = Species))

# 누적 영역 그래프 그리기 
data <- read.csv("uspopage.csv")
head(data)
ggplot(data, aes(x = Year, y = Thousands)) + geom_area()
ggplot(data, aes(x = Year, y = Thousands,fill = AgeGroup)) + geom_area()


df <- read.csv('electricity.csv')
head(df)
ggplot(df, aes(x = Year,y = Usage, fill = Part)) + geom_area()

ggplot(df, aes(x = Year, y = Usage, fill = Part)) + geom_area() + scale_fill_brewer(breaks = rev(levels(data$Part)))
