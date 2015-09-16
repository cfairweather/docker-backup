FROM docker:1.8
MAINTAINER Cristoffer Fairweather <cris.fairweather@ntrepidcorp.com>



COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

CMD ["/docker-entrypoint.sh"]