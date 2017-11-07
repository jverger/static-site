FROM	nginx

WORKDIR	/usr/share/nginx/html

COPY	Hello_docker.html .

ENV		AUTHOR=Julien

RUN		sed -e s/Docker/"$AUTHOR"/ Hello_docker.html > index.html && \
		sed -i -e 's/\([[:space:]]\{1,\}listen[[:space:]]\{1,\}\)[0-9]\{1,\};/\18080;/' /etc/nginx/conf.d/default.conf && \
		chmod g=u /var/cache/nginx && \
		chmod g=u /var/run

EXPOSE	8080

CMD		nginx -g 'daemon off;'
