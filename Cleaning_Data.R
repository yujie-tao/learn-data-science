# Raw data vs. processed data

# Get data
# getwd()
# relative: setwd('./data').setwd('../')
# absolute: setwd('/User/yujiet/data')

# create a directory if not exist
if(!file.exists('data')){
  dir.create('data')
}

fileUrl <- 'https.//data.com'
download.file(fileUrl, destfile = './data/hello.csv', method = 'curl') # need to specify as curl method for https site
dateDownloaded <- date() # track the download date 

read.table()
read.csv()
read.csv2()

# Reading local file
cameraData <- read.table('./data/cameras.csv', sep = ',', header=TRUE)

# Reading Excel files
library(xlsx)
cameraData <- read.xlsx('./data/cameras.xlsx',sheetIndex=1, header=TRUE)
head(cameraData)

colIndex <- 2:3
rowIndex <- 1:4
camerDataSubset <- read.xlsx('./data/camera.xlsx', sheetIndex=1, colIndex=colIndex, rowIndex=rowIndex)

# Reading XML
library(XML)
fileUrl <- 'http://www.yujietao.xml'
doc <- xmlTreeParse(fileUrl, useInternal=TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)
rootNode[[1]]
rootNode[[1]][[1]] # first node inside the root node

# XPath
# /node Top level node
# //node Node at any level
# node[@attr-name] Node with an attribute name

xpathApply(rootNode, '//name', xmlValue)

fileUrl <- 'http://www.yujietao.xml'
doc <- xmlTreeParse(fileUrl, useInternal=TRUE)
scores <- xpathApply(doc, "//li@class='score'", xmlValue)
teams<- xpathApply(doc, "//li@class='team-name'", xmlValue)

# Reading JSON
library(jsonlite)
jsonData<- fromJSON('https://yujietao.me')
names(jsonData)
myjson <- toJSON(iris, pretty = TRUE)
cat(myjson)

# data.table
# inherets from data.frame
# written in C so it is so much muster
# much, much faster at subsetting, group and updating
library(data.table)
DF = data.frame(x=rnorm(9), y=rep(c('a','b','c'), each=3),z=norm(9))
head(DF,3)
tables() # see all data tables in memory

# calculating values for variables with expresion
DT[,list(mean(x),sum(z))]

# adding new columns
DT[,w:=z^2]

# multiple operations
DT[,m:={tmp <- (x+z); log2(tmp+5)}]
DT[,a:x>0]
DT[,b:=mean(x+w), by=a]

set.seed(123)
DT <- data.table(x=sample(letters[1:3], 1E5, TRUE))
DT[,.N, by=x]

# keys
DT <- data.table(x=rep(c=rep(c('a','n','c')),each=100, y=rnorm(300)))
setkey(DT,x)
DT['a']

DT1 <- data.table(x=c('a','a','b','dt1'), y=1:4)
DT2 <- data.table(x=c('a','b','dt2'), z=5:7)
setkey(DT1,x); setkey(DT2,x)
merge(DT1, DT2)

# fast reading
fread(file)




