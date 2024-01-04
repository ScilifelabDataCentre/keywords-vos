FROM node:latest as build
COPY VOSviewer-Online /src
WORKDIR /src
RUN npm install
RUN npm run build

FROM nginx
COPY --from=build /src/dist/vosviewer-online /usr/share/nginx/html/vosviewer
COPY index.html /usr/share/nginx/html/index.html
COPY img /usr/share/nginx/html/img
RUN rm /usr/share/nginx/html/vosviewer/data/*
COPY data /usr/share/nginx/html/vosviewer/data/