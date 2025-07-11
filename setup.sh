#!user/bin/bash

Path=$(realpath .genm.sh)
echo $Path
chmod +x $Path
echo  source $Path > ~/.bashrc