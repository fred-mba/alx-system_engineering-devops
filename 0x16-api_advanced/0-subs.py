#!/usr/bin/python3
"""
This module sends a get request to Reddit API to retrieve number of subscribers
"""
import requests


def number_of_subscribers(subreddit):
    """"
    Function that queries the Reddit API and returns the number of subscribers
    """
    api_url = 'https://www.reddit.com/r/'
    subreddit_url = f"{api_url}{subreddit}/about.json"

    headers = {"User-Agent": "Mozilla/5.0"}

    response = requests.get(
        subreddit_url, headers=headers, allow_redirects=False)

    if response.status_code == 200:

        data = response.json()
        subscribers = data['data']['subscribers']
        return subscribers
    else:
        return 0
