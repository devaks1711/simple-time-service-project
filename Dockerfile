# Use Python 3.10 slim image
FROM python:3.10-slim

# Create non-root user
RUN useradd -m appuser

# Set working directory
WORKDIR /home/appuser/app

# Copy only requirements and install first (cache layer)
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the actual application code
COPY app/ .

# Switch to non-root user
USER appuser

# Expose port
EXPOSE 8080

# Run the app
CMD ["python", "main.py"]

