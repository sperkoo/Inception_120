DCOMPOSE = docker compose -f srcs/docker-compose.yml
DATA_PATH = home/absalah/data
DB_PATH = $(DATA_PATH)/mariadb
WP_PATH = $(DATA_PATH)/wordpress

all: build run

data:
	@mkdir -p $(DB_PATH) $(WP_PATH)
	@echo "✅ Data directories ensured."

build: data
	@$(DCOMPOSE) build
	@echo "🚀 Build completed."

run:
	@$(DCOMPOSE) up -d
	@echo "✅ Containers started."

stop:
	@$(DCOMPOSE) down
	@echo "🛑 Containers stopped."

iclean:
	@$(DCOMPOSE) down --rmi all
	@echo "🧹 Removed all images."

vclean:
	@$(DCOMPOSE) down --rmi all -v
	@rm -rf $(DATA_PATH)
	@echo "🗑️ Removed all images, volumes, and data."

fclean: vclean
	@docker system prune -af
	@echo "🔥 Full cleanup done."