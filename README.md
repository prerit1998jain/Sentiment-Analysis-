# Sentiment-Analysis-

## Introduction

    Problem Statement : 
    • To  use different machine learning algorithms for **sentiment analysis** of 
    reviews of companies given by their employees on Glassdoor’s website and
    accordingly giving them scores. 
    • To Generate an overall score for the company which can be further used as 
    an independent variable for credit Scoring.
 
## Machine Learning :
	
    • A normal machine learning problem is like a machine, learning the underlying
    relationship between some variables using features selected from a given dataset
    and then implement that knowledge on new data to make predictions on the basis 
    of its learning. 
    • Machine should understand using the training set the relation between the 
    occurrences of several words in the reviews and classify them being positive
    or negative. 

 ## Bag of words approach.
 
    We are  considering the frequency of the important words as independent variables or we can say as factors         to predict a review being positive or not.
    • STEP 1: EXTRACTING THE WORD FREQUENCY FROM A CORPUS. 
    • STEP 2: DECREASE THE SPARSITY BY SELECTING IMPORTANT FEATURES USING FEATURE 
              SELECTION TECHNIQUES.
    • STEP 3: AFTER THIS STEP, WE HAVE TABULAR DATA WITH FEATURES AS DIFFERENT WORDS,
              AND EACH DATASET ROW CONSISTING OF THE FREQUENCY OF THESE WORDS IN THE 
	      RESPECTIVE DOCUMENT. NOW THE DATA IS READY FOR TRAINING TASK.
    • STEP 4: DIVIDE THE DATASET INTO TRAINING, VALIDATION AND TEST SET.
    • STEP 5: PERFORM TRAINING OF VARIOUS MACHINE LEARNING ALGORITHMS ON TRAINING SET, 
              TUNE HYPERPARAMETERS ON VALIDATION SET, AND FINALLY TEST ON TEST SET.

## Results

  | ALGORITHMS | CART | RANDOM FOREST | SUPPORT VECTOR MACHINE | NAIVE BAYES | MULTINOMIAL LOGISTIC REGRESSION |
  | ---------- | ---- | --------------|------------------------| ------------|---------------------------------|
  | TRAINING SET ACCURACY (CONSIDERING MULTI-CLASS CLASSIFICATION) | 54% | 86.3% | - | 43.5% | 69.11% |
  | TEST SET ACCURACY (MULTI-CLASS CLASSIFICATION) | 55% | 64.5% |  - |40% | 61% |
  | TRAINING SET ACCURACY (BINARY CLASS CLASSIFICATION) | 77.3 % | 94.24% | 88.5% | 73.24% | 88.3 % |
  | TEST SET ACCURACY (BINARY CLASS CLASSIFICATION) 79.2% | 86.2% | 84.5% | 71% |85.2% |


## Overall Score for Credit Scoring

    We are using the proportion of positive reviews out of total reviews scaled to five as
    a score to the company which can be used as a metric for judging how the company manages
    its employees.
			
	
        | Overall_Score = 5*(pos) / (pos + neg) |
        |---------------------------------------|  
	
     Pos →  No. of  reviews classified as positive
     Neg →  No. of reviews classified as negative.


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



  


