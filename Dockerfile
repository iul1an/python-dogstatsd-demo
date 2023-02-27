FROM python:alpine3.11

WORKDIR /python-docker

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY app.py .

ENTRYPOINT ["gunicorn", "app:app"]
CMD ["-b", "0.0.0.0:8080"]

EXPOSE 8080
