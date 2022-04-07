FROM node:lts

WORKDIR /opt/mcsmanager

RUN git clone https://github.com/MCSManager/MCSManager-Web-Production.git web --depth=1

WORKDIR /opt/mcsmanager/web

RUN npm install

EXPOSE 23333

VOLUME ["/opt/mcsmanager/web/data", "/opt/mcsmanager/web/logs"]

CMD [ "app.js" ]