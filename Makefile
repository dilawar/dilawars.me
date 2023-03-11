all: dilawars.me

dilawars.me: 
	rm -rf dilawars.me
	docker-compose run loconotion my_site.toml

upload: dilawars.me
	ncftpput -u dilawar@dilawars.me -p $$FTP_PASSWORD \
		-R ftp.dilawars.me \
		/public_html ./dist/dilawars.me/*

.PHONY: upload dilawars.me
