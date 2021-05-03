#!/usr/bin/python3
"""This modules gets information from {JSON} Placeholder
API to list information about an employee, and stores it on
a CSV format in a file.

Usage:
    Accepts one argument, the id of the employee to list info.
    Execute this module like this:
    <python3 1-export_to_CSV.py <id of user>>
    CSV file will have the name: <user_id>.csv
"""
import requests
import sys

if __name__ == "__main__":
    user_info_str = ""
    id = sys.argv[1]
    url = 'https://jsonplaceholder.typicode.com/users/{}'.format(id)
    user_info = requests.get(url)
    user_name = user_info.json()['username']
    url_todo = url + '/todos'
    user_todos_info = requests.get(url_todo)
    todos_list = user_todos_info.json()
    for dic in todos_list:
        user_info_str += '"{}","{}","{}","{}"\n'.format(
            id, user_name, dic['completed'], dic['title'])
    with open("{}.csv".format(id), "w") as file:
        file.write(user_info_str)
