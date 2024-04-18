SHELL 	   	    := $(shell which bash)
    
NO_COLOR   	    := \033[0m
OK_COLOR   	    := \033[32;01m
ERR_COLOR  	    := \033[31;01m
WARN_COLOR 	    := \033[36;01m
ATTN_COLOR 	    := \033[33;01m

GOOS		    := $(shell go env GOOS)
GOARCH		    := $(shell go env GOARCH)
GOPRIVATE		:= "github.com/aserto-dev"

VAULT_VERSION	:= 1.8.12
SVU_VERSION 	:= 1.12.0
WIRE_VERSION	:= 0.6.0
BUF_VERSION 	:= 1.30.0

PROJECT         := directory
BUF_USER		:= $(shell vault kv get -field ASERTO_BUF_USER kv/buf.build)
BUF_TOKEN		:= $(shell vault kv get -field ASERTO_BUF_TOKEN kv/buf.build)
BUF_REPO		:= "buf.build/aserto-dev/${PROJECT}"
BUF_LATEST		:= $(shell BUF_BETA_SUPPRESS_WARNINGS=1 buf beta registry tag list ${BUF_REPO} --format json --reverse | jq -r '.results[0].name')
BUF_DEV_IMAGE	:= "${PROJECT}.bin"
PROTO_REPO      := "pb-${PROJECT}"

GIT_ORG         := "https://github.com/aserto-dev"

RELEASE_TAG	    := $$(svu)
    
BIN_DIR		    := ./bin
EXT_DIR		    := ./.ext
EXT_BIN_DIR	    := ${EXT_DIR}/bin
EXT_TMP_DIR	    := ${EXT_DIR}/tmp

.PHONY: deps
deps: info install-vault install-buf install-svu
	@echo -e "$(ATTN_COLOR)==> $@ $(NO_COLOR)"

.PHONY: vault-login
vault-login:
	@echo -e "$(ATTN_COLOR)==> $@ $(NO_COLOR)"
	@vault login -method=github token=$$(gh auth token)

.PHONY: buf-login
buf-login:
	@echo -e "$(ATTN_COLOR)==> $@ $(NO_COLOR)"
	@echo ${BUF_TOKEN} | ${EXT_BIN_DIR}/buf registry login --username ${BUF_USER} --token-stdin

.PHONY: buf-lint
buf-lint:
	@echo -e "$(ATTN_COLOR)==> $@ $(NO_COLOR)"
	@${EXT_BIN_DIR}/buf lint proto

.PHONY: buf-breaking
buf-breaking:
	@echo -e "$(ATTN_COLOR)==> $@ $(NO_COLOR)"
	@${EXT_BIN_DIR}/buf breaking proto --against "${GIT_ORG}/${PROTO_REPO}.git#branch=main"

.PHONY: buf-build
buf-build: ${BIN_DIR}
	@echo -e "$(ATTN_COLOR)==> $@ $(NO_COLOR)"
	@${EXT_BIN_DIR}/buf build proto --output ${BIN_DIR}/${BUF_DEV_IMAGE}

.PHONY: buf-push
buf-push:
	@echo -e "$(ATTN_COLOR)==> $@ $(NO_COLOR)"
	@${EXT_BIN_DIR}/buf push proto --tag ${RELEASE_TAG}

.PHONY: buf-mod-update
buf-mod-update:
	@echo -e "$(ATTN_COLOR)==> $@ $(NO_COLOR)"
	@${EXT_BIN_DIR}/buf mod update proto

.PHONY: buf-generate
buf-generate:
	@echo -e "$(ATTN_COLOR)==> $@ $(NO_COLOR)"
	@${EXT_BIN_DIR}/buf generate ${BUF_REPO}:${BUF_LATEST}

.PHONY: buf-generate-dev
buf-generate-dev:
	@echo -e "$(ATTN_COLOR)==> $@ $(NO_COLOR)"
	@${EXT_BIN_DIR}/buf generate "../${PROTO_REPO}/${BUF_DEV_IMAGE}"

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

.PHONY: install-vault
install-vault: ${EXT_BIN_DIR} ${EXT_TMP_DIR}
	@echo -e "$(ATTN_COLOR)==> $@ $(NO_COLOR)"
	@curl -s -o ${EXT_TMP_DIR}/vault.zip https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_${GOOS}_${GOARCH}.zip
	@unzip -o ${EXT_TMP_DIR}/vault.zip vault -d ${EXT_BIN_DIR}/  &> /dev/null
	@chmod +x ${EXT_BIN_DIR}/vault
	@${EXT_BIN_DIR}/vault --version 

.PHONY: install-buf
install-buf: ${EXT_BIN_DIR}
	@echo -e "$(ATTN_COLOR)==> $@ $(NO_COLOR)"
	@gh release download --repo https://github.com/bufbuild/buf --pattern "buf-$$(uname -s)-$$(uname -m)" --output "${EXT_BIN_DIR}/buf" --clobber
	@chmod +x ${EXT_BIN_DIR}/buf
	@${EXT_BIN_DIR}/buf --version

.PHONY: install-svu
install-svu: install-svu-${GOOS}
	@echo -e "$(ATTN_COLOR)==> $@ $(NO_COLOR)"
	@chmod +x ${EXT_BIN_DIR}/svu
	@${EXT_BIN_DIR}/svu --version

.PHONY: install-svu-darwin
install-svu-darwin: ${EXT_TMP_DIR} ${EXT_BIN_DIR}
	@echo -e "$(ATTN_COLOR)==> $@ $(NO_COLOR)"
	@gh release download --repo https://github.com/caarlos0/svu --pattern "svu_*_darwin_all.tar.gz" --output "${EXT_TMP_DIR}/svu.tar.gz" --clobber
	@tar -xvf ${EXT_TMP_DIR}/svu.tar.gz --directory ${EXT_BIN_DIR} svu &> /dev/null

.PHONY: install-svu-linux
install-svu-linux: ${EXT_TMP_DIR} ${EXT_BIN_DIR}
	@echo -e "$(ATTN_COLOR)==> $@ $(NO_COLOR)"
	@gh release download --repo https://github.com/caarlos0/svu --pattern "svu_*_linux_${GOARCH}.tar.gz" --output "${EXT_TMP_DIR}/svu.tar.gz" --clobber
	@tar -xvf ${EXT_TMP_DIR}/svu.tar.gz --directory ${EXT_BIN_DIR} svu &> /dev/null

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
