FROM python:3.9

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

COPY requirements.txt .

# install python dependencies
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8081/udp
EXPOSE 8080/udp
EXPOSE 8000/udp
EXPOSE 3000/udp
EXPOSE 5005/udp
EXPOSE 8081/tcp
EXPOSE 8080/tcp
EXPOSE 8000/tcp
EXPOSE 3000/tcp
EXPOSE 5005/tcp



# gunicorn
CMD ["gunicorn", "--config", "gunicorn-cfg.py", "test:app"]
