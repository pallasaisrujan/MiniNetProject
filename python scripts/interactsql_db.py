import mysql.connector
from mysql.connector import errorcode
import os
import re

# Database configuration
config = {
    'user': 'Birkbeck13924706',
    'password': 'Birkbeck@13924706',
    'host': '35.224.192.105',
    'database': 'mininet_db',
    'raise_on_warnings': True,
    'connection_timeout': 10
}

# Path to the SQL file
script_dir = os.path.dirname(os.path.abspath(__file__))
sql_file_path = os.path.join(script_dir, '..', 'sql scripts', 'interactsql_db.sql')


def read_queries_from_file(file_path):
    queries = {}
    with open(file_path, 'r') as file:
        content = file.read()
        pattern = r'-- Category: (.*?),-- Description: (.*?)\n(.*?)(?=-- Category:|$)'
        matches = re.findall(pattern, content, re.DOTALL)
        for match in matches:
            category, description, query = match
            category = category.strip()
            if category not in queries:
                queries[category] = []
            queries[category].append((description.strip(), query.strip()))
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


def get_available_options(cursor, param_name):
    query_map = {
        'country': "SELECT DISTINCT UserCountry FROM UserInfo",
        'genre': "SELECT DISTINCT FilmGenre FROM Films",
        'filmgenre': "SELECT DISTINCT FilmGenre FROM Films",
        'city': "SELECT DISTINCT ActorCity FROM FilmActors",
        'user_id': "SELECT User_ID FROM UserInfo",
        'movie_id': "SELECT Film_ID FROM Films",
        'usersubscriptiontype': "SELECT DISTINCT UserSubscriptionType FROM UserInfo",
        'username': "SELECT DISTINCT UserName FROM UserInfo",
        'actorcity': "SELECT DISTINCT ActorCity FROM FilmActors",
    }

    query_key = param_name.lower()
    if query_key in query_map:
        results = execute_query(cursor, query_map[query_key])
        if results:
            print(f"\nAvailable options for {param_name}:")
            for row in results:
                print(row[list(row.keys())[0]])
        else:
            print(f"No options found for {param_name} in the database.")
    else:
        print(f"No predefined options available for {param_name}. Please enter a suitable value.")

    return input(f"Enter your choice for {param_name}: ")


def get_query_params(cursor, query):
    params = []
    placeholders = re.findall(r'(%s|\{(\w+)\})', query)
    param_names = []
    for placeholder in placeholders:
        if placeholder[1]:  # Named parameter
            param_name = placeholder[1]
        else:  # %s placeholder
            matches = re.findall(r'(\w+)\s*=\s*%s', query)
            if matches:
                param_name = matches[len(param_names)]
            else:
                param_name = f"param_{len(param_names) + 1}"

        if param_name not in param_names:
            param_names.append(param_name)
            value = get_available_options(cursor, param_name)
            if "LIKE %s" in query:
                value = f"%{value}%"
            params.append(value)

        if placeholder[1]:
            query = query.replace(f'{{{param_name}}}', '%s')

    return query, tuple(params)


def format_query(query, params):
    formatted_query = query
    for param in params:
        formatted_query = formatted_query.replace('%s', f"'{param}'", 1)
    return formatted_query


def main():
    try:
        conn = mysql.connector.connect(**config)
        cursor = conn.cursor(dictionary=True)

        queries = read_queries_from_file(sql_file_path)

        while True:
            print("\nMain Menu - Categories:")
            for i, category in enumerate(queries.keys(), 1):
                print(f"{i}. {category}")
            print("0. Exit")

            category_choice = input("\nEnter the number of the category you want to explore (0 to exit): ")

            if category_choice == '0':
                break

            try:
                category_index = int(category_choice) - 1
                if category_index < 0 or category_index >= len(queries):
                    raise ValueError
                selected_category = list(queries.keys())[category_index]
            except ValueError:
                print("Invalid choice. Please enter a valid number.")
                continue

            while True:
                print(f"\n{selected_category}:")
                for i, (description, _) in enumerate(queries[selected_category], 1):
                    print(f"{i}. {description}")
                print("0. Back to Main Menu")

                query_choice = input("\nEnter the number of the query you want to execute (0 to go back): ")

                if query_choice == '0':
                    break

                try:
                    query_index = int(query_choice) - 1
                    if query_index < 0 or query_index >= len(queries[selected_category]):
                        raise ValueError
                except ValueError:
                    print("Invalid choice. Please enter a valid number.")
                    continue

                description, query = queries[selected_category][query_index]
                print(f"\nExecuting: {description}")

                query, params = get_query_params(cursor, query)
                formatted_query = format_query(query, params)
                print(f"Final Query: {formatted_query}")
                results = execute_query(cursor, query, params)

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
