# ubuntu-texlive-ja

[![Build Docker image and Push to Docker Hub][ci-badge]][ci-badge-link]
[![Docker Image Version (tag latest semver)][docker-image-version-badge]][docker-image-version-badge-link]
[![Docker Image Size][docker-image-size-badge]][docker-image-size-badge-link]
[![Docker Pulls][docker-pulls-badge]][docker-pulls-badge-link]

[ci-badge]: https://img.shields.io/github/actions/workflow/status/nukopy/ubuntu-texlive-ja/build_and_push.yml?branch=master&label=build%20and%20push
[ci-badge-link]: https://github.com/nukopy/ubuntu-texlive-ja/actions/workflows/build_and_push.yml
[docker-image-version-badge]: https://img.shields.io/docker/v/nukopy/ubuntu-texlive-ja
[docker-image-version-badge-link]: https://hub.docker.com/repository/docker/nukopy/ubuntu-texlive-ja
[docker-image-size-badge]: https://img.shields.io/docker/image-size/nukopy/ubuntu-texlive-ja
[docker-image-size-badge-link]: https://hub.docker.com/repository/docker/nukopy/ubuntu-texlive-ja
[docker-pulls-badge]: https://img.shields.io/docker/pulls/nukopy/ubuntu-texlive-ja
[docker-pulls-badge-link]: https://hub.docker.com/repository/docker/nukopy/ubuntu-texlive-ja

Docker image for writing environment for Japanese documents with LaTeX / TeX Live

- Docker Hub: [nukopy/ubuntu-texlive-ja](https://hub.docker.com/repository/docker/nukopy/ubuntu-texlive-ja)

## Supported Platforms

This Docker image supports:

- `linux/amd64` (TeX Live x86_64-linux build)
- `linux/arm64v8` (TeX Live aarch64-linux build)

Platforms supported by Docker are [here](https://github.com/docker-library/official-images#architectures-other-than-amd64).<br>
Platforms supported by TeX Live are [here](https://tug.org/texlive/doc.html#:~:text=Perl%C2%A0modules.-,Supported%20systems,-If%20you%20can).

## Installation

```sh
docker pull nukopy/ubuntu-texlive-ja
```

## Usage

```sh
# on local machine
docker run --rm -it -v $(pwd):/workdir nukopy/ubuntu-texlive-ja

# in Docker container
cd ./test/document
latexmk -pvc ./main.tex
# When you edit ./main.tex, ./main.pdf is automatically updated.
```

You can create TeX documents in any location and with any filename you prefer. Try to create `<filename>.tex` and `latexmk -pvc path/to/<filename>.tex` in the container.

## for Developers: Checklist for Version up of TeX Live

- [ ] Update the environment variable `TEXLIVE_VERSION` in `Dockerfile` is updated to the new version
- [ ] Update the variable `TAG` in `Makefile` is updated to the new version
- [ ] Build Docker image with tag of new version
- [ ] Run tests for the new version with Docker container built on local
- [ ] Push Docker image to Docker Hub
- [ ] Run tests for the new version with Docker container pulled from Docker Hub

If the last step is passed, release the new version!

### Build

- Build Docker image with tag of new version

```sh
docker build . -t nukopy/ubuntu-texlive-ja:[tag]
```

- Build Docker image with tag of new version for multi-platforms

```sh
docker buildx build . --platform linux/amd64,linux/arm64 -t nukopy/ubuntu-texlive-ja:[tag]
```

### Tests with Docker container built on local

```sh
make test
make test-slide # test for beamer
```

### Push Docker image to Docker Hub

To deploy new Docker image to Docker Hub, run the following commands:

- Before push to Docker Hub, login to Docker Hub

```sh
docker login
```

- Push Docker image to Docker Hub

```sh
docker push nukopy/ubuntu-texlive-ja:[tag]
```

- Push Docker image to Docker Hub for multi-platforms

```sh
docker buildx build . --platform linux/amd64,linux/arm64 -t nukopy/ubuntu-texlive-ja:[tag] --push
```

### Tests with Docker container pulled from Docker Hub

In this repository, build and push Docker image to Docker Hub with [GitHub Actions workflow](https://github.com/nukopy/ubuntu-texlive-ja/actions) automatically when tags are pushed to GitHub repository.

For tests, push Docker image to Docker Hub with a tag for test like `test-ci`. Don't use tags like `texlive2023` on test because it is used for release versions.

```sh
# push a tag for test
git tag -a test-ci -m "Release test-ci :tada:" && git push origin test-ci

# pull Docker image with a tag for test from Docker Hub
docker pull nukopy/ubuntu-texlive-ja:test-ci

# before run tests, you should change the tag of Docker image `TAG` in `Makefile` like `TAG := test-ci`
# run tests with Docker container pulled from Docker Hub
make test
```

## References

Official documentation of TeX Live:

- [TeX Live - TeX Users Group](https://tug.org/texlive/)
  - TeX Live HP
- [TeX Live Guide 2022 - TeX Users Group(ja)](https://tug.org/texlive/doc/texlive-ja/texlive-ja.pdf)
  - An installation guide in Japanese
- [install-tl - TeX Live cross-platform installer](https://tug.org/texlive/doc/install-tl.html)
  - Documentation of TeX Live Installer `install-tl`

Blog posts about TeX Live:

- [(2017) TexLive の コレクションについて](https://takec.hatenablog.jp/entry/2017/09/18/091532)

This repository is inspired by the following repositories:

- [Paperist/docker-alpine-texlive-ja](https://github.com/Paperist/docker-alpine-texlive-ja)
- [johejo/debian-latex-jp](https://github.com/johejo/debian-latex-jp)
- [t-hishinuma/tex-docker](https://github.com/t-hishinuma/tex-docker)
- [csg-projects/latexindent-dockerfile](https://github.com/csg-projects/latexindent-dockerfile)

Official documentation of Docker:

- [Multi-platform images | Docker Docs](https://docs.docker.com/build/building/multi-platform/)
- [`docker buildx build` | docker docs](https://docs.docker.com/engine/reference/commandline/buildx_build/)
- [github.com/docker-library/official-images - Architectures other than amd64?](https://github.com/docker-library/official-images#architectures-other-than-amd64)
