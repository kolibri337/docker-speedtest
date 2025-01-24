FROM php:8-apache
# Install extensions
RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libpq-dev \
    && docker-php-ext-install -j$(nproc) iconv \
    && docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/ \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install -j$(nproc) gd pdo pdo_pgsql pgsql \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /speedtest/
#Prepare files and folders
COPY backend/ /speedtest/backend/
COPY results/*.php results/*.ttf  /speedtest/results/
COPY *.js favicon.ico /speedtest/
COPY docker/*.php /speedtest/
COPY docker/entrypoint.sh /

ENV WEBPORT=80

#https://httpd.apache.org/docs/2.4/stopping.html#gracefulstop
STOPSIGNAL SIGWINCH
#Ensure the entrypoint script is executable
EXPOSE 80
CMD ["bash", "/entrypoint.sh"]


