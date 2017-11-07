FROM nginx
#ENV AUTHOR=Docker

WORKDIR /usr/share/nginx/html
#COPY Hello_docker.html /usr/share/nginx/html
COPY Hello_docker.html .
ENV AUTHOR=Julien
RUN sed -e s/Docker/"$AUTHOR"/ Hello_docker.html > index.html && \
    sed -e 's/\([[:space:]]\{1,\}listen[[:space:]]\{1,\}\)[0-9]\{1,\};/\18080;/' /etc/nginx/conf.d/default.conf && \
	chmod g=u /var/cache/nginx

#CMD cd /usr/share/nginx/html && sed -e s/Docker/"$AUTHOR"/ Hello_docker.html > index.html ; nginx -g 'daemon off;'
CMD nginx -g 'daemon off;'
