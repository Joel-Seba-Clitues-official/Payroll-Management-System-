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

# Prevent interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Fix GPG error + install Python, pip, tkinter
RUN rm /etc/apt/sources.list.d/google-chrome.list || true && \
    apt-get update && \
    apt-get install -y python3 python3-pip python3-tk && \
    pip3 install -r requirements.txt

# Set working directory
WORKDIR /app

# Copy all files into container
COPY . /app

# Run your Tkinter app
CMD ["python3", "main.py"]

