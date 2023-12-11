FROM    alpine:3.16

WORKDIR /var/hugo/me

RUN     apk update && apk upgrade && apk add --update --no-cache \
            hugo \
            git \
            shadow \
 &&     rm -f /var/cache/apk/*

# create new hugo site
RUN hugo new site /var/hugo/me \
 	&&     cd /var/hugo/me \
 	&&     git clone https://github.com/vaga/hugo-theme-m10c themes/m10c \
 	&&     hugo new posts/presentation.md \
    &&     hugo -b https://blefebvr.42.fr/me \
    && mkdir -p /var/hugo/me/content/about

COPY    ./conf/config.toml        /var/hugo/me/config.toml
COPY    conf/presentation.md    /var/hugo/me/content/posts/presentation.md
COPY    conf/about.md           /var/hugo/me/content/about/index.md
COPY    conf/barbara.jpg         /var/hugo/me/themes/m10c/static/barbara.jpg
COPY    conf/avatar.jpg       /var/hugo/me/themes/m10c/static/avatar.jpg

EXPOSE 1313

CMD     ["hugo", "server", \
         "--bind=0.0.0.0", \
         "--baseURL=https://blefebvr.42.fr/me", \
         "-p", "1313", \
         "--logFile=/dev/stdout", \
        "--appendPort=false"]