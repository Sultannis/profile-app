# Dockerfile
FROM node:11.13.0-alpine

# create destination directory
RUN mkdir -p /usr/src/profile-app
WORKDIR /usr/src/profile-app

# update and install dependency
RUN apk update && apk upgrade
RUN apk add git

# copy the app, note .dockerignore
COPY . /usr/src/profile-app/
RUN npm install
RUN npm run build

EXPOSE 3000

ENV NUXT_HOST=0.0.0.0
ENV NUXT_PORT=3000

CMD [ "npm", "start" ]