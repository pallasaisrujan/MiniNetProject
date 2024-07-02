import mysql.connector
from mysql.connector import errorcode
import os


config = {
    'user': 'Birkbeck13924706',
    'password': 'Birkbeck@13924706',
    'host': '35.188.207.84',
    'database': 'mininet-db',
    'raise_on_warnings': True
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
    sql_file_path = os.path.abspath(os.path.join(script_dir, '..', 'sql scripts', 'create_tables.sql'))

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
    else:
        print(err)
finally:
    if conn.is_connected():
        cursor.close()
        conn.close()
        print("Connection closed.")
