.SHELL := /bin/bash

down:
	docker-compose down

up:
	docker-compose up -d

ps:
	docker-compose ps -a

restart:
	docker-compose down
	docker-compose build
	docker-compose up -d

server:
	docker-compose exec web python manage.py migrate
	docker-compose exec web python manage.py runserver 0:8000

run:
	docker-compose down
	docker-compose build
	docker-compose up -d
	sleep 20
	docker-compose exec web python manage.py migrate
	docker-compose exec web python manage.py runserver 0:8000

bash:
	docker-compose exec web bash

migrate:
	docker-compose exec web python manage.py makemigrations
	docker-compose exec web python manage.py migrate