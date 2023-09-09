FROM python:3.9-alpine

WORKDIR /app

RUN pip install --upgrade pip

RUN apk add --no-cache gcc musl-dev python3-dev graphviz

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["gunicorn", "--config=gunicorn_conf.py", "app:app"]
