#!/bin/bash
version=$(curl --silent -H "Authorization: Bearer ${GITHUB_TOKEN}" "https://api.github.com/repos/MCSManager/MCSManager/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")')
currentversion=$(cat currentversion)
echo "currentversion:$currentversion version:$version"
echo "$version" >currentversion
if [[ "$currentversion" == "$version" ]]; then
    exit
fi

git config user.name "github-actions[bot]"
git config user.email "41898282+github-actions[bot]@users.noreply.github.com"
git add currentversion Dockerfile
git commit -a -m "Auto Update to MCSManager $version"
git tag -f "$version"
git push
git push origin --tags -f
