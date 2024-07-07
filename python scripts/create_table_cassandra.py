import os
import logging
from cassandra.cluster import Cluster
from cassandra.auth import PlainTextAuthProvider
from cassandra.query import SimpleStatement

# Set up logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

# Cassandra connection details
CASSANDRA_IP = '34.29.237.187'  # Your VM's external IP
CASSANDRA_PORT = 9042


def connect_to_cassandra():
    try:
        cluster = Cluster([CASSANDRA_IP], port=CASSANDRA_PORT)
        session = cluster.connect()
        logging.info("Successfully connected to Cassandra cluster")
        return session, cluster
    except Exception as e:
        logging.error(f"Failed to connect to Cassandra cluster: {e}")
        raise


def execute_cql_file(session, file_path):
    try:
        with open(file_path, 'r') as file:
            cql_commands = file.read().split(';')

        for command in cql_commands:
            if command.strip():
                logging.info(f"Executing CQL command: {command.strip()}")
                session.execute(SimpleStatement(command.strip()))

        logging.info("CQL script executed successfully")
    except Exception as e:
        logging.error(f"Failed to execute CQL script: {e}")
        raise


def main():
    session = None
    cluster = None
    try:
        # Get the directory of the current Python script
        current_dir = os.path.dirname(os.path.abspath(__file__))

        # Construct the path to the CQL file
        cql_file_path = os.path.join(current_dir, '..', 'sql scripts', 'create_table_cassandra.cql')

        # Verify the file exists
        if not os.path.exists(cql_file_path):
            logging.error(f"CQL file not found at: {cql_file_path}")
            return

        logging.info(f"CQL file found at: {cql_file_path}")

        session, cluster = connect_to_cassandra()
        execute_cql_file(session, cql_file_path)

    except Exception as e:
        logging.error(f"An error occurred: {e}")
    finally:
        if session:
            session.shutdown()
        if cluster:
            cluster.shutdown()


if __name__ == "__main__":
    main()