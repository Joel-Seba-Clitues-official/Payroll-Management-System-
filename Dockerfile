# Use official Python image
FROM python:3.10-slim

# Set the working directory
WORKDIR /app

# Copy source code into the image
COPY . .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose port (change if your app uses a different one)
EXPOSE 8000

# Run the application
CMD ["python", "login.py"]
