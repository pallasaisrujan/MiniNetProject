import os
from cassandra.cluster import Cluster
from cassandra.query import SimpleStatement

# Cassandra connection details
CASSANDRA_IP = '34.29.237.187'  # Your VM's external IP
CASSANDRA_PORT = 9042

def connect_to_cassandra():
    try:
        cluster = Cluster([CASSANDRA_IP], port=CASSANDRA_PORT)
        session = cluster.connect()
        print("Successfully connected to Cassandra cluster")
        return session, cluster
    except Exception as e:
        print(f"Failed to connect to Cassandra cluster: {e}")
        raise

def get_user_input(prompt):
    return input(prompt)

def replace_placeholders(query, placeholders):
    for placeholder, value in placeholders.items():
        query = query.replace(placeholder, str(value))
    return query

def execute_query(session, query):
    try:
        return session.execute(SimpleStatement(query))
    except Exception as e:
        print(f"Failed to execute query: {e}")
        raise

def display_results(results):
    for row in results:
        print(", ".join(f"{k}: {v}" for k, v in row._asdict().items()))

def read_queries():
    current_dir = os.path.dirname(os.path.abspath(__file__))
    cql_file_path = os.path.join(current_dir, '..', 'sql scripts', 'interactCassandra_db.cql')

    with open(cql_file_path, 'r') as file:
        content = file.read()

    queries = {}
    current_key = None
    for line in content.split('\n'):
        if line.startswith('--'):
            current_key = line.strip('- ').lower()
            queries[current_key] = ''
        elif current_key and line.strip():
            queries[current_key] += line + ' '

    # Ensure ALLOW FILTERING is added to queries that need it
    for key in queries:
        if 'WHERE' in queries[key] and 'ALLOW FILTERING' not in queries[key]:
            queries[key] = queries[key].rstrip().rstrip(';') + ' ALLOW FILTERING;'

    return queries

def display_menu(queries):
    print("\nAvailable queries:")
    menu_items = [
        "Export all users",
        "Export all users from a specific country",
        "Export data to find users between specific age range",
        "Export data to find users between 22-30 years old",
        "Count how many users exist per specific city",
        "Get All Count how many users exist per city"
    ]
    for i, item in enumerate(menu_items, 1):
        print(f"{i}. {item}")
    print("0. Exit")

def get_unique_values(session, column):
    query = f"SELECT {column} FROM mini_net.users;"
    try:
        results = execute_query(session, query)
        return sorted(set(getattr(row, column) for row in results))
    except Exception as e:
        print(f"Error fetching unique values for {column}: {e}")
        return []

def count_users_per_city(results):
    city_counts = {}
    for row in results:
        city = row.city
        city_counts[city] = city_counts.get(city, 0) + 1
    return city_counts

def main():
    queries = read_queries()
    session, cluster = connect_to_cassandra()

    try:
        while True:
            display_menu(queries)
            choice = get_user_input("Enter your choice (0 to exit): ")

            if choice == '0':
                print("Exiting program.")
                break

            try:
                choice = int(choice)
                if choice < 1 or choice > 6:
                    print("Invalid choice. Please try again.")
                    continue

                if choice == 1:
                    query = queries['export all users']
                elif choice == 2:
                    countries = get_unique_values(session, 'country')
                    print("Available countries:", ", ".join(countries))
                    country = get_user_input("Enter the country: ")
                    query = replace_placeholders(queries['export all users from a specific country'], {'{country}': country})
                elif choice == 3:
                    age_min = int(get_user_input("Enter the minimum age: "))
                    age_max = int(get_user_input("Enter the maximum age: "))
                    query = replace_placeholders(queries['export data to find users between specific age range'], {'{age_min}': age_min, '{age_max}': age_max})
                elif choice == 4:
                    query = queries['export data to find users between 22-30 years old']
                elif choice == 5:
                    cities = get_unique_values(session, 'city')
                    print("Available cities:", ", ".join(cities))
                    city = get_user_input("Enter the city: ")
                    query = replace_placeholders(queries['count how many users exist per specific city'], {'{city}': city})
                elif choice == 6:
                    query = queries['get all count how many users exist per city']

                print(f"\nExecuting query: {query}")

                results = execute_query(session, query)

                print("\nQuery Results:")
                if choice == 6:
                    city_counts = count_users_per_city(results)
                    for city, count in sorted(city_counts.items()):
                        print(f"{city}: {count} users")
                else:
                    display_results(results)

            except ValueError:
                print("Invalid input. Please enter a number.")
            except Exception as e:
                print(f"An error occurred: {e}")

    finally:
        if session:
            session.shutdown()
        if cluster:
            cluster.shutdown()

if __name__ == "__main__":
    main()