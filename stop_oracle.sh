#!/bin/bash

# Script Name		: stop_oracle.sh
# Author				: Sandeep Koneru
# Created				: 31-May-2018


# Description			: This will kill all the oracle processes associated with a given sid

#################################
# Start of procedures/functions #
#################################

funct_check_params()																									
{																																	
 function
  if [ ${NARG} -ne 1 ]; then																								
    echo "$0 : Not enough Parameters passed, you need to supply an ORACLE_SID"
    exit 1																														
  elif																																

  

  [[ ${SID} = "-h" ]] || [[ ${SID} = "--h" ]]; then
    echo "Usage: You need to add an ORACLE_SID, e.g $0 BOSSLIVE"
    exit 1																														
  fi																																
}																																	

funct_check_user()																										
{																																	
  if [ `/usr/ucb/whoami` != 'oracle' ]; then																			
    echo "Error: you must run this as oracle"																		
    exit 99																														
  fi																																	
}																																	

funct_kill_oracle()																											
{																																	
  get_processes=`ps -ef | grep "ora_" | grep ${SID} | grep -v grep` ; export get_processes		
  echo -e "\nProcesses that will be killed is \n\n ${get_processes}"
  ps -ef | grep "ora_" | grep ${SID} | grep -v grep | awk '{print $2}' | xargs kill -9						
}																																	
SID=$1																															
NARG=$# 																													

{																																	
  funct_check_params																									
  funct_check_user																										
  funct_check_user
  funct_kill_oracle																											
  funct_kill_oracle
}																																	


