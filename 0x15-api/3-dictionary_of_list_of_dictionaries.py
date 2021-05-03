#!/usr/bin/python3
"""This modules gets information from {JSON} Placeholder
API to list information about employees, and stores it on
a json format in a file.

Usage:
    Execute this module like this:
    <python3 3-dictionary_of_list_of_dictionaries.py>
    json file will have the name: todo_all_employees.json
"""
import json
import requests
import sys

if __name__ == "__main__":
    url = 'https://jsonplaceholder.typicode.com/users'.format(id)
    user_info = requests.get(url)
    user_info_dict = {}
    for dic_user_info in user_info.json():
        user_info_list = []
        id = dic_user_info['id']
        user_name = dic_user_info['username']
        url_todo = url + '/' + str(id) + '/todos'
        user_todos_info = requests.get(url_todo)
        todos_list = user_todos_info.json()
        for dic in todos_list:
            user_info_list.append(
                {'username': user_name, 'task': dic['title'],
                    'completed': dic['completed']})
        user_info_dict[id] = user_info_list
    with open("todo_all_employees.json".format(id), "w") as file:
        json.dump(user_info_dict, file)
