up:
	docker compose up --build -d

up-prod:
	docker compose -f docker-compose.yaml build --no-cache
	docker compose -f docker-compose.yaml up -d

down:
	docker compose down

purge:
	docker compose down --volumes

delete:
	docker compose down --rmi all --volumes

ssh:
	docker compose exec -u webuser web bash

ssh-root:
	docker compose exec web bash

composer-install:
	docker compose exec -u webuser web composer install --no-interaction --no-progress

cache-clear:
	docker compose exec -u webuser web php bin/console cache:clear
	docker compose exec -u webuser web php bin/console cache:warmup
