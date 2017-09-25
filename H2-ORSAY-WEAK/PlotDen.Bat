#!/bin/bash

if [[ "$1 " == " " ]]
then
	echo "need time"
	exit
fi


chmctdhf_diatom Inp=Input.Inp.Fourier Act=10 T=$1


