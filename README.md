# debian-latex-jp

Docker image for LaTeX.

- Docker Hub: [nukopy/ubuntu-texlive-ja](https://hub.docker.com/repository/docker/nukopy/ubuntu-texlive-ja)

## Usage

- start container

```sh
# pull Docker image
make dcpull

# run container on background
make dcrun

# execute LaTeX command in container
docker exec latex bash -c "LaTeX command"

# stop container
make dcstop
```

You can conveniently edit LaTeX files in Docker container with VSCode extension "Remote - Containers" after `make dcrun`. If you wanna do this, you can use VSCode template repository.

## cf

The repository is based on the following repositories:

- [johejo/debian-latex-jp](https://github.com/johejo/debian-latex-jp)
- [t-hishinuma/tex-docker](https://github.com/t-hishinuma/tex-docker)
- [csg-projects/latexindent-dockerfile](https://github.com/csg-projects/latexindent-dockerfile)
- [Paperist/docker-alpine-texlive-ja](https://github.com/Paperist/docker-alpine-texlive-ja)
- [TeX Live Guide 2020 - TeX Users Group(ja)](https://tug.org/texlive/doc/texlive-ja/texlive-ja.pdf)
