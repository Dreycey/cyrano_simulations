## Turning the clustered models into pdb models
for pdb_directory in cyrano_simulations/*;
	do mkdir DA_scripts/${pdb_directory};
	for sequence_file in ${pdb_directory}/sequence.txt;
		do cp $sequence_file DA_scripts/${sequence_file};
	done;
	for secondary_file in ${pdb_directory}/secondary.txt;
		do cp $secondary_file DA_scripts/${secondary_file};
        done;
done;
