FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# install general packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      build-essential \
      cpanminus \
      git \
      curl \
      wget \
      locales && \
    # clean to reduce image size
    apt-get clean -y && \
    apt-get autoremove -y && \
    apt-get autoclean -y && \
    rm -rf /var/lib/apt/lists/*

# install texlive
RUN mkdir /tmp/install-tl-unx && \
    curl -L ftp://tug.org/historic/systems/texlive/2020/install-tl-unx.tar.gz | \
      tar -xz -C /tmp/install-tl-unx --strip-components=1 && \
    printf "%s\n" \
      "selected_scheme scheme-basic" \
      "tlpdbopt_install_docfiles 0" \
      "tlpdbopt_install_srcfiles 0" \
      > /tmp/install-tl-unx/texlive.profile && \
    /tmp/install-tl-unx/install-tl \
      --profile=/tmp/install-tl-unx/texlive.profile && \
    rm -rf /tmp/install-tl-unx

# add TeX Live to PATH
ENV PATH /usr/local/texlive/2020/bin/x86_64-linux:$PATH

# install LaTeX packages with tlmgr
RUN tlmgr install \
    latexmk \
    latexindent \
    collection-latexextra \
    collection-fontsrecommended \
    collection-langjapanese

COPY .latexmkrc /root

# install perl packages which are requirements of "latexindent"
RUN cpanm Log::Log4perl Log::Dispatch::File YAML::Tiny File::HomeDir Unicode::GCString

WORKDIR /workdir

CMD ["bash"]