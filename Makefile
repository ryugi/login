#HOST=login.billo.systems
HOST=ryugi-billo
REMOTE_DIR=/var/www/billo-login/

publish:
	git pull --all && \
	rsync -vazP {*.html,css,js,images,fonts} $(HOST):$(REMOTE_DIR)

