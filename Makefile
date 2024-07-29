build:
	@go build -o bin/ecom cmd/main.go

test:
	@go test -v ./...

run: build
	@./bin/ecom/main

MIGRATE_BIN := $(shell which migrate)

migration:
	@$(MIGRATE_BIN) create -ext sql -dir cmd/migrate/migration $(filter-out $@, $(MAKECMDGOALS))

migrate-up:
	@go run cmd/migrate/main.go up

migrate-down:
	@go run cmd/migrate/main.go down

