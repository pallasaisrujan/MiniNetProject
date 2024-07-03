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


def execute_sql_file(cursor, filename):
    with open(filename, 'r') as file:
        sql_commands = file.read().split(';')
        for command in sql_commands:
            if command.strip():
                try:
                    cursor.execute(command)
                    print(f"Executed command: {command}")
                except mysql.connector.Error as err:
                    print(f"Failed executing command: {command}")
                    print(f"Error: {err.msg}")


try:
    script_dir = os.path.dirname(__file__)
    sql_file_path = os.path.abspath(os.path.join(script_dir, '..', 'sql scripts', 'insert_data.sql'))

    if not os.path.isfile(sql_file_path):
        raise FileNotFoundError(f"SQL file not found: {sql_file_path}")

    conn = mysql.connector.connect(**config)
    cursor = conn.cursor()


    execute_sql_file(cursor, sql_file_path)
    conn.commit()

    print("All commands executed successfully!")
except mysql.connector.Error as err:
    if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
        print("Something is wrong with your user name or password")
    elif err.errno == errorcode.ER_BAD_DB_ERROR:
        print("Database does not exist")
    elif err.errno == errorcode.CR_CONN_HOST_ERROR:
        print("Cannot connect to the database server. Please check your network settings and instance configuration.")
    else:
        print(f"Error: {err}")
except FileNotFoundError as fnf_error:
    print(fnf_error)
finally:
    try:
        if conn.is_connected():
            cursor.close()
            conn.close()
            print("Connection closed.")
    except NameError:
        print("Connection was never established.")
