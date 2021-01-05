.PHONY: dcbuild
dcbuild:
	docker build . -t nukopy/ubuntu-latex-jp:latest

.PHONY: dcpull
dcpull:
	docker pull nukopy/ubuntu-latex-jp:latest

.PHONY: dcrun
dcrun:
	docker run -d -it --rm --name latex -v $(PWD):/workdir nukopy/ubuntu-latex-jp:latest

.PHONY: dcstop
dcstop:
	docker stop latex