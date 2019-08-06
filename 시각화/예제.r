
library(treemap)

df <- read.csv('국회의원_선거구_유권자수.csv',stringsAsFactors = F)
head(df)

str(df)

treemap(df,
       index = c("시도","선거구명"),
       vSize = '선거인.수',
       vColor = '선거인.수',
       type = 'value')

head(df)

df2<- df  %>% 
    group_by(시도) %>% 
    summarise(선거인수 = sum(선거인.수))

treemap(df2,
       index = c("시도"),
       vSize = '선거인수',
       vColor = '선거인수',
       type = 'value')

df <- state.x77
df <- as.data.frame(df)
head(df)

symbols(df$Income,df$Illiteracy,
       circles = sqrt(df$Population),
       inch = 0.4,
       fg = 'white',
       bg = 'lightgray')

text(df$Income,df$Illiteracy,
    1:nrow(df),
    cex = 0.8,
    col = 'red')

# 월별 기온을 boxplot으로 작성하시오 
df <- airquality
head(airquality)

month_avg <- aggregate(df$Temp, by = list(df$Month),mean) [2]
month_avg

odr <- rank(-month_avg)
boxplot(Temp ~ Month, data = df,
       col = heat.colors(5) [odr],
       main = 'Different boxplots for each month')

# 월별 풍속을 boxplot으로 작성하시오 
month_avg <- aggregate(df$Wind, by = list(df$Month),mean) [2]
month_avg
odr <- rank(month_avg)
boxplot(Temp ~ Month, data = df,
       col = heat.colors(5) [odr],
       main = 'Different boxplots for each month')

df <- HairEyeColor
head(df)
mosaicplot(df,color = c('yellow','green'),off = 1)

santa <- data.frame(belief = c("no belief","no belief","no belief","no belief",
                              "belief","belief","belief","belief",
                              "belief","belief","no belief","no belief",
                              "belief","belief","no belief","no belief"),
                   sibling = c("older brother","older brother","older brother","older sister",
                              "no older sibling","no older sibling","no older sibling","older sister",
                              "older brother","older sister","older brother","older sister",
                              "no other sibling",'older sister','older brother',"no other sibling"))
        

santa

mosaicplot(santa,color = c('yellow','green'),off = 1, main = 'mosaic')

df <- state.x77
head(df)

df <- as.data.frame(df)
head(df)

library(ggplot2)

ggplot() + geom_point(data = df ,aes(x = Income, y = Illiteracy))

df <- mtcars
head(df)

df = data.frame(table(df$gear))
df

ggplot() + geom_bar(data = df, aes(x = Var1, y = Freq),stat = 'identity')

df <- airmiles
airmiles <- as.numeric(df)
year <- c(1937:1960)
df2 <- data.frame(year,airmiles)
df2

ggplot() + geom_line(data = df2,aes(x = year, y = airmiles ))

ggplot() + geom_boxplot(data = iris,
                       aes(x = Species, y = Petal.Width,fill = Species))
