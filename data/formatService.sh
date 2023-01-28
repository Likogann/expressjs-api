#!/bin/bash
# Setup the mkp224o.service file
# location: data/

echo "Creating mkp224o.service"
serviceFileTemplate=mkp224o.service.template
startshLocation=`readlink -f ../start.sh`

echo "Creating start.sh script"
startFileTemplate=start.sh.template
homeDir=`readlink -f ../.`

# Fill variables with real information in the service and start.sh scripts
echo "$(eval "echo \"$(cat $serviceFileTemplate)\"")" > mkp224o.service
echo "$(eval "echo \"$(cat $startFileTemplate)\"")" > start.sh
mv -v start.sh ..

# Copy service file to /etc/systemd/system/
echo "Placing service file into /etc/systemd/system/mkp224o.service"
sudo cp mkp224o.service /etc/systemd/system/mkp224o.service

# Reload the systemd dameon and start mkp224o.service
echo "Reload systemctl dameon"
sudo systemctl daemon-reload

# Cd back into root dir
cd ../

sudo chmod +777 start.sh