#!/usr/bin/python3
"""Function that queries the Reddit API, parses the title
of all hot articles, and prints a sorted count of given
keywords (case-insensitive, delimited by spaces.
Javascript should count as javascript, but java should not)."""
import requests


def count_words(subreddit, word_list, word_count={}, after=""):
    """Returns a list containing the
    titles of all hot posts of a
    subreddit"""
    url = "https://www.reddit.com/r/{}/hot.json".format(subreddit)
    header = {
        "User-Agent": "linux:hbt_curriculum:api_learning:v1.0 (by /u/towers)"
    }
    param = {
        "after": after,
    }
    result = requests.get(url, headers=header, params=param,
                          allow_redirects=False)
    if result.status_code == 200:
        result_data = result.json()["data"]
        after = result_data["after"]
        for child in result_data["children"]:
            child_data = child["data"]
            title = child_data["title"].lower().split()
            for word in word_list:
                if word in title:
                    try:
                        count = word_count[word]
                    except:
                        count = 0
                    count += title.count(word.lower())
                    word_count[word] = count
        if after is not None:
            return count_words(subreddit, word_list, word_count, after)
        word_count_sorted = dict(sorted(word_count.items(),
                                 key=lambda item: item[1], reverse=True))
        if word_count_sorted:
            for key, value in word_count_sorted.items():
                print("{}: {}".format(key, value))
        else:
            print(None)
    else:
        print(None)