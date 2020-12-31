FROM debian:stable-slim

RUN apt update && \
    apt upgrade -y && \
    # install packages
    apt install -y \
      git \
      fonts-ipafont \
      fonts-ipaexfont \
      texlive \
      texlive-formats-extra \
      texlive-science \
      texlive-lang-japanese \
      latexmk && \
    # clean to reduce image size
    apt purge *-doc* *chinese* *korean* *thai* -y && \
    apt clean -y && \
    apt autoremove -y && \
    apt autoclean -y

WORKDIR /workdir

CMD ["bash"]