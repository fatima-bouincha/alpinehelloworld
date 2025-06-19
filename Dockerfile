

FROM alpine:latest

# Install Python3, pip and virtualenv
RUN apk add --no-cache python3 py3-pip py3-virtualenv bash

# Copy requirements
ADD ./webapp/requirements.txt /tmp/requirements.txt

# Create and activate virtual environment
RUN python3 -m venv /opt/venv && \
    . /opt/venv/bin/activate && \
    pip install --upgrade pip && \
    pip install --no-cache-dir -r /tmp/requirements.txt

# Add the rest of your application code
ADD ./webapp /app

# Activate the virtual environment when starting the container
ENV PATH="/opt/venv/bin:$PATH"

CMD ["python3", "/app/app.py"]
