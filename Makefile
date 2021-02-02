.PHONY: all build clean

all: build

VERSION = 1.3.0
ARCH = amd64
BUILD_DIR=nebula-$(VERSION)

build:
	mkdir $(BUILD_DIR) || true
	wget -q -O nebula.tgz https://github.com/slackhq/nebula/releases/download/v$(VERSION)/nebula-linux-$(ARCH).tar.gz
	wget -q -O $(BUILD_DIR)/config.yml https://raw.githubusercontent.com/slackhq/nebula/v1.3.0/examples/config.yml
	tar -C $(BUILD_DIR) -xzvf nebula.tgz
	cp -r debian/ $(BUILD_DIR)
	cd $(BUILD_DIR); debuild -uc -us

clean:
	rm -fr *.deb nebula*
