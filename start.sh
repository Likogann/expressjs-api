#!/bin/bash
# Start

# Start the application using filters.list
filters=`cat filters.list`
./mkp224o -d keys $filters