FROM kong:3.6
COPY kong.yml /etc/kong/kong.yml
COPY render-entrypoint.sh /usr/local/bin/render-entrypoint.sh
RUN chmod +x /usr/local/bin/render-entrypoint.sh
ENV KONG_DATABASE=off
ENV KONG_DECLARATIVE_CONFIG=/etc/kong/kong.yml
ENTRYPOINT ["/usr/local/bin/render-entrypoint.sh"]
