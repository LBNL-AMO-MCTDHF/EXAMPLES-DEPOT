#!/bin/bash

echo '

set title "Photoionization flux H2 fixed nuclei 7 orbitals parallel"

set term unknown
set xlabel "Photon Energy (eV)"
set ylabel "integrand"
set y2label "integrated flux (norm-squared)"
set ytics nomirror
set y2tics
set format y "%12.2e"
set format y2 "%12.2e"

set xrange [0:100]
set yrange [0:*]
set y2range [0:*]

A=27.2114

plot "Dat/xsec.spi.dat" using (A*$1):($5) with lines lt 7 lw 8 title "integrand"
replot "Dat/xsec.spi.dat" using (A*$1):($7) with lines lt -1 lw 2 title "integrated" axes x1y2

set term post enhanced 20 color solid
set out "flux.h2.par.ps"
replot

set term x11
set out
replot

' | gnuplot -persist

