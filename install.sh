#!/bin/bash

set -e

NAME=cognizant-intelligent-test-scripter
VERSION=1.0
TAG=v1.0.1
REPO=x0156/Cognizant-Intelligent-Test-Scripter
ROOT=$HOME/lib/cits
BINARY=$HOME/bin/CITS
CHROME_DRIVER_VERSION=2.30
#download
curl -O -L "https://github.com/$REPO/releases/download/$TAG/$NAME-$VERSION-setup.zip"
#extract
unzip $NAME-$VERSION-setup.zip > unzip_log.txt
#create install dir
mkdir -p $ROOT
mkdir -p $HOME/bin
#install
mv $NAME-$VERSION/* $ROOT
#apply permission
chmod +x $ROOT/Run.command
#create binary
ln -s $ROOT/Run.command $BINARY
echo "$NAME from $REPO installed in $ROOT";echo "version:"
CITS -version

echo "installing chromedriver"
curl -O -L "http://chromedriver.storage.googleapis.com/$CHROME_DRIVER_VERSION/chromedriver_linux64.zip"
unzip  chromedriver_linux64.zip
rm chromedriver_linux64.zip
mv -f ~/chromedriver $HOME/lib
chmod +x $HOME/lib/chromedriver
ln -s $HOME/lib/chromedriver $CHROME_DRIVER_BIN

# creating sourcefile
echo "export CITS_VERSION=$VERSION" > sourcefile
echo "export CITS_TAG=$TAG" >> sourcefile
echo "export CITS_ROOT=$ROOT" >> sourcefile
echo "export PATH=$ROOT:$PATH" >> sourcefile
