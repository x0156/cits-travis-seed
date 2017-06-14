#!/bin/bash

set -e

CITS_FNAME=cognizant-intelligent-test-scripter
CITS_VERSION=1.0-SNAPSHOT
CITS_TAG=v1.0-snapshot
CITS_REPO=CognizantQAHub/Cognizant-Intelligent-Test-Scripter
CITS_ROOT=$HOME/lib/cits
CITS_BIN=$HOME/bin/CITS
#PATH=$CITS_ROOT:$PATH
#download
curl -O -L "https://github.com/$CITS_REPO/releases/download/$CITS_TAG/$CITS_FNAME-$CITS_VERSION-setup.zip"
#extract
unzip $CITS_FNAME-$CITS_VERSION-setup.zip > unzip_log.txt
#create install dir
mkdir -p $CITS_ROOT
mkdir -p $HOME/bin
mv $CITS_FNAME-$CITS_VERSION/* $CITS_ROOT
cat $CITS_ROOT/Run.command > $CITS_ROOT/CITS
echo "./$CITS_ROOT/Run.command $*" > $CITS_BIN
#apply permission
chmod +x $CITS_BIN
echo "$CITS_FNAME installed in $CITS_ROOT"
echo "version:"
CITS -version
# creating sourcefile
echo "export CITS_VERSION=$CITS_VERSION" > sourcefile
echo "export CITS_TAG=$CITS_TAG" >> sourcefile
echo "export CITS_ROOT=$CITS_ROOT" >> sourcefile
#echo "export PATH=$CITS_ROOT:$PATH" >> sourcefile
