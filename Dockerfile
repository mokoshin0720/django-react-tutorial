FROM python:3
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
WORKDIR /django-react-tutorial
ADD requirements.txt /django-react-tutorial/
RUN pip install -r requirements.txt
COPY . /django-react-tutorial/