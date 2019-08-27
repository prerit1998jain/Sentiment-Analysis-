# Sentiment-Analysis-
This Repository consists of my codes for sentiment analysis from the internship at Rubix Data Sciences. 

# Introduction

    Problem Statement : 
    To  use different  machine learning algorithms for sentiment analysis of 
    reviews of companies given by their employees on Glassdoor’s website and
    accordingly giving them scores. 
    To Generate an overall score for the company which can be further used as 
    an independent variable for credit Scoring.
 
# Machine Learning :
	
    A normal machine learning problem is like a machine, learning the underlying
    relationship between some variables using features selected from a given dataset
    and then implement that knowledge on new data to make predictions on the basis 
    of its learning.So in our case what we want is ,our machine should understand 
    using the training set the relation between the occurrences of several words in 
    the reviews and classify them being positive or negative. And when a new review 
    come it should be able to classify and predict it as positive or negative.
		

 # Working
    We are  considering the frequency of the important words as independent variables 
    or we can say as factors to predict a review being positive or not.
    So first it will learn from our training set that which words are there which are 
    more frequent in positive reviews and  negative reviews . This knowledge would be
    used to predict and classify the new reviews as positive or negative.)
    For eg. our training set has a lot of sentences which are classified as positive by
    us and have phrases like “great work life balance”, “good co workers”. So when a new 
    review  comes and consist of words like “good” and “great”, it will be assigned as 
    positive by our model.
    
    Overall Score:
    We are using the proportion of positive reviews out of total reviews scaled to five as
    a score to the company which can be used as a metric for judging how the company manages
    its employees.
			
	
        | Overall_Score = 5*(pos) / (pos + neg) |
          
                      Pos →  No. of  reviews classified as positive.
		      Neg →  No. of reviews classified as negative.


# Results

  | ALGORITHMS | CART | RANDOM FOREST | SUPPORT VECTOR MACHINE | NAIVE BAYES | MULTINOMIAL LOGISTIC REGRESSION |
  | ---------- | ---- | --------------|------------------------| ------------|---------------------------------|
  | TRAINING SET ACCURACY (CONSIDERING MULTI-CLASS CLASSIFICATION) | 54% | 86.3% | - | 43.5% | 69.11% |
  | TEST SET ACCURACY (MULTI-CLASS CLASSIFICATION) | 55% | 64.5% |  - |40% | 61% |
  | TRAINING SET ACCURACY (BINARY CLASS CLASSIFICATION) | 77.3 % | 94.24% | 88.5% | 73.24% | 88.3 % |
  | TEST SET ACCURACY (BINARY CLASS CLASSIFICATION) 79.2% | 86.2% | 84.5% | 71% |85.2% |


# OVERALL SCORE OF SOME COMPANIES.

 | Company Name | Rating given using our model | Rating as given in website |
 | -------------| -----------------------------| ---------------------------| 
 | Onicra | 2.93 | 3.3 |
 | Star India Pvt. Ltd | 4.17 | 4.2 |
 | TCS | 3.93 | 4.0 |
 | Paytm | 4.01 | 4.1 |
 | Flipkart | 3.78 | 4.1 |
 | Birla | 3.68 | 4.0 |
 | Kotak Mahindra Bank | 3.6 | 3.9 |
 | Express Scripts| 3.12 | 3.4 |
 | Amazon | 4.24 | 3.8 |
 | Facebook | 3.85 | 4.2 |
 | Shapoorji Pallonji | 3.73 | 3.9
 | Dish tv | 3.67 | 3.9 |



  


