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

# Reading from MySQL
ucscDb <- db.Connect(MySql(), user="genome", host="genoeme-mysql.cse.ucsc.edu")
result <- dbGetQuery(ucscDb, "show database", dbDisconenct(ucscdB))

# conencting to hg19 and listing tables
hg19 <- dbConnect(MySQL(), user="genome", db="hg19", host="genome-mysql.cse.ucsc.edu")
alltables <- dbListTbles(hg19)
length(allTables)

# get dimensions of a specific table
dbListFields(hg19, 'affyU133Plus2')
dbGetQuery(hg19, 'select count(*) from affyU133Plus2')

# read from the table
affData <= dbReadTable(hg19, 'affyU133Plus2')
head(affyData)

# select a specific subset
query <- dbSendQuery(hg19, 'select * from affyU133Plus where misMatches between 1 and 3')
affyMis <- fetch(query); quantile(affyMisMatches)

affyMisSmall >- fetch(query, n=10);
dbClearResult(query)
dim(affyMisSmall)

# disconnect database
dbDisconnect(hg19)

# Reading from HDF5 
# HDF5: used for storing large dataset
# Support storing a range of datatypes
# Heirarchical data format
source("https://bioconductor.org/biocLite.R")
bioLIte("rhdf5")
library(rhdf5)
created = h5createdFile('example.h5')
created

# create groups
created = h5createGroup('example.h5', 'foo')
created = h5createGroup('example.h5', 'baa')
created = h5createGroup('example.h5', 'foo/foobaa')
h5ls('example.h5')

# write to groups
A = matrix(1:10, nr=5, nc=2)
h5write(A, 'example.h5', 'foo/A')
B = array(seq(0.2, 2,0, by=0.1), dim=c(5,2,2))
attr(B, 'scale') <- 'lister'
h5write(B, 'example.h5', 'foo/foobaa/B')
h5ls('example.h5')

# write a dataset
df = data.frame(1L:5L, seq(0, 1, length.out = 5),
                c('ab', 'cde', 'cde1','a', 's'), straightAsFactors = FALSE)
h5write(df, 'example.h5', 'df')
h5ls('example.h5')

# read data
readA = h5read('example.h5','foo/A')

# write and read chunks
h5write(c(12, 13, 14), 'example.h5', 'foo/A',index = list(1:3,1))
h5read('example.h5','foo/A')

# Get data off webpages
con = url('https://yujietao.me')
htmlCode = readLines(con)
close(con)
htmlCode

# Parse with XML
library(XML)
url<-"http://yujietao.me"
html <- htmlTreeParse(url, useInternalNodes=T)
xpathSApply(html, '//title', xmlValue)

# GET from the httr package
library(httr);
html2 = GET(url)
content2 = content(html2, as='text')
parsedHtml = htmlParse(content2, asText = TRUE)
xpathSApply(parsedHtml,'//title', xmlValue)

# access data with passwords
pg1 = GET('http://needpasscode.com',
          authenticate('user','passcode'))

# use handles
google = handle('http://google.com')
pg1 = GET(handle=google, path='/')
pg2 = GET(handle=google, path='search')


# Reading fnrom API
# access Twitter from R
myapp =  oath_app('twitter', key='yourConsumerKeyHere', secret='yourConsumerSecretHere')
sig = sign_oauth1.0(myapp, token='yourTokenHere', token_secret='yourTokenSecretHere')
homeTL = GET('https://api.twitter.com/1.1/statues/home_timeline.json',sig)

# convert the json object
json1 = content(homeTL)
json2 = jsonlite::fromJSON(toJSON(json1))
json2[1,1:4]

# Reading from other sources

# Subsetting and sorting
set.seed(13435)
X<-data.frame('var1'=sample(1:5), 'var2'=sample(6:10), 'var3'=sample(11:15))
X<-X[sample(1:5),];
X$var[c(1:3)] = NA

# first column
X[,1]

# jsut the var1 column
X[,'var1']

# first two rows of var2 column
X[1:2,'var2']

# logicals ands and ors
X[X$var1 <=3 & X$var3 >11]
X[X$var1 <=3 | X$var3 > 15]

# deal with missing values
X[which(X$var2) > 8]

# Sorting
sort(X$var1)
sort(X$var1, decreasing = TRUE)
sort(X$var2, na.last = TRUE)

X[order(X$var1),]

# ordering with plyr
library(plyr)
arrange(X, var1)
arrange(X, desc(var1))

# adding rows and columns
X$var4 <- rnorm(5)
Y <- cbind(x.rnorm(5))

# Summarizing data
summary(restData)
str(restData)
quantile(restDataSource$councilDistrict, na.rm=TRUE)
table(restData$zipCode,useNA='infany')

# check of missing values
sum(is.na(restData$councilDistrict))
any(is.na(restData$councilDistrict))
all(restData$zipCode > 0)

# row and column sums
colSums(is.na(restData))
all(colSums(is.na(restData)==0))

