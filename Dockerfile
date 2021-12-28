FROM python:3
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
WORKDIR /backend
ADD requirements.txt /backend/
RUN pip install -r requirements.txt
COPY . /backend/