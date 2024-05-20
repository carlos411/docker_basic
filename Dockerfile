ARG ALPINE_VERSION=3.19.1
# 基於 alpine 映像檔，來建立自己的映像檔
FROM alpine:${ALPINE_VERSION}

# 更新 package manager 到最新狀態
RUN apk update && apk upgrade

# 安裝 nginx 及 vim，且不要放到快取中，可節省磁碟空間
# 安裝 PHP 及 PHP-FPM
RUN apk add --no-cache \
  nginx \
  vim \
  supervisor \
  php83 \
  php83-common \
  php83-fpm

# my_proj.conf 是針對該網站的 nginx 的設定檔，
# 將 my_proj.conf，複製一份，放到 /etc/nginx/http.d 資料夾裡
COPY ./sys_config/my_proj.conf /etc/nginx/http.d
# 在容器中，建立 /var/www/localhost/htdocs/my_proj 資料夾，要放原始碼
RUN mkdir -p /var/www/localhost/htdocs/my_proj

# supervisord config
COPY ./sys_config/supervisord.ini /etc/supervisor.d/

# 啟動容器後，執行 supervisord 指令
CMD supervisord