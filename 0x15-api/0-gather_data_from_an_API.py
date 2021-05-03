#!/usr/bin/python3
"""This modules gets information from {JSON} Placeholder
API to list information about an employee.

Usage:
    Accepts one argument, the id of the employee to list info.
    Execute this module like this:
    <python3 0-gather_data_from_an_API.py <id of user>>
"""
import requests
import sys

if __name__ == "__main__":
    tasks_completed = 0
    total_tasks = 0
    title_tasks = ""
    id = sys.argv[1]
    url = 'https://jsonplaceholder.typicode.com/users/{}'.format(id)
    user_info = requests.get(url)
    name = user_info.json()['name']
    url_todo = url + '/todos'
    user_todos_info = requests.get(url_todo)
    todos_list = user_todos_info.json()
    for dic in todos_list:
        if dic['completed'] is True:
            tasks_completed += 1
            title_tasks += "\t {}\n".format(dic['title'])
        total_tasks += 1
    print('Employee {} is done with tasks({}/{}):\n{}'.format(name,
          tasks_completed, total_tasks, title_tasks[:-1]))
