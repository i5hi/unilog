FROM fluent/fluentd:v1.10-1

USER root

RUN apk add --no-cache --update --virtual .build-deps \
        sudo build-base ruby-dev \
 # cutomize following instruction as you wish
 && sudo gem install fluent-plugin-elasticsearch fluent-plugin-secure-forward \
 && sudo gem sources --clear-all \
 && apk del .build-deps \
 && rm -rf /home/fluent/.gem/ruby/2.5.0/cache/*.gem

COPY entrypoint.sh /bin/
RUN mkdir /dumps && chown -R fluent /dumps && chmod -R 600 /dumps

USER fluent

RUN secure-forward-ca-generate /fluentd/certs "passphrase for private CA secret key"
