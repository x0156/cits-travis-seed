#!/bin/bash

set -e

NAME=cognizant-intelligent-test-scripter
VERSION=1.0-SNAPSHOT
TAG=v1.0-snapshot
REPO=CognizantQAHub/Cognizant-Intelligent-Test-Scripter
ROOT=$HOME/lib/cits
BINARY=$HOME/bin/CITS

#download
curl -O -L "https://github.com/$REPO/releases/download/$TAG/$NAME-$VERSION-setup.zip"
#extract
unzip $NAME-$VERSION-setup.zip > unzip_log.txt
#create install dir
mkdir -p $ROOT
mkdir -p $HOME/bin
#install
mv $NAME-$VERSION/* $ROOT
#create binary
echo "$ROOT/Run.command \$@" > $BINARY
#apply permission
chmod u+x $BINARY
chmod u+x $ROOT/Run.command
echo "$NAME from $REPO installed in $ROOT";echo "version:"
CITS -version

# creating sourcefile
echo "export CITS_VERSION=$VERSION" > sourcefile
echo "export CITS_TAG=$TAG" >> sourcefile
echo "export CITS_ROOT=$ROOT" >> sourcefile
echo "export PATH=$ROOT:$PATH" >> sourcefile
