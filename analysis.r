setwd("~/Documents/Research/Cursos/Coursera/Big Data em Saúde no Brasil/Extra")

library("tm")
library("wordcloud")

corpora <- file.path("~/Documents/Research/Cursos/Coursera/Big Data em Saúde no Brasil/Extra", "corpus")

doc <- Corpus(DirSource(corpora))
summary(doc)

doc <- tm_map(doc, removePunctuation)
doc <- tm_map(doc, removeNumbers)
doc <- tm_map(doc, tolower)
doc <- tm_map(doc, removeWords, stopwords("portuguese"))
doc <- tm_map(doc, stripWhitespace)
doc <- tm_map(doc, removeWords, c("olá", "nome", "todos", "boa", "sobre", "abraços", "paulo", "anos", "aqui"))
doc <- tm_map(doc, PlainTextDocument)

dtm <- DocumentTermMatrix(doc)
inspect(dtm)

freq <- sort(colSums(as.matrix(dtm)), decreasing=TRUE)   
head(freq, 14) 

set.seed(142)
wordcloud(names(freq), freq, min.freq=20)

