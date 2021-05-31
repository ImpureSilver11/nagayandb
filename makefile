usage:
	echo [build bash up stop db]

build:
	docker-compose build


bash:
	docker-compose exec app bash

up:
	docker-compose up

stop:
	docker-compose down

migrate:
	docker-compose exec app bundle exec rails db:environment:set RAILS_ENV=development
	docker-compose exec app bundle exec rails db:drop db:create db:migrate:reset db:seed

db:
	docker-compose exec postgres bash