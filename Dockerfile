# Use an official Python runtime as base image
FROM python:3.10-slim

# Set working directory inside the container
WORKDIR /app

# Copy dependency file & install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the code
COPY . .

# Expose the port Flask runs on
EXPOSE 5000

# Define the default command to run the app
CMD ["python", "app.py"]
