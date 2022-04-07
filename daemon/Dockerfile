FROM node:lts

WORKDIR /opt/mcsmanager

RUN git clone https://github.com/MCSManager/MCSManager-Daemon-Production.git daemon --depth=1

WORKDIR /opt/mcsmanager/daemon

RUN npm install

EXPOSE 24444

VOLUME ["/var/run/docker.sock", "/opt/mcsmanager/daemon/data", "/opt/mcsmanager/daemon/logs"]

CMD [ "app.js" ]