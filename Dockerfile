FROM registry.cn-shanghai.aliyuncs.com/wd_ctf_2020/wdctf_caddy
COPY ./init.sh /init.sh
RUN apk add php7-fpm \
  && rm -rf /var/cache/apk/* \
  && sed -i "s/# php_fastcgi localhost:9000/php_fastcgi localhost:9000/g" /etc/caddy/Caddyfile \
  && chmod +x /init.sh
CMD "/init.sh"
