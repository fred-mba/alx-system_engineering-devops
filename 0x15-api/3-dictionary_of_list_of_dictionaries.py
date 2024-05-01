#!/usr/bin/python3
"""
An extend your Python script to export all users data in the JSON format
"""
import json
import requests


def export_to_json():
    base_url = "https://jsonplaceholder.typicode.com/users"
    users_info = requests.get(base_url).json()

    filename = "todo_all_employees.json"

    json_data = {}

    for user in users_info:
        user_id = user['id']
        user_url = f"{base_url}/{user_id}"
        todos_url = f"{user_url}/todos"
        todos_data = requests.get(todos_url).json()

        json_data[user_id] = []

        for data in todos_data:
            json_data[user_id].append({
                "username": user['username'],
                "task": data['title'],
                "completed": data['completed']
            })

    with open(filename, 'w') as jsonfile:
        json.dump(json_data, jsonfile)


if __name__ == "__main__":
    export_to_json()
