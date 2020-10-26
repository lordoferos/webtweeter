#! R 4.00
# A R script to periodically post links on Twitter


# Load required libraries
library(rtweet)
library(readr)
  
## store api keys (these are fake example values; replace with your own keys)
api_key <- "XXXXXXXXXXXXXXXXXXXXXX"
api_secret_key <- "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
access_token <- "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
access_token_secret <- "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

## authenticate via web browser
token <- create_token(
  app = "App-name", # Use your registered app name as per your Twitter dev account
  consumer_key = api_key,
  consumer_secret = api_secret_key,
  access_token = access_token,
  access_secret = access_token_secret)
  
# get token
get_token()
  
# import list of links  
links <- read.csv('https://raw.githubusercontent.com/lordoferos/dulinks/master/dulinks.txt') # saved in github
  
# random number generator to select a link
rand = sample.int(dim(links)[1],1)
  
# create link section of tweet to post
chunk = links[rand,]
  
# get trending topics  
trends <- get_trends("Kenya")
trends_string = paste(trends[1,1],trends[2,1],trends[3,1],trends[4,1],trends[5,1], sep = " ") # Select top 5 trends
  
# create tweet content
tweet_content = paste(trends_string, chunk, sep = " ")
  
# post tweet
rtweet::post_tweet(status = tweet_content)
  
# save tweet content locally
filetweet <- file(paste0('tweet',rand,"-",Sys.Date(),".txt"))
write_lines(tweet_content, filetweet)
