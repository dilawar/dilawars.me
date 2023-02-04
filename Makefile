all: dilawars.me

dilawars.me build:
	rm -rf dilawars.me
	docker-compose run loconotion my_site.toml --verbose

single:
	docker-compose run loconotion my_site.toml --verbose --single-page


upload: 
	ncftpput -u mail@dilawars.me -p $$DILAWARS_ME_FTP_PASSWORD \
		-R ftp.dilawars.me \
		/ ./dist/dilawars.me/*

.PHONY: upload dilawars.me 
