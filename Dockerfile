# use Python runtime as a parent image
FROM python:3.10-slim

# set working directory
WORKDIR /app

# install build dependencies and Python dev tools
RUN apt-get update && apt-get install -y \
    gcc \
    build-essential \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# copy directory contents into the container
COPY . /app

# install needed packages
RUN pip install --no-cache-dir -r requirements.txt

# expose port 5000
EXPOSE 5000

# define environment variables
ENV FLASK_APP=app.py

# run the app
CMD ["flask", "run", "--host=0.0.0.0"]