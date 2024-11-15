FROM debian:bullseye

ARG FTP_USER
ARG FTP_PASSWORD

ENV FTP_USER=${FTP_USER}
ENV FTP_PASSWORD=${FTP_PASSWORD}

# Met à jour les packages et installe vsftpd
RUN apt-get update && \
    apt-get install -y vsftpd && \
    apt-get clean

COPY ./conf/vsftpd.conf /etc/vsftpd.conf

RUN useradd -m -d /home/toto -s /bin/bash toto && \
    echo "${FTP_USER}:${FTP_PASSWORD}" | chpasswd

RUN mkdir -p /home/tbarret/wordpress && \
    chown -R toto:toto /home/toto

# Crée le répertoire nécessaire pour vsftpd
RUN mkdir -p /var/run/vsftpd/empty


# Démarre vsftpd avec la configuration fournie

CMD ["/usr/sbin/vsftpd", "/etc/vsftpd.conf"]
