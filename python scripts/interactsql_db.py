import mysql.connector
from mysql.connector import errorcode
import os


config = {
    'user': 'Birkbeck13924706',
    'password': 'Birkbeck@13924706',
    'host': '35.224.192.105',
    'database': 'mininet-db',
    'raise_on_warnings': True,
    'connection_timeout': 10
}


def execute_sql_query(cursor, query):
    try:
        cursor.execute(query)
        result = cursor.fetchall()
        return result
    except mysql.connector.Error as err:
        print(f"Failed executing command: {query}")
        print(f"Error: {err.msg}")
        return None


def print_results(result):
    print("Result:")
    if result:
        for row in result:
            formatted_row = [str(column) if not isinstance(column, float) else f"{column:.2f}" for column in row]
            print(formatted_row)
    else:
        print("No results returned.")


def get_query_from_file(filename, query_number):
    with open(filename, 'r') as file:
        queries = file.read().split(';')
        if query_number <= len(queries):
            return queries[query_number - 1].strip()
        else:
            return None


def main():
    try:
        conn = mysql.connector.connect(**config)
        cursor = conn.cursor()

        script_dir = os.path.dirname(__file__)
        sql_file_path = os.path.join(script_dir, '..', 'sql scripts', 'interactsql_db.sql')

        while True:
            print("\nSelect a query to execute:")
            print("1. Best movie in Sci-Fi genre based on average review score")
            print("2. Best actor in Drama genre based on average review score of movies they acted in")
            print("3. Total number of users by subscription type")
            print("4. Most favorited movie")
            print("5. Most active user based on number of reviews")
            print("6. Average age of users by subscription type")
            print("7. Most popular genre based on the number of movies")
            print("8. Movies watched by a specific user")
            print("9. Top 5 users who watched the most movies")
            print("10. Average score of movies by genre")
            print("11. Exit")
            choice = input("Enter your choice (1-11): ")

            if choice.isdigit() and 1 <= int(choice) <= 10:
                query_number = int(choice)
                query = get_query_from_file(sql_file_path, query_number)
                if query:
                    print(f"\nExecuting query {query_number}...")
                    result = execute_sql_query(cursor, query)
                    print_results(result)
                else:
                    print(f"No query found for choice {choice}.")
            elif choice == '11':
                break
            else:
                print("Invalid choice. Please try again.")

    except mysql.connector.Error as err:
        if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            print("Something is wrong with your user name or password")
        elif err.errno == errorcode.ER_BAD_DB_ERROR:
            print("Database does not exist")
        elif err.errno == errorcode.CR_CONN_HOST_ERROR:
            print("Cannot connect to the database server. Please check your network settings and instance configuration.")
        else:
            print(f"Error: {err}")
    finally:
        try:
            if conn.is_connected():
                cursor.close()
                conn.close()
                print("Connection closed.")
        except NameError:
            print("Connection was never established.")

if __name__ == "__main__":
    main()
