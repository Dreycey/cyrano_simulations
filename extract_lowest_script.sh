# Author: Dreycey Albin
# Date: 08/16/2019


##
# Purpose: The purpose of this script is to find the lowest energy structure
# for all of the models in lower levels of the cyrano_simulations/ directory.
# It works in three steps, first concatenating all of .trafl files, then 
# pulling out the minimum energy trafl files using the SimRNA script titled
# "trafl_extract_lowestE_frame.py", and lastly, turning the lowest energy
# .trafl into a pdb.
##

# Extracting lowest energy model

## Concatenate all of the trafl files
for pdb_directory in cyrano_simulations/*;
	do cat $pdb_directory/*trafl > ${pdb_directory}/${pdb_directory:19}_traflall.trafl;
done;

## Pull out minimum energy model from trafl files
for pdb_directory in cyrano_simulations/*;
	do for trafl_all_file in  ${pdb_directory}/*traflall.trafl;
		do ./trafl_extract_lowestE_frame.py $trafl_all_file;
	done;
done;

## Turn the lowest energy model into a pdb/
for pdb_directory in cyrano_simulations/*;
	do for pdb_file in $pdb_directory/*0_01-000001_AA.pdb;
		do pdf_file_prefix=${pdb_file:(-35):24};
		for trafl_file in $pdb_directory/*minE.trafl;
			do trafl_file_prefix=${trafl_file:(-30):24};
			echo working on $pdf_file_prefix $trafl_file_prefix;
			./DEFAULT_simRNA/SimRNA_trafl2pdbs $pdb_file $trafl_file 1 AA;
			done;
		done;
	done;

