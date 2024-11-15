FROM debian:bullseye
RUN apt update -y
RUN apt upgrade -y
RUN apt install mariadb-server -y
RUN apt install nano -y
RUN apt install curl -y
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/mariadb.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/mariadb.sh
RUN mkdir -p /run/mysqld && chown mysql:mysql /run/mysqld
ENTRYPOINT ["bash", "/usr/local/bin/mariadb.sh"]
