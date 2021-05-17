#!/usr/bin/python3
"""Function that queries the Reddit API and and prints the
titles of the first 10 hot posts listed for a given subreddit"""
import requests


def top_ten(subreddit):
    """Print the title of first top 10 hot
    posts of subreddit"""
    url = "https://www.reddit.com/r/{}/hot.json".format(subreddit)
    header = {
        "User-Agent": "linux:hbt_curriculum:api_learning:v1.0 (by /u/towers)"
    }
    param = {
        "limit": "10"
    }
    result = requests.get(url, headers=header, params=param,
                          allow_redirects=False)
    if result.status_code == 200:
        result_data = result.json()["data"]
        for child in result_data["children"]:
            child_data = child["data"]
            print(child_data["title"])
    else:
        print(None)
