
# Stage 1: Build the React app
FROM node:alpine as builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Serve the app using a static server
FROM node:alpine
RUN npm install -g serve
COPY --from=builder /app/build /app/build
EXPOSE 3000
CMD ["serve", "-s", "app/build", "-l", "3000"]







# Multi-stage
# 1) Node image for building frontend assets
# 2) nginx stage to serve frontend assets

# Name the node stage "builder"
#FROM node:alpine AS builder
# Set working directory
#WORKDIR /app
# Copy all files from current directory to working dir in image
#COPY . .
# install node modules and build assets
#RUN npm update
#RUN yarn install && yarn run build

# nginx state for serving content
#FROM nginx:bullseye
# Set working directory to nginx asset directory
#WORKDIR /usr/share/nginx/html
# Remove default nginx static assets
#RUN rm -rf ./*
# Copy static assets from builder stage
#COPY --from=builder /app/build .
# Containers run nginx with global directives and daemon off
#ENTRYPOINT ["nginx", "-g", "daemon off;"]


