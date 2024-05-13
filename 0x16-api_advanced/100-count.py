#!/usr/bin/python3
"""
This module queries the Reddit API, parses the title of all hot articles,
and prints a sorted count of given keywords (case-insensitive, delimited by
spaces, Javascript should count as javascript, but java should not)
"""
import requests
from collections import Counter
import re


def count_words(subreddit, word_list, after=None, word_counts=None):
    """
    Returns sorted order of results and their counts in an alphabetical order
    """
    if word_counts is None:
        word_counts = Counter()

    api_url = 'https://www.reddit.com/r/'
    subreddit_url = f"{api_url}{subreddit}/hot.json"

    headers = {'User-Agent': 'CustomUserAgent'}

    response = requests.get(
        subreddit_url, headers=headers,
        params={"after": after},
        allow_redirects=False)

    if response.status_code == 200:

        reddit_data = response.json()['data']['children']

        for post in reddit_data:
            title_result = post['data']['title'].lower()
            for word in word_list:
                if title_result.count(word.lower()) > 0:
                    word_counts[
                        word.lower()] += title_result.count(word.lower())

        after = response.json()['data']['after']

        if after:
            count_words(subreddit, word_list, after, word_counts)
        else:
            sorted_word_cnts = sorted(
                word_counts.items(), key=lambda x: -x[1])
            for word, count in sorted_word_cnts:
                print(f"{word}: {count}")
    else:
        return
