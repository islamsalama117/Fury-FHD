#!/bin/bash
######################################################################################
## Command=wget https://raw.githubusercontent.com/islamsalama117/Fury-FHD/refs/heads/main/installer.sh -O - | /bin/sh
##
###########################################
###########################################

# My config script #
PLUGIN_TAR="Fury-FHD.ipk"
MY_URL="https://github.com/islamsalama117/Fury-FHD/raw/refs/heads/main"

######################################################################################
MY_EM='============================================================================================================'

# Remove Old Plugin
echo "   >>>>   Removing old version..."
rm -rf /usr/lib/enigma2/python/Plugins/Extensions/Fury
rm -rf /usr/share/enigma2/Fury-FHD
echo "============================================================================================================================"
echo " DOWNLOAD AND INSTALL PLUGIN "
echo "   Installing plugin, please wait..."

cd /tmp || exit 1
set -e

wget "$MY_URL/$PLUGIN_TAR"
sleep 1
tar xzvpf "/tmp/$PLUGIN_TAR" -C /
rm -rf "/tmp/$PLUGIN_TAR"

echo "================================="
set +e

if [ $? -eq 0 ]; then
    echo ">>>>  SUCCESSFULLY INSTALLED <<<<"
fi

echo "********************************************************************************"
echo "   UPLOADED BY  >>>>   Islam Salama " 
sleep 4                        
echo "$MY_EM"
echo "**********************************************************************************"

exit 0













