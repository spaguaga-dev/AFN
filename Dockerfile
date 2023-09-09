FROM python:3.9-alpine

WORKDIR /app

RUN pip install --upgrade pip

RUN apt-get update && \
    apt-get install -y gcc python3-dev graphviz && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN apt-get update && apt-get install -y graphviz && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["gunicorn", "--config=gunicorn_conf.py", "app:app"]
