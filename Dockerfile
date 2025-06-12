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




# # Use a base image with GUI and VNC support
# FROM dorowu/ubuntu-desktop-lxde-vnc

# # Avoid Chrome repo errors
# RUN rm -f /etc/apt/sources.list.d/google-chrome.list

# # Set environment variable to avoid interactive prompts
# ENV DEBIAN_FRONTEND=noninteractive

# # Install Python and required packages
# RUN apt-get update && \
#     apt-get install -y python3 python3-pip python3-tk && \
#     apt-get clean && rm -rf /var/lib/apt/lists/*

# # Set the working directory
# WORKDIR /app

# # Copy app code and requirements
# COPY . /app
# COPY requirements.txt /app/

# # Install Python dependencies
# RUN pip3 install --no-cache-dir -r requirements.txt

# # Run the Python Tkinter app
# CMD ["python3", "main.py"]



# Use a base image with GUI and VNC support
FROM dorowu/ubuntu-desktop-lxde-vnc

# Avoid Chrome repo errors
RUN rm -f /etc/apt/sources.list.d/google-chrome.list

# Set environment variable to avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install Python and required packages
RUN apt-get update && \
    apt-get install -y python3 python3-pip python3-tk && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy project files
COPY . /app

# Install Python dependencies
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy and enable the GUI startup script
COPY startup.sh /startup.sh
RUN chmod +x /startup.sh

# Run the app inside the VNC session
CMD ["/startup.sh"]

