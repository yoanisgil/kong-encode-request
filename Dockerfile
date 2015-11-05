FROM node:5-slim
MAINTAINER "Yoanis Gil <gil.yoanis@gmail.com>"

RUN npm install -g echo-server mongodb

CMD ["echo-server",  "5000"]
