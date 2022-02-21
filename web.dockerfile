FROM node:lts

WORKDIR /ops/mcsmanager

RUN git clone https://github.com/MCSManager/MCSManager-Web-Production.git web --depth=1

WORKDIR /ops/mcsmanager/web

RUN npm install

EXPOSE 23333

VOLUME ["/ops/mcsmanager/web/data", "/ops/mcsmanager/web/logs"]

CMD [ "app.js" ]