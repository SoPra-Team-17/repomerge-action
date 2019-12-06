# Container image that runs the code
FROM alpine:latest

RUN apk update

RUN apk add git
RUN apk add bash
RUN apk add curl
RUN apk add jq
RUN apk add python3
RUN apk add git-fast-import
ADD https://raw.githubusercontent.com/newren/git-filter-repo/master/git-filter-repo  /usr/libexec/git-core/
RUN chmod +x /usr/libexec/git-core/git-filter-repo

# Copies the file from the action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
