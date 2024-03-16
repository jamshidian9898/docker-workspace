.PHONY: db-mysql-up db-mysql-down db-mysql-logs db-mysql-bash db-redis-up db-redis-down db-redis-logs db-redis-bash db-milisearch-up db-milisearch-down db-milisearch-logs db-milisearch-bash ps

# --------------------------------- mysql ---------------------------------
db-mysql-up:
	docker-compose -f database/mysql/docker-compose.yml up -d
db-mysql-down:
	docker-compose -f database/mysql/docker-compose.yml down
db-mysql-logs:
	docker-compose -f database/mysql/docker-compose.yml logs
db-mysql-bash:
	docker-compose -f database/mysql/docker-compose.yml exec db-mysql bash

# --------------------------------- redis ---------------------------------
db-redis-up:
	docker-compose -f database/redis/docker-compose.yml up -d
db-redis-down:
	docker-compose -f database/redis/docker-compose.yml down
db-redis-logs:
	docker-compose -f database/redis/docker-compose.yml logs
db-redis-bash:
	docker-compose -f database/redis/docker-compose.yml exec db-redis bash

# --------------------------------- milisearch ---------------------------------
db-milisearch-up:
	docker-compose -f database/milisearch/docker-compose.yml up -d
db-milisearch-down:
	docker-compose -f database/milisearch/docker-compose.yml down
db-milisearch-logs:
	docker-compose -f database/milisearch/docker-compose.yml logs
db-milisearch-bash:
	docker-compose -f database/milisearch/docker-compose.yml exec db-meilisearch bash

ps:
	docker ps -a

ps-f:
	@watch "docker ps -a"
	# while true; do \
    #     clear; \
    #     docker ps -a; \
    #     sleep 2; \
    # done
