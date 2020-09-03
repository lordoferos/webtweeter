#! /bin/bash
# Posting tweets at 1 hr intervals
import tweepy
import random
import time

# Create new function
while True:
    def posteR():

        ## store api keys (these are fake example values; replace with your own keys)

        CONSUMER_KEY = 'vshdudwjksoshsjdjdhjd'
        CONSUMER_SECRET = 'gdfgudjaluhlas77u30933'
        ACCESS_KEY = '3e237183980986r42ty90u'
        ACCESS_SECRET = '5412789yihrkjdfygksdhlaigdfbnk'
        auth = tweepy.OAuthHandler(CONSUMER_KEY, CONSUMER_SECRET)
        auth.set_access_token(ACCESS_KEY, ACCESS_SECRET)
        apip = tweepy.API(auth)

        # read link file (a text file from your directory)

        with open('path for the text file') as f:
            passFile = [line.rstrip() for line in f]

        # create random choice
        rand = random.randint(1,len(passFile))

        # get top trends
        trendsk = apip.trends_place(23424863)
        # trends1 is a list with only one element in it,
        # dict which we'll put in data.
        data = trendsk[0]
        # grab the trends
        trends = data['trends']
        # grab the name from each trend
        names = [trend['name'] for trend in trends]
        # pick top 5 trends
        names5 = names[:5]
        # put all the names together with a ' ' separating them
        trendsChunk = ' '.join(names5)


        # create tweet chunk
        chunk = str(trendsChunk + " " + passFile[rand])


        # Tweet
        apip.update_status(chunk)

    # Post tweet
    posteR()
    time.sleep(1200)
