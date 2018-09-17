# Installing required packages
# install.packages("tidytext")
# install.packages("dplyr")
# install.packages("tidyr")

# Loading all Required Packages
library(tidytext)
library(dplyr)
library(tidyr)

# Setting the working directory
path = "E:/Data Analytics/Text Analytics/Internship/DATASET"
setwd(path)
dataset2 = read.csv('equifax_indeed.csv',stringsAsFactors = FALSE)
dataset2 = data.frame(Reviews = as.character(dataset2$Reviews))


#Creating tibble (a kind of sophisticted data frame)
text_df = data_frame(Reviews = as.character(dataset2$Reviews))

#Mutating line number to row number to keep a track on the reviews
mutated=mutate(text_df,linenumber=row_number())

#Tokenizing the reviews i to words
tokens = unnest_tokens(mutated, word, Reviews)

#Removing stopwords
data(stop_words)

cleandata=anti_join(tokens,stop_words)

bing_t <- get_sentiments("bing")


#Inner joining over data with the lexicons of R
inner_joined1=inner_join(cleandata,bing_t)

#Counting the number of postive and negative
count_done1=count(inner_joined1, linenumber = linenumber %/%1 , sentiment)

#Spreading on the basis of postive and negative

spread_done1=spread(count_done1,sentiment, n, fill = 0) 

#Final
end_game1=mutate(spread_done1,sentiment=positive-negative)

#Assigning +1 to positive and -1 to negative

for (i in 1:nrow(end_game1))
{
  if (end_game1$sentiment[i] > 0)
  {end_game1$Polarity[i]=1}
  else
  {end_game1$Polarity[i]= -1}
  
}

# Final dataframe storing the review and the respective scores assigned and given.
final_assignment = inner_join(mutated,end_game1)

final_assignment$sentiment = NULL
final_assignment$linenumber = NULL
final_assignment$negative = NULL
final_assignment$positive = NULL

write.csv(final_assignment,'polarity_assigned.csv')