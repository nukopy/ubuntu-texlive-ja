# ubuntu-texlive-ja

![Docker Automated build](https://img.shields.io/docker/automated/nukopy/ubuntu-texlive-ja) ![Docker Image Version (tag latest semver)](https://img.shields.io/docker/v/nukopy/ubuntu-texlive-ja/texlive2022)

Docker image for writing environment for Japanese documents with TeX Live / LaTeX

- Docker Hub: [nukopy/ubuntu-texlive-ja](https://hub.docker.com/repository/docker/nukopy/ubuntu-texlive-ja)

## Tests

```sh
git clone git@github.com:nukopy/ubuntu-texlive-ja.git
cd ubuntu-texlive-ja/
docker pull nukopy/ubuntu-texlive-ja:latest
make test
make test-slide # test for beamer
```

## Commands for Docker Hub

To deploy new Docker image to Docker Hub, run the following commands:

```sh
docker login
docker build . -t nukopy/ubuntu-texlive-ja:[tag]
docker push nukopy/ubuntu-texlive-ja:[tag]
```

## References

The repository is based on the following repositories:

- [Paperist/docker-alpine-texlive-ja](https://github.com/Paperist/docker-alpine-texlive-ja)
- [johejo/debian-latex-jp](https://github.com/johejo/debian-latex-jp)
- [t-hishinuma/tex-docker](https://github.com/t-hishinuma/tex-docker)
- [csg-projects/latexindent-dockerfile](https://github.com/csg-projects/latexindent-dockerfile)

An installation guide in Japanese is below:

- [TeX Live Guide 2022 - TeX Users Group(ja)](https://tug.org/texlive/doc/texlive-ja/texlive-ja.pdf)
