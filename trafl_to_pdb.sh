
#!/bin/bash
# Author: Dreycey Albin

#turn all of the trafl files into corresponding pdb files
for pdb_directory in cyrano_simulations/*;
	do for pdb_file in $pdb_directory/*0_01-000001_AA.pdb;
		do

		# Pull out the minimum energy file from the trafl files
		for trafl_file in ${pdb_directory}/*.trafl;
			do
			if [[ ! $trafl_file  == *"clust"* ]]; then
				echo Obtaining minE for $pdb_directory;
				./trafl_extract_lowestE_frame.py $trafl_file;
				echo "";
				echo "";
			fi;
		done;

		# Turn minumum energy file into a pdb file
		for trafl_file in ${pdb_directory}/*_minE.trafl;
			do
			if [[ ! $trafl_file == *"clust"* ]]; then
				echo turning minE for $pdb_directory into a pdb;
				./DEFAULT_simRNA/SimRNA_trafl2pdbs $pdb_file $trafl_file 1 AA;
				echo "";
				echo "";
			fi;
		done;
	done;
done;


