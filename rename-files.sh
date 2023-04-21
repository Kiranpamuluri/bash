#!/bin/bash

# Script Name	: rename-files.sh
# Author			: Sandeep koneru
# Created			: 06-August-2019


# Modifications	:

# Description		: This will batch rename all files from one extension to another



funct_check_params()				
{
  if [ ${NARG} -lt 3 ]; then			
    echo "Usage: $0 directory *.old_extension *.new_extension"
    exit 1					
  elif						
  
  

  [[ ${script_name} = "-h" ]] || [[ ${script_name} = "--h" ]]; then
    echo "Usage: $0 directory old_extension new_extension"
    exit 1					
  fi						
}						

funct_batch_rename()				
{
  old_ext_cut=`echo ${old_ext} | cut -f2 -d .` 	
  new_ext_cut=`echo ${new_ext} | cut -f2 -d .`	
  
  # This will carry out the rename

  for file in $(ls $work_dir/*$old_ext); do mv $file `echo $file | sed 's/\(.*\.\)'$old_ext_cut'/\1'$new_ext_cut/` ; done
}

################
# Main Program #
################

# Variable Settings

script_name=$0 
work_dir=$1
old_ext=$2
new_ext=$3
NARG=$#

{						# Start the main program
  funct_check_params				# Call the procedure
  funct_batch_rename				# Call the procedure
}						# End of the main program 	

## End of Script
