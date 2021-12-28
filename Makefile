.SHELL := /bin/bash

down:
	docker-compose down

ps:
	docker-compose ps -a

restart:
	docker-compose down
	docker-compose up -d

server:
	docker-compose exec web python3 manage.py migrate
	docker-compose exec web python manage.py runserver 0:8000