FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    curl \
    npm

RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -

RUN apt install nodejs -y

COPY ./conf/ /app

WORKDIR /app

RUN npm install

CMD ["node", "main.js"]