.DEFAULT_GOAL := help

local-build:  ## Installs go deps
	go get .

local-run: ## Runs go binary locally
	go run .

docker-build: ## Builds Docker image (tags latest)
	docker build -t twilio-track .

docker-run: ## Runs Docker container with latest image
	docker run -it --rm -p 8080:8080 twilio-track

docker-stop: ## Stops Docker image
	docker stop twilio-track

kube-deploy:  ## Applies kube manifest
	kubectl apply -f twilio-track.yaml

kube-stop:  ## Deletes kube manifest
	kubectl delete -f twilio-track.yaml

.PHONY: help

help: ## Prints this help command
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) |\
		sort | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'