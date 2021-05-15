FROM alpine as build
WORKDIR /tmp
COPY conf/gen-cert.sh /tmp
RUN apk add openssl && sh gen-cert.sh 

FROM nginx:alpine
COPY conf/nginx.conf /etc/nginx/
COPY --from=build /tmp/domain.crt /usr/share/nginx/
COPY --from=build /tmp/domain.key /usr/share/nginx/
EXPOSE 80 443