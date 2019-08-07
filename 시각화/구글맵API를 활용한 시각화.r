
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



#마커, 텍스트 출력 
gc <- geocode(enc2utf8("용인")) # 지역명을 경도와 위도로 변환
cen <- as.numeric(gc) # 경도와 위도를 숫자로 전환
map <- get_googlemap(center = cen,
                     maptyep = 'roadmap',
                     markers = gc) # 지정된 지역의 구글 지도를 가져온다. 
ggmap(map) # 지도의 중심점 지정


#여러 지역에 마커 표시하기: 제주도 관광지 
names <- c("용두암","성산일출봉",'정방폭포',"중문관광단지","한라산 1100고지","차귀도")
addr <- c("제주시 용두암길 15",
          '서귀포시 성산읍 성산리',
          "서귀표시 동홍등 299-3",
          "서귀포시 중문동 2624-1",
          '서귀포시 색달동 산1-2',
          '제주시 한경면 고산리 125')

gc <- geocode(enc2utf8(addr)) #주소를 위도 경도로 변경 

df <- data.frame(name = names, # 데이터 프레임 형태로 저장 
                 lon = gc$lon,
                 lat = gc$lat)

df

# 여러 지역에 마커 표시하기: 제주도 관광지 
cen <- c(mean(df$lon),mean(df$lat)) #위도와 경도의 평균값을 지도의 중심에 위치하기 위함 
map <- get_googlemap(center = cen,
                     maptype = 'roadmap',
                     zoom = 10,
                     size = c(640,640),
                     marker = gc)

# 명소이름을 지도위의 표시 
gmap <- ggmap(map)

gmap + geom_text(data = df,
                 aes(x = lon,y =lat+0.05),
                 size = 5,
                 label = df$name)

df <- quakes
head(df)

cen<- c(mean(df$long),mean(df$lat))
gc <- data.frame(lon = df$long,lat = df$lat)
# 구글맵에서는 경도가 180도를 넘는 경우 0 ~ -180도사이로 변환 그러므로

gc$lon <- ifelse(gc$lon > 180,-(360-gc$lon),gc$lon)
head(gc)

map <- get_googlemap(center = cen,
                      maptype = 'roadmap',
                      zoom = 4)

gmap <- ggmap(map)

gmap + geom_point(data = df,
                  aes(x = long, y = lat,size = mag),
                  alpha = 0.5)


ggmap(map) + theme(axis.title.x =element_blank(),
                   axis.text.x =element_blank(),
                   axis.ticks.x =element_blank(),
                   axis.title.y =element_blank(),
                   axis.text.y =element_blank(),
                   axis.ticks.y =element_blank())
