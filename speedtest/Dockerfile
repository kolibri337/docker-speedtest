# Этап сборки
FROM php:8-fpm AS builder

# Установка системных зависимостей
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

# Копирование исходного кода
COPY backend/ /speedtest/backend/
COPY results/*.php results/*.ttf  /speedtest/results/
COPY *.js favicon.ico /speedtest/
COPY docker/*.php /speedtest/
COPY docker/entrypoint.sh /

# Этап финального образа
FROM php:8-apache

# Копирование необходимых файлов из этапа сборки
COPY --from=builder /speedtest/ /speedtest/
COPY --from=builder /entrypoint.sh /entrypoint.sh


# Убедимся, что entrypoint.sh исполняемый
RUN chmod +x /entrypoint.sh

# Установка переменной окружения
ENV WEBPORT=80

# Запуск приложения
CMD ["bash", "/entrypoint.sh"]
