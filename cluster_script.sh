# Author: Dreycey Albin
# Date: 08/16/2019

##
# Purpose: The purpose of this script is to allow for clusters to made
# for any of the output directories. It then uses all of the clusters 
# and generates pdb files from the clusters. 
##

## Clustering the models
for pdb_directory in cyrano_simulations/*;
	do echo working on clustering ${pdb_directory};
	./clustering ${pdb_directory}/*traflall.trafl 0.01 2.8 >& ${pdb_directory}/clustering.log;
done;

## Turning the clustered models into pdb models
## NOTE: number of cluster to look at can be change by modifying the 
## if [ $CLUSTER_COUNTER -lt 200 ]; statement
for pdb_directory in cyrano_simulations/*;
        do for pdb_file in $pdb_directory/*0_01-000001_AA.pdb;
                do pdf_file_prefix=${pdb_file:(-35):24};
                CLUSTER_COUNTER=0;
                for trafl_file in trafl_file in $pdb_directory/*clust*.trafl;
                        do trafl_file_prefix=${trafl_file:(-30):24};
                        if [ $CLUSTER_COUNTER -lt 200 ];
                        then
                                echo working on $pdf_file_prefix $trafl_file_prefix;
                                ./DEFAULT_simRNA/SimRNA_trafl2pdbs $pdb_file $trafl_file 1 AA;
                        fi;
                        let CLUSTER_COUNTER=CLUSTER_COUNTER+1;
                        done;
                done;
        done;

