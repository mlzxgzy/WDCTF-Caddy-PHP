# WDCTF-Caddy-PHP
**单纯的Caddy服务,使用的是官方的Caddy镜像: `caddy:latest`**<br>
**PHP版本是php7-fpm**<br>
网站目录在`/srv`<br>
端口是`80`

# 直接使用镜像
```bash
/ > docker pull registry.cn-shanghai.aliyuncs.com/wd_ctf_2020/wdctf_caddy_php
/ > docker run -p80:80 -v /html:/srv registry.cn-shanghai.aliyuncs.com/wd_ctf_2020/wdctf_caddy_php
```
