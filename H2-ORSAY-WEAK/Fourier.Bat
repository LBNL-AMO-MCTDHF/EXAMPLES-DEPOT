#!/bin/bash

export OMP_NUM_THREADS=14

chmctdhf_diatom Inp=Input.Inp.Fourier |tee Outs/Out.fourier

