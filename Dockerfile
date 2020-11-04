FROM caddy:latest
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories \
  && apk add curl php7-fpm \
  && rm -rf /var/cache/apk/* \
  && sed -i "s/\/usr\/share\/caddy/\/srv/g" /etc/caddy/Caddyfile \
  && sed -i "s/# php_fastcgi localhost:9000/php_fastcgi localhost:9000/g" /etc/caddy/Caddyfile \
  && echo "/n2r.sh" > /init.sh \
  && echo "php-fpm7 -F &" >> /init.sh \
  && echo "caddy run --config /etc/caddy/Caddyfile --adapter caddyfile" >> /init.sh \
  && echo "" > /n2r.sh \
  && chmod +x /n2r.sh \
  && chmod +x /init.sh
CMD "/init.sh"
