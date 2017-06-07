# Docker-related targets
DKR            ?= $(shell which docker)
DKR_BUILD_OPTS ?=
DKR_REGISTRY   ?= docker.a.snowmen.se
DKR_REPO       ?= chrisl
DKR_NAME       ?= tensor-golang
DKR_TAG        ?= latest

DKR_IMAGE      := $(strip $(DKR_NAME)):$(strip $(DKR_TAG))
DKR_NAMESPACE  := $(strip $(DKR_REGISTRY))/$(strip $(DKR_REPO))

build-docker:
	$(DKR) build $(DKR_BUILD_OPTS) -t $(DKR_IMAGE) .

push-docker:
	$(DKR) tag $(DKR_IMAGE) $(DKR_NAMESPACE)/$(DKR_IMAGE)
	$(DKR) push $(DKR_NAMESPACE)/$(DKR_IMAGE)

