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

### When running the container

Required environment variables:

- `GH_OWNER`: The owner of the repository.
- `GH_REPOSITORY`: The repository to register the runner with.
- `GH_TOKEN`: The token to authenticate the runner with.


