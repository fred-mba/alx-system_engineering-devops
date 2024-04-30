#!/usr/bin/python3
"""
An extend your Python script to export data in the JSON format
"""
import json
import requests
import sys


def export_to_json(user_id):
    base_url = "https://jsonplaceholder.typicode.com/users/"
    user_url = f"{base_url}{user_id}"
    user_info = requests.get(user_url).json()

    todos_url = f"{user_url}/todos"
    todos_data = requests.get(todos_url).json()

    filename = f"{user_id}.json"

    json_data = {
        user_id: [],
    }

    for data in todos_data:
        json_data[user_id].append({
            "task": data['title '],
            "completed": data['completed'],
            "username": user_info['username']
        })

    with open(filename, 'w') as jsonfile:
        json.dump(json_data, jsonfile)


if __name__ == "__main__":
    user_id = sys.argv[1]
    export_to_json(user_id)
