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

#Step 1: Source OpenFOAM environment, for example openFOAM 6
source ~/openfoam6/etc/bashrc

#Step 2: Open OpenFOAM case directory
cd /OpenFOAM/Workspace/Case/Directory

#Step 3: Clean OpenFOAM case directory, this step is optional
foamCleanTutorials

#Step 4: Generate mesh
blockMesh 

#Step 5: Run OpenFOAM case, for example if using icoFoam solver,
icoFoam | tee log.icofoam

