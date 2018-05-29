#!/bin/sh

source ./paths.inc

if [ "$PYTHIA_8325" == "" ]; then
	echo "Error: Set Pythia path in 'paths.inc'!"
	exit
fi

FILE_ORIG=$PYTHIA_8325/src/TimeShower.cc
if [ ! -f $FILE_ORIG ]; then
	echo "Error: Could not find pythia code! Check path in 'paths.inc'."
	exit
fi

echo "Patch files"
FILE_NEW=TimeShower.cc
cp $FILE_NEW $FILE_ORIG

echo "Recompile Pythia v8.325"
cd $PYTHIA_8325
make
make install

echo "Patch successfully installed!"

