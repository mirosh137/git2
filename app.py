from flask import Flask, render_template
import mysql.connector
import random
import os

app = Flask(__name__)


def get_database_connection():
    return mysql.connector.connect(
        host=os.getenv("DATABASE_HOST", "localhost"),
        user=os.getenv("DATABASE_USER", "root"),
        password=os.getenv("DATABASE_PASSWORD", ""),
        database=os.getenv("DATABASE_NAME", "gifs_db")
    )

def get_random_gif():
    """Fetch a random GIF URL from the database."""
    conn = get_database_connection(
        
    )
    cursor = conn.cursor()

    # Fetch all GIF URLs
    cursor.execute("SELECT url FROM gifs")
    gifs = cursor.fetchall()

    print("Fetched GIFs:", gifs)  # Debugging output

    # Close connection
    conn.close()

    # Return a random GIF URL
    if gifs:
        selected_gif = random.choice(gifs)[0]
        print("Selected GIF:", selected_gif)  # Debugging output
        return selected_gif
    return None

def initialize_database():
    """Initialize the database with the content from gifdb.sql."""
    db_file = 'gifdb.sql'  # Path to your gifdb.sql file

    # Read the SQL file and execute its contents
    with open(db_file, 'r') as sql_file:
        sql_commands = sql_file.read().split(';')  # Split by statements

    # Connect to the database
    conn = mysql.connector.connect(
        host="localhost",
        user="root",
        password="13478DanilaM_",
        database="gifs_db"
    )
    cursor = conn.cursor()

    for command in sql_commands:
        if command.strip():  # Avoid executing empty commands
            cursor.execute(command)
    
    conn.commit()
    conn.close()

@app.route("/")
def home():
    gif_url = get_random_gif()
    # Add a random query parameter to bypass caching
    gif_url_with_cache_buster = f"{gif_url}?random={random.randint(1, 100000)}"
    print(f"GIF sent to template: {gif_url}")
    return render_template("index.html", gif_url=gif_url_with_cache_buster)

if __name__ == "__main__":
    # Initialize the database on startup (optional)
    if not os.path.exists('gifdb.sql'):
        print("No gifdb.sql found. Please ensure the SQL file is in the correct location.")
    else:
        initialize_database()

    app.run(debug=True, host='0.0.0.0', port = 5000)
