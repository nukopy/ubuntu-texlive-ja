IMAGE_NAME="nukopy/ubuntu-texlive-ja"

.PHONY: dcbuild
dcbuild:
	docker build . -t $(IMAGE_NAME):latest

.PHONY: dcpull
dcpull:
	docker pull $(IMAGE_NAME):latest

.PHONY: dcrun
dcrun:
	docker run -d -it --rm --name latex -v $(PWD):/workdir $(IMAGE_NAME):latest

.PHONY: dcstop
dcstop:
	docker stop latex