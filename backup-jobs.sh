#!/bin/bash

# Script Name	: backup_jobs.sh
# Author			: Sandeep Koneru
# Created			: December 4, 2019

# Description		: Backs up the user that is running the script home directory, and copy it to another machine



funct_home_dir()
{
  tar cvpzf - /home/${user} | ssh sandeepdev@backup "cat > /export/home/sandeepdev/${host}_${user}_backup.tar.gz"
}



host=`hostname`
user=`whoami`

{
        funct_home_dir
}
