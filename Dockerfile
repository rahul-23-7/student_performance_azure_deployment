# Stage 1: Build the Application
FROM python:3.9 AS builder

# Set working directory
WORKDIR /app

# Copy only requirements file to ensure dependencies are cached
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Stage 2: Create the Final Image
FROM python:3.9-slim-buster

# Set working directory
WORKDIR /app

# Copy the application code and dependencies from the builder stage
COPY --from=builder /usr/local/lib/python3.9/site-packages /usr/local/lib/python3.9/site-packages
COPY --from=builder /usr/local/bin /usr/local/bin

# Copy your application files into the container
COPY . .

# Set environment variables (if needed)
# ENV VARIABLE_NAME=value

# Command to run your data science application
CMD ["python3", "app.py"]





#FROM python:3.9-slim-buster
#WORKDIR /app
#COPY . /app

#RUN apt update -y

#RUN apt-get update && pip install -r requirements.txt
#CMD ["python3", "app.py"]

