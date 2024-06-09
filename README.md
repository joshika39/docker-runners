# Containerized Github Runner

This repository contains a Dockerfile to build a container image for a self-hosted Github runner. The runner is based on the official Github runner image and adds some additional tools and configurations.

## Usage

### When building the image

Required environment variables:
- `GH_PROFILE`: The Github profile to register the runner with.
- `AUTHOR`: The author of the image.
- `EMAIL`: The email of the author.
- `RUNNER_VERSION`: The version of the runner

```bash
docker build \
  --build-arg GH_PROFILE=<GH_PROFILE> \
  --build-arg AUTHOR=<AUTHOR> \
  --build-arg EMAIL=<EMAIL> \
  --build-arg RUNNER_VERSION=<RUNNER_VERSION> \
  -t gh-runner:<RUNNER_VERSION> .
```

## When running the container

You need to Check the `repo` and `admin:org` permissions when creating the token.

### When running the container with docker

```bash
docker run -d \
  --name gh-runner \
  -e GH_OWNER=<GH_OWNER> \
  -e GH_REPOSITORY=<GH_REPOSITORY> \
  -e GH_TOKEN=<GH_TOKEN> \
  gh-runner:<RUNNER_VERSION> -d
```

Required environment variables:

- `GH_OWNER`: The owner of the repository.
- `GH_REPOSITORY`: The repository to register the runner with.
- `GH_TOKEN`: The token to authenticate the runner with.


### When running the container with docker-compose

```yaml

name: gh-runner

services:
  gh-runner:
    image: gh-runner:<RUNNER_VERSION>
    container_name: gh-runner
    restart: unless-stopped
    environment:
      - GH_OWNER=<GH_OWNER>
      - GH_REPOSITORY=<GH_REPOSITORY
      - GH_TOKEN=<GH_TOKEN>

```


