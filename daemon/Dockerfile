FROM node:lts

WORKDIR /ops/mcsmanager

RUN git clone https://github.com/MCSManager/MCSManager-Daemon-Production.git daemon --depth=1

WORKDIR /ops/mcsmanager/daemon

RUN npm install

EXPOSE 24444

VOLUME ["/var/run/docker.sock", "/ops/mcsmanager/daemon/data", "/ops/mcsmanager/daemon/logs"]

CMD [ "app.js" ]