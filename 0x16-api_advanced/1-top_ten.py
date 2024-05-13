#!/usr/bin/python3
"""
Sends a get request to Reddit API and prints the titles of
the first 10 hot posts listed for a given subreddit
"""
import requests


def top_ten(subreddit):
    api_url = 'https://www.reddit.com/r/'
    subreddit_url = f"{api_url}{subreddit}/hot.json"

    headers = {"User-Agent": "Mozilla/5.0 (X11; Linux x86_64)"}

    params = {"limit": 10}

    response = requests.get(
        subreddit_url, headers=headers, params=params, allow_redirects=False)

    if response.status_code == 200:

        reddit_data = response.json().get('data')

        for hot_post in reddit_data.get('children'):
            print(hot_post.get('data').get('title'))
    else:
        print("None")
        return
