#!/usr/bin/python3
"""Function that queries the Reddit API and returns the number of subscribers
(not active users, total subscribers) for a given subreddit.
If an invalid subreddit is given, the function should return 0"""
import requests


def number_of_subscribers(subreddit):
    """Get number of suscribers on the subreddit variable"""
    url = "https://www.reddit.com/r/{}/about.json".format(subreddit)
    header = {
        "User-Agent": "linux:hbt_curriculum:api_learning:v1.0 (by /u/towers)"
    }
    result = requests.get(url, headers=header, allow_redirects=False)
    if result.status_code == 200:
        result_data = result.json()["data"]
        return (result_data["subscribers"])
    else:
        return (0)
