SHELL 	   	:= $(shell which bash)

NO_COLOR   	:= \033[0m
OK_COLOR   	:= \033[32;01m
ERR_COLOR  	:= \033[31;01m
WARN_COLOR 	:= \033[36;01m
ATTN_COLOR 	:= \033[33;01m

BUF_USER	:= $(shell vault kv get -field ASERTO_BUF_USER kv/buf.build)
BUF_TOKEN	:= $(shell vault kv get -field ASERTO_BUF_TOKEN kv/buf.build)

BUF_VERSION := 1.30.0
SVU_VERSION := 1.12.0

GOOS		:= $(shell go env GOOS)
GOARCH		:= $(shell go env GOARCH)

RELEASE_TAG	:= $$(svu)

BIN_DIR		:= ./bin
EXT_DIR		:= ./.ext
EXT_BIN_DIR	:= ${EXT_DIR}/bin
EXT_TMP_DIR	:= ${EXT_DIR}/tmp

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
	@${EXT_BIN_DIR}/buf breaking proto --against "https://github.com/d5s-io/directory.git#branch=main"

.PHONY: buf-build
buf-build: ${BIN_DIR}
	@echo -e "$(ATTN_COLOR)==> $@ $(NO_COLOR)"
	@${EXT_BIN_DIR}/buf build proto --output ${BIN_DIR}/directory.bin


.PHONY: buf-push
buf-push:
	@echo -e "$(ATTN_COLOR)==> $@ $(NO_COLOR)"
	@${EXT_BIN_DIR}/buf push proto --tag ${RELEASE_TAG}

.PHONY: buf-mod-update
buf-mod-update:
	@echo -e "$(ATTN_COLOR)==> $@ $(NO_COLOR)"
	@${EXT_BIN_DIR}/buf mod update proto

.PHONY: info
info:
	@echo -e "$(ATTN_COLOR)==> $@ $(NO_COLOR)"
	@echo "GOOS:        ${GOOS}"
	@echo "GOARCH:      ${GOARCH}"
	@echo "RELEASE_TAG: ${RELEASE_TAG}"
	@echo "RELEASE_TAG: ${RELEASE_TAG}"
	@echo "BIN_DIR:     ${BIN_DIR}"
	@echo "EXT_DIR:     ${EXT_DIR}"
	@echo "EXT_BIN_DIR: ${EXT_BIN_DIR}"
	@echo "EXT_TMP_DIR: ${EXT_TMP_DIR}"

.PHONY: deps
deps: info install-buf install-svu
	@echo -e "$(ATTN_COLOR)==> $@ $(NO_COLOR)"
	
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

${BIN_DIR}:
	@echo -e "$(ATTN_COLOR)==> $@ $(NO_COLOR)"
	@mkdir -p ${BIN_DIR}

${EXT_BIN_DIR}:
	@echo -e "$(ATTN_COLOR)==> $@ $(NO_COLOR)"
	@mkdir -p ${EXT_BIN_DIR}

${EXT_TMP_DIR}:
	@echo -e "$(ATTN_COLOR)==> $@ $(NO_COLOR)"
	@mkdir -p ${EXT_TMP_DIR}
