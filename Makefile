SERVICES := mysql phpmyadmin postgres mongo redis sqlite mailpit localstack minio

.PHONY: help $(SERVICES) up-% down-% stop-% restart-% logs-% ps-% shell-%

help: ## Display this help message
	@echo "Available commands:"
	@echo ""
	@echo "make up:                  Start all containers"
	@echo "make down:                Stop and remove all containers"
	@echo "make stop:                Stop all containers"
	@echo "make restart:             Restart all containers"
	@echo "make logs:                View logs of all containers"
	@echo "make ps:                  List all running containers"
	@echo ""
	@echo "make up-<service>:        Start a specific service"
	@echo "make down-<service>:      Stop and remove a specific service"
	@echo "make stop-<service>:      Stop a specific service"
	@echo "make restart-<service>:   Restart a specific service"
	@echo "make logs-<service>:      View logs of a specific service"
	@echo "make shell-<service>:     Open a shell in a specific container"
	@echo "make ps-<service>:        List the status of a specific service"
	@echo ""
	@echo "Services available: $(SERVICES)"

up: ## Start all containers
	docker-compose up -d

down: ## Stop and remove all containers
	docker-compose down

stop: ## Stop all containers
	docker-compose stop

restart: ## Restart all containers
	docker-compose restart

logs: ## View logs of all containers
	docker-compose logs -f

ps: ## List all running containers
	docker-compose ps

shell-%: ## Open a shell in a specific container. Usage: make shell-<service_name>
	docker-compose exec $* /bin/sh

up-%: ## Start a specific service. Usage: make up-<service_name>
	docker-compose up -d $*

down-%: ## Stop and remove a specific service. Usage: make down-<service_name>
	docker-compose rm -sf $*

stop-%: ## Stop a specific service. Usage: make stop-<service_name>
	docker-compose stop $*

restart-%: ## Restart a specific service. Usage: make restart-<service_name>
	docker-compose restart $*

logs-%: ## View logs of a specific service. Usage: make logs-<service_name>
	docker-compose logs -f $*

ps-%: ## List the status of a specific service. Usage: make ps-<service_name>
	docker-compose ps $*

mysql: ## Start MySQL and phpMyAdmin
	make up-mysql up-phpmyadmin

postgres: ## Start PostgreSQL
	make up-postgres

mongo: ## Start MongoDB
	make up-mongo

redis: ## Start Redis
	make up-redis

sqlite: ## Start SQLite
	make up-sqlite

mailpit: ## Start Mailpit mail testing server
	make up-mailpit

localstack: ## Start LocalStack AWS services
	make up-localstack

minio: ## Start MinIO S3-compatible object storage
	make up-minio

laravel: ## Start Laravel development stack
	make up-mysql up-phpmyadmin up-redis up-mailpit
