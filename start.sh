#!/bin/bash
# Start

# Start the application using filters.list
echo "Starting mkp224o in a screen"
filters=`cat filters.list`
screen ./mkp224o -d keys $filters