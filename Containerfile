FROM registry.access.redhat.com/ubi8/ubi:8.0 

# DocumentRoot for Apache
ENV DOCROOT=/var/www/html 

RUN   yum install -y --disableplugin=subscription-manager httpd

EXPOSE 80

# This stuff is needed to ensure a clean start
RUN rm -rf /run/httpd && mkdir /run/httpd

COPY index.html ${DOCROOT}/

# Launch httpd
CMD /usr/sbin/httpd -DFOREGROUND