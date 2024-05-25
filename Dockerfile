FROM python:3
WORKDIR /app
COPY script.py /app/
CMD ["python", "script.py"]
