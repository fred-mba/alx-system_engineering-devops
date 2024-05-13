#!/usr/bin/python3
"""
This module sends a get request to Reddit API to retrieve number of subscribers
"""
import requests


def number_of_subscribers(subreddit):
    api_url = 'https://www.reddit.com/r/'
    subreddit_url = f"{api_url}{subreddit}/about.json"

    headers = {"User-Agent": "Mozilla/5.0"}

    response = requests.get(subreddit_url, headers=headers)

    if response.status_code == 200:

        data = response.json()
        subscribers = data['data']['subscribers']
        return subscribers
    else:
        return 0
