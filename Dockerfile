FROM 192.168.101.30/yhgit/devops/mynode:alpine AS build

WORKDIR /srv
COPY . .
RUN wget http://192.168.100.150/else/gitbook/node_modules.tar.gz && \
    tar -xf node_modules.tar.gz && \
    gitbook install
#    gitbook build . public
#
#
#FROM httpd:2.4 AS final
#COPY --from=build /srv/public /usr/local/apache2/htdocs/

CMD ["sh", "-c", "gitbook serve"]
