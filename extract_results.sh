# Author: Dreycey Albin
# Date: 08/16/2019

# Extract Results

## Create a results directory if it doesn't already exist
results_dir=DA_cyrano_2019;
input_dir=cyrano_simulations/;
if [ ! -d $results_dir ]; then
       mkdir $results_dir;
       mkdir $results_dir/${input_dir}
fi;       

## Pulling out the major resuts from the different simulations
for pdb_directory in ${input_dir}*;
        do echo working on $pdb_directory;
	mkdir ${results_dir}/${pdb_directory};
        for sequence_file in ${pdb_directory}/sequence.txt;
                do cp $sequence_file ${results_dir}/${sequence_file};
        done;
        for secondary_file in ${pdb_directory}/secondary.txt;
                do cp $secondary_file ${results_dir}/${secondary_file};
        done;
	for pdb_file in ${pdb_directory}/*AA.pdb; 
		do cp $pdb_file ${results_dir}/$pdb_file;
	done;
        for energy_file in ${pdb_directory}/RMSDVvsENERGY.txt; 
                do cp $energy_file ${results_dir}/$energy_file;
        done;

done;
