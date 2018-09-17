# Packages for data cleaning
library(tm)
library(SnowballC)

# Pachage for splitting of data into training and test sets
library(caTools)

# Package for using CART Model
library(rpart)
library(rpart.plot)

# Package for using Random Forest models
library(randomForest)

# Package for using multinomial logistic regression
library(nnet)

# Package for using naive bayes
library(e1071)

# Reading the data set
dataset2 = read.csv('dataset2.csv', stringsAsFactors = FALSE)
dataset2$Polarity = as.factor(dataset2$Polarity)
# Formation of a corpus 
corpus = Corpus(VectorSource(dataset2$Review))

# DATA CLEANING
corpus = tm_map(corpus,tolower)
corpus = tm_map(corpus,removePunctuation)
corpus = tm_map(corpus,removeWords,stopwords("English"))
corpus = tm_map(corpus,stemDocument)

# Document Term Matrix Creation
dtm = DocumentTermMatrix(corpus)
inspect(dtm)
View(dtm)

# Removing Sparsity
sparse = removeSparseTerms(dtm,0.99)
glassdoorSparse = as.data.frame(as.matrix(sparse))
colnames(glassdoorSparse) = make.names(colnames(glassdoorSparse))
glassdoorSparse$Polarity = dataset2$Polarity

#Splitting the dataset into training and test datasets
split = sample.split(glassdoorSparse$Polarity,SplitRatio = 0.75)
training_set = subset(glassdoorSparse, split == TRUE)
test_set = subset(glassdoorSparse,split == FALSE)


# Applying CART MODEL
CART = rpart(Polarity ~ .,data = training_set,method = "class",minbucket = 25)
prp(CART)
predictCART = predict(CART ,newdata = training_set, type = "class")
table(training_set$Polarity,predictCART)
predicttest = predict(CART,newdata = test_set,type = 'class')
table(test_set$Polarity,predicttest)


# Applying RandomForest Algorithm
RF = randomForest(Polarity~., data = training_set,nodesize = 6,ntree = 2000)
predRF = predict(RF,newdata = training_set)
table(training_set$Polarity,predRF)
predtestRF = predict(RF,newdata = test_set)
table(test_set$Polarity,predtestRF)


# Applying multinomial logistic Regression
Multi = multinom(Polarity ~.,data = training_set)
predMulti = predict(Multi,newdata = training_set)
table(training_set$Polarity,predMulti)
predtestMulti = predict(Multi,newdata = test_set)
table(test_set$Polarity,predtestMulti)


# Applying Naive Bayes Model
NB = naiveBayes(Polarity~.,data = training_set)
predNB = predict(NB,newdata = training_set)
table(training_set$Polarity,predNB)
predtestNB = predict(NB,newdata = test_set)
table(test_set$Polarity,predtestNB)


