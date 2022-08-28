FROM ubuntu:22.04

ENV DEBIAN_FRONTEND noninteractive

ARG ARCHIVE_URL="https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz"
ARG TEXLIVE_VERSION="2022"

# Set uid and gid to the current user
# ENV USER $(whoami)
ENV UID $(id -u)
ENV GID $(id -g)

# Install general packages
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

# Install TeX Live
# ref: https://tug.org/texlive/quickinstall.html, https://github.com/Paperist/texlive-ja/blob/main/debian/Dockerfile
WORKDIR /tmp/install-tl-unx
COPY ./texlive.profile ./
RUN wget -nv ${ARCHIVE_URL} && \
  tar -xzf ./install-tl-unx.tar.gz --strip-components=1 && \
  ./install-tl --profile=./texlive.profile && \
  rm -rf /tmp/install-tl-unx

# Add TeX Live to PATH
ENV PATH /usr/local/texlive/${TEXLIVE_VERSION}/bin/x86_64-linux:$PATH

# Install LaTeX packages with tlmgr
RUN tlmgr update --self --all && tlmgr install \
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
COPY .latexmkrc /root

# Install perl packages which are requirements of "latexindent"
RUN cpanm Log::Log4perl Log::Dispatch::File YAML::Tiny File::HomeDir Unicode::GCString

WORKDIR /workdir

CMD ["bash"]