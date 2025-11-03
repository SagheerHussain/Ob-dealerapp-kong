FROM kong:3.6

# become root to write into system paths
USER root

COPY kong.yml /etc/kong/kong.yml
COPY render-entrypoint.sh /usr/local/bin/render-entrypoint.sh
RUN chmod 755 /usr/local/bin/render-entrypoint.sh \
 && chown kong:0 /usr/local/bin/render-entrypoint.sh

ENV KONG_DATABASE=off
ENV KONG_DECLARATIVE_CONFIG=/etc/kong/kong.yml
ENV KONG_ADMIN_LISTEN=off

# drop back to the kong user for runtime
USER kong
ENTRYPOINT ["/usr/local/bin/render-entrypoint.sh"]
