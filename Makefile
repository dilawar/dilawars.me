all: dilawars.me

dilawars.me:
	rm -rf dilawars.me
	docker-compose run loconotion my_site.toml --clean-js --verbose

single:
	docker-compose run loconotion my_site.toml --verbose --single-page


upload: dilawars.me
	ncftpput -u dilawar@dilawars.me -p $$FTP_PASSWORD \
		-R ftp.dilawars.me \
		/public_html ./dist/dilawars.me/*

.PHONY: upload dilawars.me
