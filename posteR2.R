#! R 4.00
# Script to periodically post links on Twitter


# Load required libraries
library(rtweet)
library(readr)
  
## store api keys (these are fake example values; replace with your own keys)
api_key <- "d4Jl6eH8AiYcXkuAwrgkM6gJ3"
api_secret_key <- "Z5bhyKoDiOiKU9Uu9zPoxnKdAKShONdgsTkcKXeJLhuaJtqkSJ"
access_token <- "892981240667807744-rfF45SbCK9Yu0byTPoVLxQTyEDMvg2g"
access_token_secret <- "Mx67izXSpNVkhc4wHvwEAn90dknkHoq7dv0W9RRTf28di"

## authenticate via web browser
token <- create_token(
  app = "Kwadu",
  consumer_key = api_key,
  consumer_secret = api_secret_key,
  access_token = access_token,
  access_secret = access_token_secret)
  
# get token
get_token()
  
# import list of links

  
links <- read.csv('https://raw.githubusercontent.com/lordoferos/dulinks/master/dulinks.txt')
  
# random number generator to select a link
rand = sample.int(dim(links)[1],1)
  
# create link section of tweet
chunk = links[rand,]
  
# get trending topics
  
trends <- get_trends("Kenya")
trends_string = paste(trends[1,1],trends[2,1],trends[3,1],trends[4,1],trends[5,1], sep = " ")
  
# create tweet content
tweet_content = paste(trends_string, chunk, sep = " ")
  
# post tweet
rtweet::post_tweet(status = tweet_content)
  
# save tweet content
filetweet <- file(paste0('tweet',rand,"-",Sys.Date(),".txt"))
write_lines(tweet_content, filetweet)







