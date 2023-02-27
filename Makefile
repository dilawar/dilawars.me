DOCKER:=/usr/bin/docker

all: build upload

dilawars.me build:
	rm -rf dilawars.me
	$(DOCKER) compose run loconotion dilawars_me.toml 


upload:
	ncftpput -u mail@dilawars.me -p $$DILAWARS_ME_FTP_PASSWORD \
		-R ftp.dilawars.me \
		/ ./dist/dilawars.me/*

.PHONY: upload dilawars.me
