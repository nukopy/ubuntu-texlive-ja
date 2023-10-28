#!/bin/bash

# add TeX Live binaries to PATH
export PATH=/usr/local/texlive/${TEXLIVE_VERSION}/bin/$(uname -m)-linux:$PATH

# entrypoint
exec "$@"
