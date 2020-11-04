FROM caddy:latest

RUN echo "caddy run --config /etc/caddy/Caddyfile --adapter caddyfile" > /init.sh

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories \
  && apk add curl php7-fpm \
  && rm -rf /var/cache/apk/* \
  && sed -i "s/\/usr\/share\/caddy/\/srv/g" /etc/caddy/Caddyfile \
  && sed -i "s/# php_fastcgi localhost:9000/php_fastcgi localhost:9000/g" /etc/caddy/Caddyfile \
  && chmod +x /init.sh

CMD "/init.sh"
