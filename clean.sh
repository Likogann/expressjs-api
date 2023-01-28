#!/bin/bash
# Used to cleanup everything
# This script will convince the installe that this is a fresh install
# Will not clear filters
echo "Cleaning"
sudo rm -rf mkp224o* start.sh data/firstinstall data/mkp224o.service /etc/systemd/system/mkp224o.service