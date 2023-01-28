#!/bin/bash
# Start

# Start the application using filters.list
echo "Starting mkp224o"
filters=`cat filters.list`
./mkp224o -d keys $filters