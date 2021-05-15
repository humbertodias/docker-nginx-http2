build:
	docker build . -t nginx-http2

run:
	docker run --rm -p 8080:80 -p 8443:443 -v `pwd`/www:/usr/share/nginx/html nginx-http2