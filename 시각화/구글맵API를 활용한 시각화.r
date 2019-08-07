
df <- read.csv('hit.csv',stringsAsFactors = F,header = T)
avg <- df$average
name <- df$name

barplot(avg,names.arg = name)

library(ggplot2)

df <- read.csv('hit.csv',stringsAsFactors = F,header = T)
avg <- df$average
name <- df$name

# 시각화가 되지않은 단순 산점도
ggplot(df, aes(x = avg, y = name)) + geom_point()

# 데이터를 정렬하여 산점도를 생성

ggplot(df, aes(x = avg, y = reorder(name,avg))) + geom_point(size = 3)

# 연결선 추가

ggplot(df, aes(x = avg, 
               y = reorder(name,avg))) + geom_point(size = 3) +geom_segment(aes(yend = name),xend = 0) + ylab('name')

## 공공데이터 + 관서별 + 방화 + 발생

df <- read.csv('fire.csv')
head(df)

install.packages("ggmap")

library(ggmap)

register_google(key='본인의 구글맵API 코드')

map <- get_map("Seoul",zoom = 10, maptype = 'roadmap')
map <- ggmap(map)
map

map + geom_point(aes(x = LON, y = LAT, color = y2011,size = y2011),data = df)

gc <- geocode(enc2utf8("용인")) # 지역명을 경도와 위도로 변환
cen <- as.numeric(gc) # 경도와 위도를 숫자로 전환
map <- get_googlemap(center = cen) # 지정된 지역의 구글 지도를 가져온다. 
ggmap(map) # 지도의 중심점 지정

gc <- geocode(enc2utf8("설악산"))
cen <- as.numeric(gc)
map <- get_googlemap(center = cen, zoom = 8,
                    size = c(640,480),
                    maptype = 'hybrid')
ggmap(map)

# 경도와 위도를 알고 있을때 
cen <- c(-118.233248,34.085015)
map <- get_googlemap(center=cen)
ggmap(map)
