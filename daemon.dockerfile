FROM node:lts

WORKDIR /opt/mcsmanager

COPY ./build/daemon /opt/mcsmanager/daemon

WORKDIR /opt/mcsmanager/daemon

RUN npm install --production

EXPOSE 24444

VOLUME ["/opt/mcsmanager/daemon/data", "/opt/mcsmanager/daemon/logs"]

CMD [ "app.js", "--max-old-space-size=8192" ]