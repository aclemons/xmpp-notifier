# Container image that runs your code
FROM golang:1.13.15

WORKDIR /notifier

ENV GO111MODULE=on

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY go.mod go.mod
COPY entrypoint.sh entrypoint.sh
COPY main.go main.go

RUN go mod tidy

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/notifier/entrypoint.sh"]
