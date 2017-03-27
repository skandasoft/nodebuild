#Microservice
FROM alpine:latest
LABEL MAINTAINER=skandasoftinc@gmail.com version="1.0"

RUN apk update
RUN apk --no-cache add nodejs
# Install node-demon
RUN npm install -g nodemon

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ONBUILD COPY ./package.json /usr/src/app/

ONBUILD RUN npm install && npm cache clean

ONBUILD COPY ./ /usr/src/app

CMD [ "npm", "start" ]
# Run app using nodemon
# CMD ["nodemon", "app.js"]
