#!/usr/bin/env bash

# adjust ---------------
: ${FABRIC_VERSION:="1.4.0"}
#-----------------------
FABRIC_PACK="amd64-1.4.0"

#if [ ! -f 'bin/configtxgen' ]; then
#  ARCH=$(echo "$(uname -s|tr '[:upper:]' '[:lower:]'|sed 's/mingw64_nt.*/windows/')-$(uname -m | sed 's/x86_64/amd64/g')" | awk '{print tolower($0)}')
#  sudo echo
#  url=https://nexus.hyperledger.org/content/repositories/releases/org/hyperledger/fabric/hyperledger-fabric/${ARCH}-${FABRIC_VERSION}/hyperledger-fabric-${ARCH}-${FABRIC_VERSION}.tar.gz
#  echo "===> Downloading platform binaries: $url"
#  curl $url | tar xz
#fi;

sudo apt-get update && sudo apt-get -y install docker-compose jq

echo "Remove old images"
sudo docker rmi -f $(docker images -q)

echo "Pull hyperledger/fabric-ca"
sudo docker pull hyperledger/fabric-ca:${FABRIC_PACK}
echo "Pull hyperledger/fabric-orderer"
sudo docker pull hyperledger/fabric-orderer:${FABRIC_PACK}
echo "Pull hyperledger/fabric-peer"
sudo docker pull hyperledger/fabric-peer:${FABRIC_PACK}
echo "Pull hyperledger/fabric-ccenv"
sudo docker pull hyperledger/fabric-ccenv:${FABRIC_PACK}
#docker pull hyperledger/fabric-buildenv:${FABRIC_PACK}

echo "Pull hyperledger/fabric-tools"
sudo docker pull hyperledger/fabric-tools:${FABRIC_PACK}

echo "Pull hyperledger/fabric-rest"
sudo docker pull dockeraltoros/fabric-rest
echo "Pull nginx"
sudo docker pull nginx
echo "Pull node:8-alpine"
sudo docker pull node:8-alpine
export FABRIC_PACK



