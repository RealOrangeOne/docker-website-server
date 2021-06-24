FROM alpine:latest

RUN apk add --no-cache nginx gettext nginx-mod-http-brotli

RUN mkdir -p /run/nginx

COPY ./docker-entrypoint.sh /docker-entrypoint.sh

COPY ./default.conf /etc/nginx/default.conf.template

ENV PUID 1000

RUN envsubst < /etc/nginx/default.conf.template > /etc/nginx/http.d/default.conf

EXPOSE 80

CMD ["/docker-entrypoint.sh"]
