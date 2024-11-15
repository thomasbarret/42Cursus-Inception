FROM debian:bullseye

RUN apt update -y
RUN apt upgrade -y
RUN apt install redis-server -y

CMD ["redis-server", "--protected-mode no", "--bind 0.0.0.0"]
