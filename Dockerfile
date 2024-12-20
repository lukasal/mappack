# base Image
FROM python:3.9.20-slim
# Install ssl upgrade because of vulnerability
# Update package list, upgrade OpenSSL, and clean up
RUN apt-get update && \
    apt-get install -y openssl && \
    apt-get upgrade -y openssl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
# Create a working directory
WORKDIR /app
# Copy the remaining files and source code
COPY . . 
# Install python packages
RUN pip install -r requirements.txt
# Expose port 5000 for FastAPI inside the container
EXPOSE 5000
# Start and run the Fast API app in the container
CMD ["python", "main.py"]