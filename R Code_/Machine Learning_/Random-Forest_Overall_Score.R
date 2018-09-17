# Packages for data cleaning
library(tm)
library(SnowballC)

# Package for splitting of data into training and test sets
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

# Setting the working directory
path_1 -> "E:/Data Analytics/Text Analytics/Internship/DATASET"
setwd(path_1)


# Reading the data set
dataset2 = read.csv('training_dataset.csv', stringsAsFactors = FALSE)
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

training_set = glassdoorSparse

# Applying RandomForest Algorithm
RF = randomForest(Polarity ~ ., data = training_set,nodesize = 6,ntree = 2000)

#For any new data first create the corpus and then the basic preprocessing on it to make it usable so as to fit the model without accuracy
#Making test set data in the form which will be useful

path_2 <- "E:/Data Analytics/Text Analytics/Internship/DATASET"
# Setting the working directory
setwd(path_2)

# Reading the csv file scraped from the source.
new_data = read.csv('onicra_indeed.csv', stringsAsFactors = FALSE)

# Selecting necessary columns from the scraped dataset.
new_data = data.frame(Reviews = as.character(new_data$Reviews))
corpus1 = Corpus(VectorSource(new_data$Reviews))

#Basic preprocessing
corpus1 = tm_map(corpus1,tolower)
corpus1 = tm_map(corpus1,removePunctuation)
corpus1 = tm_map(corpus1,removeWords,stopwords("English"))
corpus1= tm_map(corpus1,stemDocument)

#Creating a matrix 
dtm1 = DocumentTermMatrix(corpus1)
inspect(dtm1)

#Retaining top 2.25%words
sparse1 = removeSparseTerms(dtm1,0.975)

#Converting to a data frame
inspect(sparse1)
glassdoorSparse1 = as.data.frame(as.matrix(sparse1))

#Creating colnames with columns being the words
colnames(glassdoorSparse1) = make.names(colnames(glassdoorSparse1))

#Matching the words in training and test set 
matched=match(colnames(glassdoorSparse),colnames(glassdoorSparse1))

## Adding columns which are present in training set but not in test set as the model will
#  not run if the training set has extra words than test set. ##

for(i in 1:ncol(glassdoorSparse))
{
  if(is.na(matched[i]) == TRUE)
  {
    glassdoorSparse1[,colnames(glassdoorSparse)[i]] = 0
  }
}

# Predicting for new data using the model
predict_model=predict(RF,newdata=glassdoorSparse1)

# Storing the predicted variable into Polarity variable
new_data$Polarity=predict_model 
new_data$X = NULL

# Saving the predicted scores into a output csv file named "new_data.csv"
write.csv(new_data,"new_data.csv")

# Saving the no. of positive and negative reviews into variables pos and neg
pos = table(as.numeric(as.character(new_data$Polarity)))[2]
neg = table(as.numeric(as.character(new_data$Polarity)))[1]

# Overall Score Generation
Overall_Score = 5*pos/(pos + neg)

# Predicting the company as good or bad on the basis of benchmarks
benchmark_1 = 3.3
benchmark_2 = 3.9
if(Overall_Score > benchmark_2){
  print('Company with good employees satisfaction')
}
if(Overall_Score < benchmark_2 & Overall_Score > benchmark_1){
  print('Company with average employees satisfaction')
}
if(Overall_Score < benchmark){
  print('Company with bad emloyees satisfaction')
}


