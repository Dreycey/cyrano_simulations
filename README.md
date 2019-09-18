# SimRNA modeling information
* Author: Dreycey Albin
* Date: 08/19/2019; 09/18/2019
* Updates: 09/18/2019- added references. Also added files for the lowest energy models and other file readers may be interested in evaluating.
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

**NOTE**: Remember to use the **config_temp.dat**, as it contains all of the parameters used in the SimRNA simulations for these models. 

## Using automated bash scripts for post processing
The following scripts were made in order to semi-automate the post processing of the simulations returned from simRNA (1). Running the scripts in the following order will allow for a user to pull out pertinent information from the simRNA simulations. 

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
### Extra scripts for further post processing
* The **rmsdvsenergy_plot.ipynb** python notebook was used for plotting the energy vs RMSD graphs for each of the different models. This can be opened in a jupyter notebook for evaluating the data in a dynamic fashion. 
* First launch jupyter notebooks within anaconda
```
jupyter notebooks
```
* Next open the following jupyter notebook:
```
open rmsdvsenergy_plot.ipynb
```

## For running the Rosetta full atomic minimizations:
* After installing the Rosetta software (2), the following bash command may be used to further perform an atomic minimization of the SimRNA models using the FARFAR force feild:

```
for pdb_file in ~/Desktop/VARANI_LAB/DA_cyrano_2019_FINAL/DA_cyrano_2019_FINAL_2/lowest_energy_models/*; do ./rna_minimize.default.macosclangrelease -database ../../database/ -s $pdb_file MINMIZE_${pdb_file:96:10}.out; done

```
# References 
(1) Boniecki, Michal J., et al. "SimRNA: a coarse-grained method for RNA folding simulations and 3D structure prediction." Nucleic acids research 44.7 (2015): e63-e63.

(2) Cheng, C. Y., Chou, F. C., & Das, R. (2015). Modeling complex RNA tertiary folds with Rosetta. In Methods in enzymology (Vol. 553, pp. 35-64). Academic Press.
