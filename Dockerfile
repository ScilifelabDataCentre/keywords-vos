FROM node:latest as build
COPY VOSviewer-Online /src
WORKDIR /src
RUN npm install
RUN npm run build

FROM nginxinc/nginx-unprivileged:alpine
COPY --from=build /src/dist/vosviewer-online /usr/share/nginx/html/vosviewer
COPY index.html /usr/share/nginx/html/index.html
COPY img /usr/share/nginx/html/img
COPY data/*.json /usr/share/nginx/html/vosviewer/data/

# Following block to add user (for serve deployment)
COPY start-script.sh /start-script.sh
WORKDIR /

EXPOSE 8080
ENTRYPOINT ["./start-script.sh"]
