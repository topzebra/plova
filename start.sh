#!/bin/sh

exec gost -L "http+ws://${PROXY_USER}:${PROXY_PASS}@:${PORT}?path=/ws"
