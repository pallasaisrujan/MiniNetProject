import mysql.connector
from mysql.connector import errorcode
import os
import re

# Database configuration
config = {
    'user': 'Birkbeck13924706',
    'password': 'Birkbeck@13924706',
    'host': '35.224.192.105',
    'database': 'mininet-db',
    'raise_on_warnings': True,
    'connection_timeout': 10
}

# Path to the SQL file
script_dir = os.path.dirname(os.path.abspath(__file__))
sql_file_path = os.path.join(script_dir, '..', 'sql scripts', 'interactsql_db.sql')


def read_queries_from_file(file_path):
    queries = {}
    current_query = ""
    current_id = 0

    with open(file_path, 'r') as file:
        for line in file:
            line = line.strip()
            if line.startswith('-- Query'):
                if current_query:
                    queries[current_id] = (current_description, current_query.strip())
                current_id = int(line.split(':')[0].split()[-1])
                current_description = line.split(':')[1].strip()
                current_query = ""
            elif line and not line.startswith('--'):
                current_query += line + " "

    if current_query:
        queries[current_id] = (current_description, current_query.strip())

    return queries


def execute_query(cursor, query, params=None):
    try:
        if params:
            cursor.execute(query, params)
        else:
            cursor.execute(query)
        results = cursor.fetchall()
        return results
    except mysql.connector.Error as err:
        print(f"Error executing query: {err}")
        return None


def get_available_options(cursor, param):
    query_map = {
        'genre': "SELECT DISTINCT Genre FROM Movie",
        'actor_name': "SELECT Name FROM Actor",
        'subscription_type': "SELECT DISTINCT SubscriptionType FROM User"
    }

    if param in query_map:
        results = execute_query(cursor, query_map[param])
        if results:
            print(f"\nAvailable {param.replace('_', ' ')}s:")
            for row in results:
                print(row[0])
        else:
            print(f"No {param.replace('_', ' ')}s found in the database.")

    return input(f"\nEnter {param.replace('_', ' ')}: ").lower()


def get_input_params(cursor, query):
    params = re.findall(r'\{(\w+)\}', query)
    input_params = {}
    for param in params:
        input_params[param] = get_available_options(cursor, param)
    return input_params


def main():
    try:
        conn = mysql.connector.connect(**config)
        cursor = conn.cursor()

        queries = read_queries_from_file(sql_file_path)

        while True:
            print("\nAvailable queries:")
            for id, (description, _) in queries.items():
                print(f"{id}. {description}")
            print("0. Exit")

            choice = input("\nEnter the number of the query you want to execute (0 to exit): ")
            if choice == '0':
                break

            try:
                choice = int(choice)
                if choice not in queries:
                    raise ValueError
            except ValueError:
                print("Invalid choice. Please enter a valid number.")
                continue

            description, query = queries[choice]
            print(f"\nExecuting: {description}")

            input_params = get_input_params(cursor, query)
            if input_params:
                # Replace placeholders with actual values
                for param, value in input_params.items():
                    query = query.replace(f'{{{param}}}', value)
                print(f"Final Query: {query}")
                results = execute_query(cursor, query)
            else:
                print(f"Final Query: {query}")
                results = execute_query(cursor, query)

            if results:
                for row in results:
                    print(row)
            else:
                print("No results returned.")

    except mysql.connector.Error as err:
        if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            print("Something is wrong with your user name or password")
        elif err.errno == errorcode.ER_BAD_DB_ERROR:
            print("Database does not exist")
        else:
            print(err)
    finally:
        if 'cursor' in locals():
            cursor.close()
        if 'conn' in locals():
            conn.close()


if __name__ == "__main__":
    main()
