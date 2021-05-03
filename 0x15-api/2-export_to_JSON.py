#!/usr/bin/python3
"""This modules gets information from {JSON} Placeholder
API to list information about an employee, and stores it on
a json format in a file.

Usage:
    Accepts one argument, the id of the employee to list info.
    Execute this module like this:
    <python3 2-export_to_JSON.py <id of user>>
    json file will have the name: <user_id>.json
"""
import json
import requests
import sys

if __name__ == "__main__":
    user_info_list = []
    id = sys.argv[1]
    url = 'https://jsonplaceholder.typicode.com/users/{}'.format(id)
    user_info = requests.get(url)
    user_name = user_info.json()['username']
    url_todo = url + '/todos'
    user_todos_info = requests.get(url_todo)
    todos_list = user_todos_info.json()
    for dic in todos_list:
        user_info_list.append(
            {'task': dic['title'], 'completed': dic['completed'],
                'username': user_name})
        user_info_dict = {id: user_info_list}
    with open("{}.json".format(id), "w") as file:
        json.dump(user_info_dict, file)
