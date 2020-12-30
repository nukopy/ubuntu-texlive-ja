FROM debian:stable-slim

RUN apt update && \
    apt upgrade -y && \
    # install packages
    apt install -y \
      fonts-ipafont \
      fonts-ipaexfont \
      texlive \
      texlive-formats-extra \
      texlive-science \
      texlive-lang-japanese && \
    # clean to reduce image size
    apt purge *-doc* *chinese* *korean* *thai* -y && \
    apt clean -y && \
    apt autoremove -y && \
    apt autoclean -y

WORKDIR /workdir
VOLUME ["/workdir"]

CMD ["bash"]