.DEFAULT_GOAL := help

local-build:  ## Installs go deps
	go get .

local-run: ## Runs go binary locally
	go run .

docker-build: ## Builds docker image
	docker build -t twilio-go-foobar .

docker-run: ## Runs docker image
	docker run --name foobar -it --rm -p 30000:5000 twilio-go-foobar

docker-stop: ## Stops docker image
	docker stop foobar

kube-deploy:  ## Applies kube manifest
	kubectl apply -f foobar.yaml

kube-stop:  ## Deletes kube manifest
	kubectl delete -f foobar.yaml

.PHONY: help

help: ## Prints this help command
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) |\
		sort | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'