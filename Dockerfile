FROM python:3.9-alpine

WORKDIR /app

# Upgrade pip
RUN pip install --upgrade pip

RUN apk add --no-cache gcc musl-dev python3-dev graphviz linux-headers

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["gunicorn", "--config=gunicorn_conf.py", "app:app"]
