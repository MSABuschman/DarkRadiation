#!/bin/bash

source paths.inc
source params.inc

if [ "$MG_DIR" == "" ]; then
	echo "Error: Set MadGraph path in 'paths.inc'!"
	exit
fi

# set directories
result_DIR=$MG_DIR/Zp-model/jj
card_DIR=$result_DIR/Cards
event_DIR=$result_DIR/Events
this=$PWD

# determine decay width
make Width
./Width $gZpq $gZpDM $mZp $mDM
source width.inc

# run process
cp -r DM_Zp_vector_UFO $MG_DIR/.
cd $MG_DIR/
./bin/mg5_aMC $this/Zp-procard.txt

# adapt cards
cd $card_DIR/
sed  -i -e "28s/.*/ $nEvents = nevents ! Number of unweighted events requested  /" run_card.dat
sed  -i -e "37s/.*/ $beamE  = ebeam1  ! beam 1 total energy in GeV  /" run_card.dat
sed  -i -e "38s/.*/ $beamE  = ebeam2  ! beam 2 total energy in GeV  /" run_card.dat

cd $card_DIR/
sed -i -e "22s/.*/    run_01 = run_tag ! name of the run /" run_card.dat
sed -i -e "26s/.*/    4900101 $mDM # Mdm   /" param_card.dat
sed -i -e "27s/.*/    9900032 $mZp # MZp  /" param_card.dat
sed -i -e "50s/.*/    1 $gZpq # Zpq   /" param_card.dat
sed -i -e "51s/.*/    2 $gZpDM # Zpchi    /" param_card.dat
sed -i -e "76s/.*/    DECAY 9900032 $GAMMA # WZp       /" param_card.dat

# generate events
../bin/generate_events -f
cd $event_DIR/run_01
gunzip unweighted_events.lhe.gz

# shower events including HV
cd $this
cp $PYTHIA_8325/examples/Makefile.inc .
make DarkRadiation
./DarkRadiation $beamE $alphaDark $mDM $mAp $tau0 $event_DIR/run_01/unweighted_events.lhe
