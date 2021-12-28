FROM python:3
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
WORKDIR /template-django-flutter
ADD requirements.txt /template-django-flutter/
RUN pip install -r requirements.txt
COPY . /template-django-flutter/