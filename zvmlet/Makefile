NODE_VERSION := 16
ZVMLET_VERSION := 1.0.0

.DEFAULT_GOAL := help
.PHONY: help
help: ## ℹ️ Show this help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

up: run
start: run
run: ## 🚀 Run all the components quickly
	@echo "🚀 Launching the zvmlet"
	@echo ""
	@echo "🚨 Please don't forget to populate ./contracts before launching the service"
	docker compose up -d

logs: ## 📋 Show the logs of the containers
	@echo "📋 Showing the logs of the containers"
	docker compose logs -f

down: halt
stop: halt
halt: ## 💔 Stop all the components
	@echo "💔 Stopping the Docker containers"
	docker compose down

clean: ## 🗑  Clean the containers
	@echo "🗑 Cleaning the Docker containers"
	docker compose down -v --rmi all --remove-orphans


