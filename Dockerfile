FROM alpine:latest

RUN apk add --no-cache tor curl

# GOST: proxy engine
RUN curl -L https://github.com/ginuerzh/gost/releases/download/v2.11.5/gost-linux-amd64-2.11.5.gz \
    | gunzip > /usr/local/bin/gost \
    && chmod +x /usr/local/bin/gost

COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
