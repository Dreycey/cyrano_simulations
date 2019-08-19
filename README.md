# SimRNA modeling information
* Author: Dreycey Albin
* Date: 06/23/2019
* Updates: 
* SimRNA was used to computationally predict the 3D structure of Cyrano for this study. Attached here are some of the scripts that were used to automate the prediction and post processing of the computationally modeled structures. 

## Unpacking the data file
First make sure to download the *DA_cyrano_2019_FINAL.tar.gz*, which contains all of the structural models for Cyrano. This is performed as follows: 
```
tar -zxvf DA_cyrano_2019_FINAL.tar.gz
```

## Replicating Modeling
All of the necessary information to replication the modeling parameters is located in the ######## file. Here, the user may choose to run the following commands to start the simulations in parallel. 

```
./subscript_1.sh;
./subscript_2.sh;
./subscript_3.sh;
./subscript_4.sh
```

Each of these starts running simRNA on the subdirectories located within the cyrano_simulations/ directory. 

## Using automated bash scripts for post processing
The following scripts were made in order to semi-automate the post processing of the simulations returned from simRNA. Running the scripts in the following order will allow for a user to pull out pertinent information from the simRNA simulations. 

* The following scripts will extract the lowest energy model from each subdirectory, then obtain the RMSD vs Energy results. 
```
./extract_lowest_script.sh
./get_rmsd_energy_script.sh
```
* The **trafl_to_pdb.sh** script will turn all of the sub runs within a subdirectory into pdb files by extracting the lowest energy structure for each simulation run. 
```
 ./trafl_to_pdb.sh
 ```
 * The **cluster_script.sh** takes the concatenated trafl file produced for each structure and extracts model clusters based on a RMSD similarity. 
 ```
 ./cluster_script.sh
 ```
 * The **extract_results.sh** script pulls out all of the data generated from running the other scripts above. This helps keep everything in an organized directory for further analysis. 
 ```
./extract_results.sh 
```
* An additional script, **makebackups.sh**, can be used to grab the **sequence.txt** and **structure.txt** files from subdirectories. This is helpful if you'd like to rerun a simulation. 
```
./makebackups.sh
```
