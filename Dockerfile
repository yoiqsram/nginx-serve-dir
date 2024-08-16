FROM nginx:1.27-bookworm

LABEL authors="yoiqsram"

COPY ./server.conf /etc/nginx/conf.d/default.conf

RUN echo admin:$(openssl passwd iamtheadmin) \
        > /etc/nginx/.htpasswd

RUN mkdir -p /www/data && \
    echo "You can see this file because you didn't bind any directory to volumes." \
        > /www/data/README.md
WORKDIR /www/data

CMD ["nginx", "-g", "daemon off;"]
