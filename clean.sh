#!/bin/bash
# Used to cleanup everything
# This script will convince the installe that this is a fresh install
# Will not clear filters
echo "WARNING: THIS WILL DELETE YOUR KEYS!"
read -p "CONTINUE? [enter]"
rm -rf data/firstinstall mkp224o* keys