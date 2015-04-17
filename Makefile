PROJECT = billo-login
#HOST=login.billo.systems
REMOTE_HOST=ryugi-billo
REMOTE_STATIC_DIR=/more-www/billo-login/html
REMOTE_EBIN_DIR=/more-www/billo-login/ebin
REMOTE_INCLUDE_DIR=/more-www/billo-login/include

include resources/make/common.mk
include resources/make/yaws.mk
include resources/make/billo.mk
