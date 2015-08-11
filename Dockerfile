FROM phase2/servicebase

VOLUME ["/var/lib/mysql"]

ENV MYSQL_PASS admin

RUN yum -y install mariadb-server mariadb

COPY root /
