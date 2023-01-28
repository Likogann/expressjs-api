#!/bin/bash
# Installer

# Is this the first install?
finstall=`cat data/firstinstall`
if [ $finstall != "true" ]; then
    # Install dependencies
    echo "Installing..."
    sudo apt install git screen gcc libc6-dev libsodium-dev make autoconf

    # Download the latest mkp224o
    git clone https://github.com/cathugger/mkp224o mkp224o-master
    cd mkp224o-master
    echo "true" > ../data/firstinstall
    bash autogen.sh
else
    # Clean make files
    cd mkp224o-master
    make clean
fi

# Make the latest using whatever configuration set in /optimisations.list
optimisations=`cat ../optimisations.list`
make
./configure $optimisations
mv -v mkp224o ..

cd ..
bash start.sh