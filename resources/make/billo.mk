SKIP_DEPS=yaws|ltest
SKIP_INCS=goldrush

DEPS=$(shell \
find deps -type d -maxdepth 1 -mindepth 1 -exec echo "{}/ebin/*" \;| \
egrep -v '$(SKIP_DEPS)'| \
tr '\n' ',')

INCS=$(shell \
find deps -type d -maxdepth 1 -mindepth 1 -exec echo "{}/include/*.*rl" \;| \
egrep -v '$(SKIP_INCS)'| \
tr '\n' ',')

dry:
	ls -1 {$(DEPS)ebin/*}
	ls -1 {$(INCS)include/*}

get-deps:
	rebar get-deps

compile:
	mkdir -p include
	cp {$(INCS)} ./
	rebar compile

publish: compile
	rsync -vazP {static/*.html,static/css,static/js,static/images} \
	$(REMOTE_HOST):$(REMOTE_STATIC_DIR)
	rsync -vazP {$(DEPS)ebin/*} \
	$(REMOTE_HOST):$(REMOTE_EBIN_DIR)
	rsync -vazP {$(INCS)} \
	$(REMOTE_HOST):$(REMOTE_INCLUDE_DIR)
	make cleanup

cleanup:
	rm *.lfe *.erl *.hrl
