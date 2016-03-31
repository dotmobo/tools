#!/bin/bash

#
# Recreate virtualenv for python2.7 and python3.4
#

for d in ~/.virtualenvs/*; do
    if [[ -d $d ]]; then
        if [[ -e $d/bin/python3.4 ]]; then
            echo "venv python34 for $d"
	    virtualenv -p /usr/bin/python3.4 $d
        elif [[ -e $d/bin/python2.7 ]]; then
            echo "venv python27 for $d"
	    virtualenv -p /usr/bin/python2.7 $d
        else
            echo "error with $d"
        fi
    fi
done
