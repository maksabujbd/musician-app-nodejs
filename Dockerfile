#FROM node:18
#FROM 588738587340.dkr.ecr.us-east-1.amazonaws.com/musician_dev_app_repo:latest

ARG BASE_IMAGE
FROM ${BASE_IMAGE}

WORKDIR /app
COPY . .
RUN yarn install
CMD [ "npm", "start" ]
EXPOSE 3001

# Use a multi-stage build to optimize the Docker image size

# Base stage for building the client
#FROM node:18 AS client-build
#WORKDIR /client
#
## Copy the client source files
#COPY ./client/package.json ./client/yarn.lock ./
#RUN yarn install --frozen-lockfile
#
## Copy the rest of the client files
#COPY ./client ./
#RUN yarn build
#
## Base stage for building the backend
#FROM node:18 AS backend-build
#WORKDIR /app
#
## Copy the server source files
#COPY ./package.json ./yarn.lock ./
#RUN yarn install --frozen-lockfile
#
## Copy the rest of the server files
#COPY . .
#
## Final stage to run both client and server
#FROM node:18
#WORKDIR /app
#
## Copy the built client from the client-build stage
#COPY --from=client-build /app/client/build ./client/build
#
## Copy the server files from the backend-build stage
#COPY --from=backend-build /app .
#
## Install dependencies for the server
#RUN yarn install --production --frozen-lockfile
#
## Expose ports for both frontend and backend
#EXPOSE 3000 # Frontend port
#EXPOSE 3001 # Backend port
#
## Use a process manager like PM2 to run both client and server
#RUN npm install -g pm2
#COPY pm2.json ./pm2.json
#
## Start both the client and backend
#CMD ["pm2-runtime", "start", "pm2.json"]

