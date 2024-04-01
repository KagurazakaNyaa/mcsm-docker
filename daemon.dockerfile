FROM alpine:3 AS download
RUN apk add --no-cache curl tar gzip
WORKDIR /build
ARG VERSION_TAG
RUN curl -L https://github.com/MCSManager/MCSManager/releases/download/${VERSION_TAG}/MCSManager-v10-linux-x64.tar.gz | tar -xvz -C /build

FROM node:lts

WORKDIR /opt/mcsmanager

COPY --from=download /build/daemon/* /opt/mcsmanager/daemon

WORKDIR /opt/mcsmanager/daemon

RUN npm install --production

EXPOSE 24444

VOLUME ["/opt/mcsmanager/daemon/data", "/opt/mcsmanager/daemon/logs"]

CMD [ "app.js", "--max-old-space-size=8192" ]