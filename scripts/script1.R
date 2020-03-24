#zaĹ‚adowanie bibliotek
library(tm)

#zmiana katalogu roboczego
workDir <- "C:\\Users\\mateu\\OneDrive\\Dokumenty\\GitHub\\TextMining11S"
setwd(workDir)

#definicja katalogĂłw funkcjonalnych
inputDir <- ".\\data"
outputDir <- ".\\results"
scriptsDir <- ".\\scripts"
workspacesDir <- ".\\workspaces"
dir.create(outputDir, showWarnings = FALSE)
dir.create(workspacesDir, showWarnings = FALSE)

#utworzenie korpusu dokmentĂłw
corpusDir <- paste(
  inputDir, 
  "Literatura - streszczenia - oryginał",
  sep = "\\"
)
corpus <- VCorpus(
  DirSource(
    corpusDir,
    pattern = "*.txt",
    encoding = "UTF-8"
  ),
  readerControl = list(
    language = "pl_PL"
  )
)

#wstÄ™pne przetwarzanie
corpus <- tm_map(corpus, removeNumbers)
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, content_transformer(tolower))
stoplistFile <- paste(
  inputDir, 
  "stopwords_pl.txt",
  sep = "\\"
)
stoplist <- readLines(stoplistFile, encoding = "UTF-8")
corpus <- tm_map(corpus, removeWords, stoplist)
corpus <- tm_map(corpus, stripWhitespace)

#wyĹ›wietlenie zawartoĹ›ci pojeedynczego dokumentu
writeLines(as.character(corpus[[1]]))
writeLines(corpus[[1]]$content)
  
  
  
  
  

