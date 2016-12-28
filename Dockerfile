FROM debian:jessie

RUN apt-get update && apt-get install -y \
    curl \
    && curl -sL https://deb.nodesource.com/setup_6.x | bash /dev/stdin \
    && apt-get install -y nodejs git-all
    
    
RUN git clone git@github.com:6e6a/docker-wordpress-gulp-starter-kit.git /srv
RUN cd /srv && npm install
WORKDIR /srv
VOLUME /srv

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
