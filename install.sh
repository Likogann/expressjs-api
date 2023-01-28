#!/bin/bash
# Installer

# First Installation
installer() {
    # Install dependencies
    echo "Installing..."
    sudo apt install git screen gcc libc6-dev libsodium-dev make autoconf

    # Download the latest mkp224o
    git clone https://github.com/cathugger/mkp224o mkp224o-master
    cd mkp224o-master
    echo "true" > ../data/firstinstall
    bash autogen.sh
}

# Already installed before
installed() {
    # Clean make files
    cd mkp224o-master
    rm -rf ../mkp224o
    make clean
}

# Is this the first install?
finstall=data/firstinstall
if [ -f $finstall ]; then
    if [ `cat $finstall` != "true" ]; then
        echo "Determined first install"
        installer
    else
        echo "Determined not first install"
        installed
    fi
else
    echo "Determined first install"
    installer
fi


# Make the latest using whatever configuration set in /optimisations.list
optimisations=`cat ../optimisations.list`
./configure $optimisations
make
mv -v mkp224o ..

cd ..
bash start.sh