# Use the official Python image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the requirements file and install dependencies
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY . .

# Expose the port the app runs on (for local usage)
EXPOSE 5002

# Command to run the application, inheriting the port from the Procfile
CMD ["gunicorn", "unitcode:app", "--bind", "0.0.0.0:5002"]
