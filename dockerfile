FROM kong:3.6

# Need root to install files
USER root

# Declarative config (DB-less)
COPY kong.yml /etc/kong/kong.yml
COPY render-entrypoint.sh /usr/local/bin/render-entrypoint.sh
RUN chmod 755 /usr/local/bin/render-entrypoint.sh \
 && chown kong:0 /usr/local/bin/render-entrypoint.sh

# Kong defaults (lightweight for Render Free)
ENV KONG_DATABASE=off \
    KONG_DECLARATIVE_CONFIG=/etc/kong/kong.yml \
    KONG_ADMIN_LISTEN=off \
    KONG_NGINX_WORKER_PROCESSES=1 \
    KONG_LOG_LEVEL=notice

# Run as kong user
USER kong
ENTRYPOINT ["/usr/local/bin/render-entrypoint.sh"]
