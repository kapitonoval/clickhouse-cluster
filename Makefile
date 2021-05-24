.PHONY: config
config:
	rm -rf ch1-1 ch1-2 ch2-1 ch2-2 ch3-1 ch3-2
	mkdir -p ch1-1 ch1-2 ch2-1 ch2-2 ch3-1 ch3-2
	REPLICA=01 SHARD=01 envsubst < config.xml > ch1-1/config.xml
	REPLICA=02 SHARD=01 envsubst < config.xml > ch1-2/config.xml
	REPLICA=03 SHARD=02 envsubst < config.xml > ch2-1/config.xml
	REPLICA=04 SHARD=02 envsubst < config.xml > ch2-2/config.xml
	REPLICA=05 SHARD=03 envsubst < config.xml > ch3-1/config.xml
	REPLICA=06 SHARD=03 envsubst < config.xml > ch3-2/config.xml
	cp users.xml ch1-1/users.xml
	cp users.xml ch1-2/users.xml
	cp users.xml ch2-1/users.xml
	cp users.xml ch2-2/users.xml
	cp users.xml ch3-1/users.xml
	cp users.xml ch3-2/users.xml

.PHONY: up
up:
	docker-compose up -d

.PHONY: start
start:
	docker-compose start

.PHONY: down
down:
	docker-compose down
