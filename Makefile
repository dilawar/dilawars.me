DOCKER:=/usr/bin/docker

all: dilawars.me

dilawars.me build:
	rm -rf dilawars.me
	$(DOCKER) compose run loconotion dilawars_me.toml --verbose

single:
	$(DOCKER) compose run loconotion dilawars_me.toml --verbose --single-page


upload:
	ncftpput -u mail@dilawars.me -p $$DILAWARS_ME_FTP_PASSWORD \
		-R ftp.dilawars.me \
		/ ./dist/dilawars.me/*

.PHONY: upload dilawars.me
