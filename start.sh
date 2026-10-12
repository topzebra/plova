#!/bin/sh

# Avvia Tor in background, log su file
tor > /tmp/tor.log 2>&1 &

# Attendi il bootstrap completo di Tor (di solito 10-30 secondi)
until grep -q "Bootstrapped 100%" /tmp/tor.log; do
  sleep 1
done

# Esponi il proxy socks5+ws sulla porta di Render e inoltra a Tor
exec gost -L "socks5+ws://${PROXY_USER}:${PROXY_PASS}@:${PORT}?path=/ws" \
          -F socks5://127.0.0.1:9050
