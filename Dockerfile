#Microservice
FROM alpine:latest
LABEL MAINTAINER=skandasoftinc@gmail.com version="1.0"

RUN apk update
RUN apk --no-cache add nodejs
# Install node-demon
RUN npm install -g nodemon

# ENV Host 127.0.0.1
ENV PORT 80
# EXPOSE 80

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ONBUILD COPY ./package.json /usr/src/app/

ONBUILD RUN npm install && npm cache clean

ONBUILD COPY ./ /usr/src/app
# ONBUILD VOLUME "nodejs"

CMD [ "npm", "start" ]
# Run app using nodemon
# CMD ["nodemon", "app.js"]
