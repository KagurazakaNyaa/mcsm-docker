FROM alpine:3 AS download
RUN apk add --no-cache curl tar gzip
WORKDIR /build
ARG VERSION_TAG
RUN curl -L https://github.com/MCSManager/MCSManager/releases/download/${VERSION_TAG}/MCSManager-v10-linux-x64.tar.gz | tar -xvz

FROM node:lts

WORKDIR /opt/mcsmanager/web

COPY --from=download /build/web/ /opt/mcsmanager/web/

RUN npm install --production

EXPOSE 23333

VOLUME ["/opt/mcsmanager/web/data", "/opt/mcsmanager/web/logs"]

CMD [ "app.js", "--max-old-space-size=8192" ]