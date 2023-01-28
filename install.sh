#!/bin/bash
# Installer

# First Installation
echo "Starting installer on $(date)"
installer() {
    # Install dependencies
    echo "Installing..."
    sudo apt install git gcc libc6-dev libsodium-dev make autoconf

    # Download the latest mkp224o
    git clone https://github.com/cathugger/mkp224o mkp224o-master
    cd mkp224o-master
    echo "true" > ../data/firstinstall
    bash autogen.sh

    # Run data/formatService.sh
    cd ../data
    bash formatService.sh
    cd ../mkp224o-master
}

# Already installed before
installed() {
    # Clean make files
    cd mkp224o-master
    rm -rf ../mkp224o
    make clean -s

    # Run data/formatService.sh
    cd ../data
    bash formatService.sh
    cd ../mkp224o-master
}

# Is this the first install?
finstall=data/firstinstall
if [ -f $finstall ]; then
    if [ `cat $finstall` != "true" ]; then
        echo "Determined first install (rsn:1)"
        installer
    else
        echo "Determined not first install"
        installed
    fi
else
    echo "Determined first install (rsn:0)"
    installer
fi


# Make the latest using whatever configuration set in /optimisations.list
optimisations=`cat ../optimisations.list`
./configure $optimisations
make -s
mv -v mkp224o ..

cd ..

echo "Starting mkp224o service"
sudo systemctl start mkp224o
systemctl status mkp244o