# ubuntu-texlive-ja

Docker image for TeX Live.
This image is registered on Docker Hub.

- Docker Hub: [nukopy/ubuntu-texlive-ja](https://hub.docker.com/repository/docker/nukopy/ubuntu-texlive-ja)

## Usage

```sh
docker build . -t nukopy/ubuntu-texlive-ja:latest
docker pull nukopy/ubuntu-texlive-ja:latest
docker run -d -it --rm --name texlive-ja -v $(PWD):/workdir nukopy/ubuntu-texlive-ja:latest
docker exec latex bash -c "LaTeX command..."
docker stop texlive-ja
```

## cf

The repository is based on the following repositories:

- [johejo/debian-latex-jp](https://github.com/johejo/debian-latex-jp)
- [t-hishinuma/tex-docker](https://github.com/t-hishinuma/tex-docker)
- [csg-projects/latexindent-dockerfile](https://github.com/csg-projects/latexindent-dockerfile)
- [Paperist/docker-alpine-texlive-ja](https://github.com/Paperist/docker-alpine-texlive-ja)
- [TeX Live Guide 2020 - TeX Users Group(ja)](https://tug.org/texlive/doc/texlive-ja/texlive-ja.pdf)
