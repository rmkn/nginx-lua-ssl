FROM rmkn/nginx-lua
MAINTAINER rmkn

RUN yum -y install openssl-devel

RUN cd /usr/local/src/nginx-${NGINX_VERSION} \
        && ./configure --prefix=/usr/local/nginx --with-ld-opt="-Wl,-rpath,/usr/local/luajit/lib" --add-module=../ngx_devel_kit-${NDK_VERSION} --add-module=../lua-nginx-module-${LUAMOD_VERSION} --with-http_ssl_module \
        && make \
        && make install

EXPOSE 443
