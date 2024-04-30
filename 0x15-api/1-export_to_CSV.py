#!/usr/bin/python3
"""
An  extend Python script to export data in the CSV format
"""
import csv
import requests
import sys


def export_to_csv(user_id):
    base_url = "https://jsonplaceholder.typicode.com/users/"
    user_url = f"{base_url}{user_id}"
    user_data = requests.get(user_url).json()

    todos_url = f"{user_url}/todos"
    todos_data = requests.get(todos_url).json()

    filename = f"{user_id}.csv"

    fieldnames = ["id", "username", "completed", "title"]
    csv_data = []

    for data in todos_data:
        csv_data.append({
            "id": data['userId'],
            "username": user_data['username'],
            "completed": data['completed'],
            "title": data['title']
        })

    with open(filename, 'w') as csvfile:
        writer = csv.DictWriter(
            csvfile, fieldnames=fieldnames, quoting=csv.QUOTE_ALL)
        writer.writerows(csv_data)


if __name__ == "__main__":
    user_id = int(sys.argv[1])
    export_to_csv(user_id)
