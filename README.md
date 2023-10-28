# ubuntu-texlive-ja

![Docker Automated Build](https://img.shields.io/docker/automated/nukopy/ubuntu-texlive-ja) ![Docker Image Size](https://img.shields.io/docker/image-size/nukopy/ubuntu-texlive-ja) ![Docker Image Version (tag latest semver)](https://img.shields.io/docker/v/nukopy/ubuntu-texlive-ja/texlive2022)

Docker image for writing environment for Japanese documents with TeX Live / LaTeX

- Docker Hub: [nukopy/ubuntu-texlive-ja](https://hub.docker.com/repository/docker/nukopy/ubuntu-texlive-ja)

## Supported Platforms

- [x] `linux/amd64`
- [x] `linux/arm64v8`

See [more info](https://github.com/docker-library/official-images#architectures-other-than-amd64).

## Installation

```sh
docker pull nukopy/ubuntu-texlive-ja
```

## Usage

```sh
docker run --rm -it -v $(pwd):/workdir nukopy/ubuntu-texlive-ja
latexmk -pvc main.tex
```

## for Developers: Checklist for Version up of TeX Live

- [ ] Update the environment variable `TEXLIVE_VERSION` in `Dockerfile` is updated to the new version
- [ ] Update the variable `TAG` in `Makefile` is updated to the new version
- [ ] Build Docker image with tag of new version
- [ ] Run tests for the new version
- [ ] Push Docker image to Docker Hub

### Build

- Build Docker image with tag of new version

```sh
docker build . -t nukopy/ubuntu-texlive-ja:[tag]
```

- Build Docker image with tag of new version for multi-platforms

```sh
docker buildx build . --platform linux/amd64,linux/arm64 -t nukopy/ubuntu-texlive-ja:[tag]
```

### Tests

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
