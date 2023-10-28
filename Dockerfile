FROM ubuntu:22.04

ENV DEBIAN_FRONTEND noninteractive

# Set uid and gid to the current user
ARG USER
ARG UID
ARG GID

# --------------------------------------
# Install general packages
# --------------------------------------

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      build-essential \
      cpanminus \
      git \
      curl \
      wget \
      locales \
      libfontconfig1 \
      ca-certificates && \
    # clean to reduce image size
    apt-get clean -y && \
    apt-get autoremove -y && \
    apt-get autoclean -y && \
    rm -rf /var/lib/apt/lists/*

# --------------------------------------
# Install TeX Live
# ref: https://tug.org/texlive/quickinstall.html, https://github.com/Paperist/texlive-ja/blob/main/debian/Dockerfile
# --------------------------------------

# Set ARG and ENV for installation of TeX Live
# `TEXLIVE_VERSION` is used on `docker-entrypoint.sh`
ARG ARCHIVE_URL="https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz"
ENV TEXLIVE_VERSION "2023"

# Install TeX Live
WORKDIR /tmp/install-tl-unx
COPY ./texlive.profile ./
RUN wget -nv ${ARCHIVE_URL} && \
  tar -xzf ./install-tl-unx.tar.gz --strip-components=1 && \
  ./install-tl --profile=./texlive.profile --no-interaction && \
  rm -rf /tmp/install-tl-unx

# --------------------------------------
# Install LaTeX packages
# --------------------------------------

# Copy `docker-entrypoint.sh` for adding TeX Live binaries to PATH
COPY ./docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

# Install LaTeX packages with tlmgr
RUN . /docker-entrypoint.sh && \
  tlmgr update --self --all && tlmgr install \
  collection-basic \
  collection-latexrecommended \
  collection-xetex \
  collection-bibtexextra \
  collection-binextra \
  collection-fontsrecommended \
  collection-langenglish \
  collection-langjapanese \
  collection-pictures \
  collection-mathscience \
  beamer \
  latexmk \
  latexindent

# Copy latexmk config file
COPY .latexmkrc /root

# Install perl packages which are requirements of "latexindent"
RUN cpanm Log::Log4perl Log::Dispatch::File YAML::Tiny File::HomeDir Unicode::GCString

# --------------------------------------
# Setting for workspace
# --------------------------------------

WORKDIR /workdir

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["bash"]
