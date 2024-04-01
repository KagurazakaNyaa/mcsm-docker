#!/bin/bash

VERSION_TAG=${VERSION_TAG:-v10.1.0}
# download release file
DOWNLOAD_URL=https://github.com/MCSManager/MCSManager/releases/download/${VERSION_TAG}/MCSManager-v10-linux-x64.tar.gz

echo Downloading from "$DOWNLOAD_URL"
mkdir -p build
curl -L "$DOWNLOAD_URL" | tar -xvz -C ./build
