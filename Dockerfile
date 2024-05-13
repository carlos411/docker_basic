ARG ALPINE_VERSION=3.19.1
# 基於 alpine 映像檔，來建立自己的映像檔
FROM alpine:${ALPINE_VERSION}

# 更新 package manager 到最新狀態
RUN apk update && apk upgrade

# 安裝 nginx 及 vim，且不要放到快取中，可節省磁碟空間
RUN apk add --no-cache \
  nginx \
  vim \
  supervisor

# supervisord config
COPY ./sys_config/supervisord.ini /etc/supervisor.d/

# 啟動容器後，執行 supervisord 指令
CMD supervisord