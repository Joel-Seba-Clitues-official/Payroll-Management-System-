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




# Use an Ubuntu LXDE desktop with VNC server pre-installed
FROM dorowu/ubuntu-desktop-lxde-vnc

ENV DEBIAN_FRONTEND=noninteractive

# Install Python3, pip, tkinter, mysql connector dependencies
RUN apt-get update && \
    apt-get install -y python3 python3-pip python3-tk && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy requirements and install Python dependencies
COPY requirements.txt /app/
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy your main Python app code
COPY main.py /app/

# Run the Tkinter app after VNC desktop starts
CMD ["python3", "main.py"]
