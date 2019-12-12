# Container image that runs the code
FROM alpine:latest

RUN apk update

RUN apk add git
RUN apk add bash

# Copies the file from the action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
