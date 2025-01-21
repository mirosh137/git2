# Use an official Python runtime as a base image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container
COPY . /app

# Install dependencies from the requirements.txt file
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port the app will run on
EXPOSE 5000

# Define environment variable for Flask app
ENV FLASK_APP=app.py

# Set Flask to run in production mode (optional)
ENV FLASK_ENV=development

# Run the Flask app
CMD ["flask", "run", "--host=0.0.0.0"]

