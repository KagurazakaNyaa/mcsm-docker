FROM node:lts

WORKDIR /opt/mcsmanager

COPY ./build/web /opt/mcsmanager/web

WORKDIR /opt/mcsmanager/web

RUN npm install --production

EXPOSE 23333

VOLUME ["/opt/mcsmanager/web/data", "/opt/mcsmanager/web/logs"]

CMD [ "app.js", "--max-old-space-size=8192" ]