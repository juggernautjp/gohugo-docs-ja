SHELL=/usr/bin/bash
HUGO_BIN=hugo
GO_BIN=go
NPM_BIN=npm
SRC_SITE=../hugo-docs-ja

.PHONY: build demo release

build: clean
	$(HUGO_BIN) --cleanDestinationDir

demo:
	$(HUGO_BIN) server --disableFastRender --ignoreCache --port 1323
# -D --port 9001 --bind 0.0.0.0

update:
	$(GO_BIN) get -u github.com/juggernautjp/hugo-widebs5-theme@main
	$(GO_BIN) get -u github.com/twbs/bootstrap@main
	$(GO_BIN) get -u github.com/gohugoio/hugo-mod-jslibs-dist/popperjs/v2@main

reget:
	$(GO_BIN) mod tidy
	$(HUGO_BIN) mod get github.com/juggernautjp/hugo-widebs5-theme@main

verify:
	$(HUGO_BIN) mod verify
	$(HUGO_BIN) mod graph
	$(GO_BIN) list -m -versions

vendor:
	rm -rf _vendor
	$(HUGO_BIN) mod vendor

clean:
	rm -rf public
	$(HUGO_BIN) mod clean
#	$(GO_BIN) clean -modcache

copycontent: 
	cp -r $(SRC_SITE)/archietypes ./
	cp -r $(SRC_SITE)/hugo-docs-ja/config ./
	cp -r $(SRC_SITE)/hugo-docs-ja/content ./
	cp -r $(SRC_SITE)/hugo-docs-ja/data ./
	cp -r $(SRC_SITE)/hugo-docs-ja/i18n ./
	cp -r $(SRC_SITE)/hugo-docs-ja/layouts ./
	cp -r $(SRC_SITE)/hugo-docs-ja/static ./

npm.install:
	$(NPM_BIN) install -D postcss postcss-cli autoprefixer
	$(NPM_BIN) install -D sass sass-true

lint:
	npm run css-lint-stylelint

recover:
	mv config-ja config
	rm -rf content
	mv content-ja content
	mv layouts-ja layouts
	rm -rf resources
	mv resources-ja resources
	rm -rf static
	mv static-ja static
	rm config.yml
