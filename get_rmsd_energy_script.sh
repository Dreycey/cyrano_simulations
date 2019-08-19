# Author: Dreycey Albin
# Date: 08/16/2019

##
# Purpose: The purpose of this script is to extract the RMSD vs Energy profile for all of the different models. This will go into all of the subdirectories for the models and produce energy and rmsd values using the SimRNA "calc_rmsd_to_1st_frame"
##

# Get RMSD vs ENERGY data
for pdb_directory in cyrano_simulations/*;
	do echo obtianing ENERGY vs RMSD for ${pdb_directory};
		cat $pdb_directory/*alltrafl_minE.trafl ${pdb_directory}/*traflall.trafl > ${pdb_directory}/energyrmsd.trafl;
	./calc_rmsd_to_1st_frame ${pdb_directory}/energyrmsd.trafl ${pdb_directory}/RMSDVvsENERGY.txt;
done;


