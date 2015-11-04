# diretorio de trabalho

setwd("~/Documents/Research/Cursos/Coursera/Big Data em Saúde no Brasil/Extra")

# pacotes necessarios

library("tm")
library("wordcloud")

# local do corpus

corpora <- file.path("~/Documents/Research/Cursos/Coursera/Big Data em Saúde no Brasil/Extra", "corpus")

# leitura do corpus

doc <- Corpus(DirSource(corpora))
summary(doc)

# preparacao do corpus

doc <- tm_map(doc, removePunctuation)
doc <- tm_map(doc, removeNumbers)
doc <- tm_map(doc, tolower)
doc <- tm_map(doc, removeWords, stopwords("portuguese"))
doc <- tm_map(doc, stripWhitespace)
doc <- tm_map(doc, removeWords, c("olá", "nome", "todos", "boa", "sobre", "abraços", "paulo", "anos", "aqui", ""))
doc <- tm_map(doc, PlainTextDocument)

# document term matrix

dtm <- DocumentTermMatrix(doc)
inspect(dtm)

# frequencia de palavras

freq <- sort(colSums(as.matrix(dtm)), decreasing=TRUE)   
head(freq, 10) 

# wordcloud

set.seed(142)
wordcloud(names(freq), freq, min.freq=20)
