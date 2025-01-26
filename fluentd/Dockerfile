FROM fluent/fluentd:v1.18.0-debian-1.0

USER root

# Устанавливаем зависимости и нужные гемы
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        ruby-dev \
        make \
        gcc && \
    gem update --system && \
    gem install elasticsearch -v 8.5.1 && \
    gem install fluent-plugin-elasticsearch -v 5.4.0 && \
# Очистка
    apt-get purge -y --auto-remove \
        -o APT::AutoRemove::RecommendsImportant=false \
        build-essential \
        ruby-dev \
        make \
        gcc && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem

COPY fluent.conf /fluentd/etc/
COPY entrypoint.sh /bin/

RUN chmod +x /bin/entrypoint.sh

USER fluent
