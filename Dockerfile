# # Use official Python image
# FROM python:3.10-slim

# # Set the working directory
# WORKDIR /app

# # Copy source code into the image
# COPY . .

# # Install dependencies
# RUN pip install --no-cache-dir -r requirements.txt

# # Expose port (change if your app uses a different one)
# EXPOSE 8000

# # Run the application
# CMD ["python", "login.py"]




FROM dorowu/ubuntu-desktop-lxde-vnc

# Prevent GUI prompts during install
ENV DEBIAN_FRONTEND=noninteractive

# Install Python 3, pip, and Tkinter
RUN apt-get update && \
    apt-get install -y python3 python3-pip python3-tk

# Set working directory inside container
WORKDIR /app

# Copy all project files, including requirements.txt
COPY . /app

# Install all dependencies
RUN pip3 install --no-cache-dir -r requirements.txt

# Make sure main.py is executable (optional)
RUN chmod +x main.py

# Run the Tkinter app when the container starts
CMD ["python3", "main.py"]
