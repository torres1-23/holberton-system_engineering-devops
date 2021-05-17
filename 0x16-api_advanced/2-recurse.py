#!/usr/bin/python3
"""Function that queries the Reddit API and returns a list
containing the titles of all hot articles for a given
subreddit. If no results are found for the given
subreddit, the function should return None."""
import requests


def recurse(subreddit, hot_list=[], after=""):
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
            hot_list.append(child_data["title"])
        if after is not None:
            return recurse(subreddit, hot_list, after)
        return (hot_list)
    else:
        return (None)
