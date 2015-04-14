#HOST=login.billo.systems
HOST=ryugi-billo
REMOTE_DIR=/var/more-www/billo-login/html

publish:
	git pull --all && \
	rsync -vazP {*.html,css,js,images} $(HOST):$(REMOTE_DIR)

