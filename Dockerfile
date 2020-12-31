FROM debian:stable-slim

# install general packages
RUN apt update && \
    apt upgrade -y && \
    apt install -y \
      git

# install packages for LaTeX
RUN apt update && \
    apt upgrade -y && \
    apt install -y \
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