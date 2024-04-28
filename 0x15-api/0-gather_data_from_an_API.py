#!/usr/bin/python3
"""
Python script that is using REST API, for a given employee ID,
returns information about his/her TODO list progress
"""
import requests
import sys


def fetch_todos(employee_id):
    """
    Fuction to fetch for user info and todo info
    """
    base_url = 'https://jsonplaceholder.typicode.com/users/'
    employee_url = f"{base_url}{employee_id}"
    employee_info = requests.get(employee_url).json()

    EMPLOYEE_NAME = employee_info['name']

    employee_todos = f"{employee_url}/todos"
    todos_info = requests.get(employee_todos).json()
    TOTAL_NUMBER_OF_TASKS = len(todos_info)

    completed_tasks = [task for task in todos_info if task['completed']]
    NUMBER_OF_DONE_TASKS = len(completed_tasks)
    print(
        f"Employee {EMPLOYEE_NAME} is done with tasks ({NUMBER_OF_DONE_TASKS}\
/{TOTAL_NUMBER_OF_TASKS}):")
    for task in completed_tasks:
        print(f"\t{task['title']}")


if __name__ == "__main__":
    employee_id = int(sys.argv[1])
    fetch_todos(employee_id)
