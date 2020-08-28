#!/usr/bin/env sh

if [[ "$VERBOSE" == "true" ]]; then
	varnishlog &
fi

varnishd \
	-F \
	-a :80 \
	-f /etc/varnish/default.vcl \
	-p http_resp_hdr_len=65536 \
	-p http_resp_size=98304 \
	-p vcc_allow_inline_c=on \
	-p workspace_backend=128k \
	-p workspace_client=128k \
	-s malloc,1G
