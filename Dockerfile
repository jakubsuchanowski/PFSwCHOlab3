# syntax=docker/dockerfile:1

FROM alpine AS download

MAINTAINER Jakub Suchanowski 

WORKDIR /app

# RUN apt-get update
RUN apk add --no-cache openssh-client git


#Copy public key for github

RUN mkdir -p -m 0700 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts

#clone repostiory
RUN --mount=type=ssh,required git clone git@github.com:jakubsuchanowski/PFSwCHO_lab2.git PFSwCHO_lab2

FROM node:alpine AS build

COPY --from=download /app/PFSwCHO_lab2 /app

WORKDIR /app

## Install lts version of npm
RUN npm install

# Expose app on port: 8080
EXPOSE 8080

# Default command
CMD ["npm", "start"]




 
