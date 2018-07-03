FROM ubuntu
MAINTAINER k-ishigaki <k-ishigaki@frontier.hokudai.ac.jp>

#ENV PATH=/root/.pyenv/bin:$PATH

# build and install nginx with https support
RUN apt-get update && apt-get install -y \
  apache2 \
  apache2-utils \
  vim \
  && /usr/sbin/a2enmod proxy \
  && /usr/sbin/a2enmod proxy_http \
  && /usr/sbin/a2enmod proxy_connect \
  && htpasswd -c -b /etc/apache2/.htpasswd kazuki gakiA5310027

# apply configs and start server
COPY ports.conf /etc/apache2/
COPY 000-default.conf /etc/apache2/sites-available
RUN service apache2 restart

#htpasswd -c -b /etc/httpd/conf/.htpasswd ユーザ名 パスワード

EXPOSE 8888

#COPY nginx.conf /usr/local/nginx/conf/


