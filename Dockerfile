FROM python:3.10.8-slim-buster


RUN sed -i 's|deb.debian.org|archive.debian.org|g' /etc/apt/sources.list && \
    sed -i '/security.debian.org/d' /etc/apt/sources.list && \
    apt update && apt upgrade -y

RUN apt install git -y

COPY requirements.txt /requirements.txt

RUN pip3 install -U pip && pip3 install -U -r requirements.txt

RUN mkdir /OGEva
WORKDIR /OGEva
COPY . /OGEva

CMD ["python", "bot.py"]