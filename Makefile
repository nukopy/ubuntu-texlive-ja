IMAGE_NAME := nukopy/ubuntu-texlive-ja
TAG := texlive2023
# TAG := test-ci

.PHONY: run
run:
	docker run --rm -it -v $(PWD):/workdir -u $(id -u):$(id -g) $(IMAGE_NAME):$(TAG)

.PHONY: test
test:
	docker run --rm -v $(PWD):/workdir -u $(id -u):$(id -g) $(IMAGE_NAME):$(TAG) bash -c "cd test/document && latexmk -pvc main.tex"

.PHONY: test-slide
test-slide:
	docker run --rm -v $(PWD):/workdir -u $(id -u):$(id -g) $(IMAGE_NAME):$(TAG) bash -c "cd test/slide && latexmk -pvc main.tex"

.PHONY: in
in:
	docker run --rm -it -v $(PWD):/workdir -u $(id -u):$(id -g) $(IMAGE_NAME):$(TAG) bash
