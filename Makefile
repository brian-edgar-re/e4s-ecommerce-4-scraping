# Makefile

# Build the Dockerfile
build:
	docker build -t e4s -f Dockerfile .

# Run the Docker image
run:
	docker run -p 4000:4000 e4s

.PHONY: build run