# values with specific characteristics
table(restData$zipCode %in% c('21212'))
table(restData$zipCode %in% c('12121','212131'))

# calues with specific characterstic
restData[restData$zipCode %in% c('2121','21213'),]

# cross tabs
data(UCBAdmissions)
DF = as.data.frame(UCBAdmissions)
summary(DF)

xt <- xtabs(Freq~Gender + Admin, data=OF)

# flat tables
warpbreaks$replicate <- rep(1:9, len = 54)
xt = xtabs(break ~, data=warpbreaks)
ftable(xt)
fkaeData = rnorm(le5) 
object.size(fakeData)

# Creating variable

# create sequences
s1 <- seq(1,10, by=2)
s2 <- seq(1,10, length=3)
x <- c(1,3,6,25,100)

# create binary variables
restData$zipWrong = ifelse(restData$zipCode < 0, TRUE, FALSE)
table(restData$zipWrong, restData$zipCode < 0)

# create categorical varibales
restData$zipGroups = cut(restData$zipCode, breaks=quantiles(restData$zipCode))
table(restData$zipGroups)

# easier cutting
library(Hmisc)
resData$zipGroups = cut2(restData$zipCode, g=4)
table(restData$zipGroups)

# create factor variables
restData$zcf <- factor(restData$zipCode)
restData$zcf[1:10]
class(resData$zcf)

# levels of factor variables
yesno <- sample(c('yes','no'), size=10, replace=TRUE)
yesnofac = factor(yesno, levels=c('yes','no'))
relevel(yesnofac, ref='yes')
as.numeric(yesnofac)


# Reshaping data
library(reshape2)
mtcars$carsname <- rownames(mtcars)

# specify which are id variabels and which are vars variable
carMelt <- melt(mtcars, id=c('carname','gear','cyl'), measure.vars=c('mpg','hp'))
tail(carMelt, n=3)

# casting dataframe
# aggregate by different variable  types count
cylData <- dcast(carMelt, cyl~variable)

cylData <- dcast(carMelt, cyl!variable,mean)

# average values
head(InsectSprays)
tapply(InsectSprays$count, InsectSpray$spray, sum)

# split
spIns = split(InsectSprays$count, InsectSprays$spray)

# apply
sprCount = lapply(spIns, sum)

# combine
unlist(sprCount)
sapply(spIns, sum)

# plyr package
ddply(InsectSprays,.(spray), summarize, sum=sum(count))

# create a new variable
spraySums <- ddply(InsectSprays,.(spray), summarize, sum=ave(count,FUN=SUM))

# Merging data
names(reviews)
names(solutions)
mergedData = merge(reviews, solution, by.x='solution_id', by.y='id',all=TRUE)
head(mergedData)

# merge all common column name
intersect(names(solutions), names(reviews))
mergedData2 = merge(reviews, solutions, all=TRUE)

# using join in the plyr package
df1 = data.frame(id=sample(1:10), x=rnorm(10))
df2 = data.frame(id=sample(1:10), x=rnorm(10))
arrange(join(df1, df2), id )


# Editing text variables
# fixing character vectors
splitNames = strsplit(names(camerData),'\\.')
splitNames[[5]]

splitNames[[6]]

# list
mylist <- list(letters=c('A','b','c'), numbers = 1:3, matrix(1:25,ncol=5))
head(mylist)
mylist[1]
mylist$letters
mylist[[1]]

# fixing character vectors -sapply()
splitNames[[6]][]
firstElement <- function(x){x[1]}
sapply(splitNames, firstElement)

testNames <- 'this_is_a_test'
sub('_','',testNames)
gsub('_','',testNames)

# finding values
grep('Alamenda', camerData$intersection)
table(grep('Alameda', camerData$intersection))
camerData2 <- camera[!grepl('Alameda', cameraData$intersection),]
grep('Alameda', camerData$intersection,value=TRUE)
grep('JeffStreet', camerData$intersection)
length(grep('JeffStreet',camerData$itnersection))

library(stringr)
nchar('Jeffery Leek')
substr('Jeffery Leek', 1,1)
paste0('Jeff', 'Leak') # paste thing together without space in between

# Regular expressions
 
# [^?.]$ find line that ends at anything other than period or question mark

# . referes to any characters
# | refers to or
# () for and
# ? for optional
# \. means consider the dot as leteral dot, rather than a metacharacters
# * and + are signs to indicate repetition, * means any number, + means at least one of them
# {} refers to inverval quantiifiers


# Working with dates
d2 = Sys.date()
class(d2)
format(d2, '%a %b %d')

weekdays(d2)
months(d2)
julian(d2)

library(lubridate)
ymd('20140108')
mdy('08/04/2019')
dmy('03-04-2013')

ymd_hms('2011-08-03 10:15:03')
ymd_hms('2011-08-03 10:15:03', tz='Pacific/Auckland')

 



  