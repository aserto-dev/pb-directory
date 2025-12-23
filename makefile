SHELL              := $(shell which bash)

NO_COLOR           := \033[0m
OK_COLOR           := \033[32;01m
ERR_COLOR          := \033[31;01m
WARN_COLOR         := \033[36;01m
ATTN_COLOR         := \033[33;01m

GOOS               := $(shell go env GOOS)
GOARCH             := $(shell go env GOARCH)
GOPRIVATE          := "github.com/aserto-dev"

BIN_DIR            := ${PWD}/bin
EXT_DIR            := ${PWD}/.ext
EXT_BIN_DIR        := ${EXT_DIR}/bin
EXT_TMP_DIR        := ${EXT_DIR}/tmp

SVU_VER 	         := 3.3.0
BUF_VER            := 1.61.0

PROJECT            := directory
BUF_REPO           := "buf.build/aserto-dev/${PROJECT}"
BUF_LATEST         := $(shell ${EXT_BIN_DIR}/buf registry module label list ${BUF_REPO} --format json | jq -r '.labels[0].name')
BUF_DEV_IMAGE      := "${PROJECT}.bin"
PROTO_REPO         := "pb-${PROJECT}"
GIT_ORG            := "https://github.com/aserto-dev"

RELEASE_TAG        := $$(${EXT_BIN_DIR}/svu current)

.DEFAULT_GOAL      := buf-build

.PHONY: deps
deps: info install-buf install-svu
	@echo -e "$(ATTN_COLOR)==> $@ $(NO_COLOR)"

.PHONY: buf-login
buf-login:
	@echo -e "$(ATTN_COLOR)==> $@ $(NO_COLOR)"
	@echo ${BUF_TOKEN} | ${EXT_BIN_DIR}/buf registry login --token-stdin

.PHONY: buf-dep-update
buf-dep-update:
	@echo -e "$(ATTN_COLOR)==> $@ $(NO_COLOR)"
	@${EXT_BIN_DIR}/buf dep update

.PHONY: buf-format
buf-format:
	@echo -e "$(ATTN_COLOR)==> $@ $(NO_COLOR)"
	@${EXT_BIN_DIR}/buf format -w proto

.PHONY: buf-build
buf-build: ${BIN_DIR}
	@echo -e "$(ATTN_COLOR)==> $@ $(NO_COLOR)"
	@${EXT_BIN_DIR}/buf build --output ${BIN_DIR}/${BUF_DEV_IMAGE}

.PHONY: buf-lint
buf-lint:
	@echo -e "$(ATTN_COLOR)==> $@ $(NO_COLOR)"
	@${EXT_BIN_DIR}/buf lint

.PHONY: buf-breaking
buf-breaking:
	@echo -e "$(ATTN_COLOR)==> $@ $(NO_COLOR)"
	@${EXT_BIN_DIR}/buf breaking --against "${GIT_ORG}/${PROTO_REPO}.git#branch=main"

.PHONY: buf-push
buf-push:
	@echo -e "$(ATTN_COLOR)==> $@ $(NO_COLOR)"
	@${EXT_BIN_DIR}/buf push --label ${RELEASE_TAG}

.PHONY: info
info:
	@echo -e "$(ATTN_COLOR)==> $@ $(NO_COLOR)"
	@echo "PROJECT:       ${PROJECT}"
	@echo "GOOS:          ${GOOS}"
	@echo "GOARCH:        ${GOARCH}"
	@echo "BIN_DIR:       ${BIN_DIR}"
	@echo "EXT_DIR:       ${EXT_DIR}"
	@echo "EXT_BIN_DIR:   ${EXT_BIN_DIR}"
	@echo "EXT_TMP_DIR:   ${EXT_TMP_DIR}"
	@echo "RELEASE_TAG:   ${RELEASE_TAG}"
	@echo "BUF_REPO:      ${BUF_REPO}"
	@echo "BUF_LATEST:    ${BUF_LATEST}"
	@echo "BUF_DEV_IMAGE: ${BUF_DEV_IMAGE}"
	@echo "PROTO_REPO:    ${PROTO_REPO}"

.PHONY: install-buf
install-buf: ${EXT_BIN_DIR}
	@echo -e "$(ATTN_COLOR)==> $@ $(NO_COLOR)"
	@GOBIN=${EXT_BIN_DIR} go install github.com/bufbuild/buf/cmd/buf@v${BUF_VER}
	@${EXT_BIN_DIR}/buf --version

.PHONY: install-svu
install-svu: ${EXT_BIN_DIR}
	@echo -e "$(ATTN_COLOR)==> $@ $(NO_COLOR)"
	@GOBIN=${EXT_BIN_DIR} go install github.com/caarlos0/svu/v3@v${SVU_VER}
	@${EXT_BIN_DIR}/svu --version

.PHONY: clean
clean:
	@echo -e "$(ATTN_COLOR)==> $@ $(NO_COLOR)"
	@rm -rf ./.ext
	@rm -rf ./bin

.PHONY: clean-gen
clean-gen:
	@echo -e "$(ATTN_COLOR)==> $@ $(NO_COLOR)"
	@rm -rf ./aserto

${BIN_DIR}:
	@echo -e "$(ATTN_COLOR)==> $@ $(NO_COLOR)"
	@mkdir -p ${BIN_DIR}

${EXT_BIN_DIR}:
	@echo -e "$(ATTN_COLOR)==> $@ $(NO_COLOR)"
	@mkdir -p ${EXT_BIN_DIR}

${EXT_TMP_DIR}:
	@echo -e "$(ATTN_COLOR)==> $@ $(NO_COLOR)"
	@mkdir -p ${EXT_TMP_DIR}
