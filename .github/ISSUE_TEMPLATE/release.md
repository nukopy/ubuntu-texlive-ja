## What

- [ ] Task 1
- [ ] Task 2
- [ ] ...

## Release checklist

- [ ] Update the environment variable `TEXLIVE_VERSION` in `Dockerfile` is updated to the new version
- [ ] Update the variable `TAG` in `Makefile` is updated to the new version
- [ ] Build Docker image with tag of new version
- [ ] Run tests for the new version with Docker container built on local
- [ ] Push Docker image to Docker Hub
- [ ] Run tests for the new version with Docker container pulled from Docker Hub
