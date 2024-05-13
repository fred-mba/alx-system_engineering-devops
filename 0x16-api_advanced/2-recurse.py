#!/usr/bin/python3
"""
This module uses recursive function that queries the Reddit API and
returns a list containing the titles of all hot articles for a given subreddit
"""
import requests


def recurse(subreddit, hot_list=[], after=None):
    """Returns None if no result is found"""
    api_url = 'https://www.reddit.com/r/'
    subreddit_url = f"{api_url}{subreddit}/hot.json"

    headers = {'User-Agent': 'CustomUserAgent'}

    response = requests.get(
        subreddit_url, headers=headers,
        params={"after": after},
        allow_redirects=False)

    if response.status_code == 200:

        reddit_data = response.json()['data']['children']

        for hot_post in reddit_data:
            hot_list.append(hot_post['data']['title'])

        after = response.json()['data']['after']

        if after:
            return recurse(subreddit, hot_list, after)
        else:
            return hot_list
    else:
        return None
