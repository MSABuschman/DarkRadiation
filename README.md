[![arXiv](https://img.shields.io/badge/arXiv-1711.03554%20-green.svg)](https://arxiv.org/pdf/1505.07459.pdf)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

If you make use of `DarkRadiation` in a publication, please cite [1505.07459](https://arxiv.org/pdf/1505.07459.pdf).

# Dark Radiation

This code package generates the signature described in arXiv:1505.07459 (see e.g. Fig.1)

The output are full events in hepmc-format.



Prerequisites: 

	* MadGraph5

	* HepMC2

	* Pythia v.8.325 (too be linked with HepMC2 [ --with-hepmc2=.. ])

Note: 	The version requirement on Pythia8 is crucial, as there is a bug in all current versions of Pythia. 
	This code package comes with a patch for version 8.325 that is fully backwards compatible. 


Installation:

	1. Enter code directory

	2. Set path to MadGraph5 and Pythia8 in 'paths.inc'

	3. Execute 'pythia_patch.sh'


How to run:

	1. Set model parameters in 'params.inc'

	2. Execute 'run.sh'

	3. A hepmc-event-file called 'events.hepmc' is generated in the code directory.
