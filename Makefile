all: dilawars.me

dilawars.me: 
	docker-compose run loconotion https://dilawars.notion.site 

upload: dilawars.me
	ncftpput -u dilawar@dilawars.me -p $$FTP_PASSWORD \
		-R ftp.dilawars.me \
		/public_html ./dilawars.me/*

.PHONY: upload dilawars.me
