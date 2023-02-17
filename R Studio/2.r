animes <- read.csv('2. Data Visualization/anime.csv', fileEncoding = 'UTF-8-BOM' )

# hapus data null (animali)
animes <- na.omit(animes)

# pie chart (ratio of anime of source)
res.q1 = animes$source

tab1 <- table(res.q1)

pie (
  tab1,
  main = "Anime by source"
)

# pie chart (ratio anime on type)

res.q2 = animes$type

tab2 <- table(res.q2)
pie (
  tab2,
  main = "Anime based by type"
)

#3
res.q3 = animes$aired_from_year
tab3 <- table(res.q3)
plot (
  tab3,
  type = "o"
)

