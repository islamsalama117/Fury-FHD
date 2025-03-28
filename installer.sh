#!/bin/bash
######################################################################################
## Command=wget https://raw.githubusercontent.com/islamsalama117/Fury-FHD/refs/heads/main/installer.sh -O - | /bin/sh
##
###########################################
###########################################

# My config script #
PLUGIN_TAR="Fury-FHD.tar.gz"
MY_URL="https://github.com/islamsalama117/Fury-FHD/raw/refs/heads/main"
SKINDIR="/usr/share/enigma2/Fury-FHD"
BOXMODEL=$(cat /etc/model 2>/dev/null || echo "default")

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

if wget "$MY_URL/$PLUGIN_TAR"; then
    sleep 1
    tar xzvpf "/tmp/$PLUGIN_TAR" -C /
    rm -rf "/tmp/$PLUGIN_TAR"
else
    echo "Error: Failed to download plugin. Exiting..."
    exit 1
fi

if grep -qs -i "openATV" /etc/image-version; then
    echo "You have OpenAtv image"
    echo "Adjusting some files according to your image..."
    mv "$SKINDIR/image_logo/openatv/imagelogo.png" "$SKINDIR" 2>/dev/null
    mv "$SKINDIR/image_logo/openatv/top_logo.png" "$SKINDIR" 2>/dev/null
    if [ -f "/usr/share/enigma2/${BOXMODEL}.png" ]; then
        cp "/usr/share/enigma2/${BOXMODEL}.png" "$SKINDIR/boximage.png"
    else
        cp "$SKINDIR/main/boximage.png" "$SKINDIR/boximage.png"
        cp "$SKINDIR/main/top_logo.png" "$SKINDIR/top_logo.png"
    fi

elif grep -qs -i "egami" /etc/image-version; then
    echo "You have Egami image"
    echo "Adjusting some files according to your image..."
    mv "$SKINDIR/image_logo/egami/imagelogo.png" "$SKINDIR" 2>/dev/null
    mv "$SKINDIR/image_logo/egami/top_logo.png" "$SKINDIR" 2>/dev/null
    if [ -f "/usr/share/enigma2/${BOXMODEL}.png" ]; then
        cp "/usr/share/enigma2/${BOXMODEL}.png" "$SKINDIR/boximage.png"
    else
        cp "$SKINDIR/main/boximage.png" "$SKINDIR/boximage.png"
        cp "$SKINDIR/main/top_logo.png" "$SKINDIR/top_logo.png"
    fi

elif grep -qs -i "PURE2" /etc/image-version; then
    echo "You have PURE2 image"
    echo "Adjusting some files according to your image..."
    mv "$SKINDIR/image_logo/pure2/imagelogo.png" "$SKINDIR" 2>/dev/null
    mv "$SKINDIR/image_logo/pure2/top_logo.png" "$SKINDIR" 2>/dev/null
    if [ -f "/usr/share/enigma2/${BOXMODEL}.png" ]; then
        cp "/usr/share/enigma2/${BOXMODEL}.png" "$SKINDIR/boximage.png"
    else
        cp "$SKINDIR/main/boximage.png" "$SKINDIR/boximage.png"
        cp "$SKINDIR/main/top_logo.png" "$SKINDIR/top_logo.png"
    fi

elif grep -qs -i "OpenSPA" /etc/image-version; then
    echo "You have OpenSPA image"
    echo "Adjusting some files according to your image..."
    mv "$SKINDIR/image_logo/openspa/imagelogo.png" "$SKINDIR" 2>/dev/null
    mv "$SKINDIR/image_logo/openspa/top_logo.png" "$SKINDIR" 2>/dev/null
    if [ -f "/usr/share/enigma2/${BOXMODEL}.png" ]; then
        cp "/usr/share/enigma2/${BOXMODEL}.png" "$SKINDIR/boximage.png"
    else
        cp "$SKINDIR/main/boximage.png" "$SKINDIR/boximage.png"
        cp "$SKINDIR/main/top_logo.png" "$SKINDIR/top_logo.png"
    fi

else
    echo "You do not have a supported image, but you can try Fury-FHD."
    cp "$SKINDIR/main/boximage.png" "$SKINDIR/boximage.png"
    cp "$SKINDIR/main/top_logo.png" "$SKINDIR/top_logo.png"
fi

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
