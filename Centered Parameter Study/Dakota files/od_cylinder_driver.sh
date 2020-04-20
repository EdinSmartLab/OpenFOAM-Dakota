 # copyright (c) 2019 ASandip
 #This program is free software: you can redistribute it and/or 
 # modify it under the terms of the GNU General Public License as 
 # published by the Free Software Foundation, either version 3 of the License, or
 # (at your option) any later version.
 # This program is distributed in the hope that it will be useful,
 # but WITHOUT ANY WARRANTY; without even the implied warranty of
 # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 # GNU General Public License for more details.
 
 # You should have received a copy of the GNU General Public License
 # along with this program.  If not, see <https://www.gnu.org/licenses/>.

#!/bin/bash

# $1 and $2 are special variables in bash that contain the 1st and 2nd 
# command line arguments to the script, which are the names of the
# Dakota parameters and results files, respectively.

params=$1
results=$2

############################################################################### 
##
## Pre-processing Phase -- Generate/configure an input file for your simulation 
##  by substiting in parameter values from the Dakota paramters file.
##
###############################################################################

#Transfer the new fluid transport parameter, kinematic viscosity, from Dakota parameters file to OpenFOAM simulation input file
#Both files are currently in the Dakota workspace/Dakota Project
dprepro $params sim.template transportProperties

#Transfer the OpenFOAM simulation input file, with new transport parameter, from Dakota workspace to OpenFOAM workspace
cp /Dakota/Gui/Workspace/Dakota/Project/transportProperties     /OpenFOAM/Workspace/Case/Directory/constant

############################################################################### 
##
## Execution Phase -- Run your simulation
##
###############################################################################

#Call the bash script that runs the OpenFOAM simulation
bash od_cylinder_driver_1.sh


############################################################################### 
##
## Post-processing Phase -- Extract (or calculate) quantities of interest
##  from your simulation's output and write them to a properly-formatted
##  Dakota results file.
##
###############################################################################

#Extract the drag coefficient from OpenFOAM output and transfer it to Dakota results file, results.out
tail -n 1 /OpenFOAM/Workpsace/Case/Directory/postProcessing/forceCoeffs_object/0/forceCoeffs.dat | awk '{ print $3 }' > $results




