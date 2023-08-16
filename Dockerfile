FROM alpine:3 as build
RUN apk add gcc make musl-dev \
 && wget -O stone.tar.gz http://www.gcd.org/sengoku/stone/stone-2.4.tar.gz \
 && tar zxf stone.tar.gz \
 && cd stone-*/ \
 && FLAGS=-D_GNU_SOURCE make linux \
 && cp -a stone /usr/bin/stone \
 && cd .. \
 && rm -Rf stone*


FROM alpine:3
COPY --from=build /usr/bin/stone /usr/bin/stone
ENTRYPOINT ["/usr/bin/stone"]
