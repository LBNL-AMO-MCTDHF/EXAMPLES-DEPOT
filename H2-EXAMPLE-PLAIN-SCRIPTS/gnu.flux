#!/bin/bash

echo '

set title "Photoionization flux H2 fixed nuclei 7 orbitals parallel"

set term unknown
set xlabel "Photon Energy (eV)"
set ylabel "integrand"
set y2label "integrated"
set ytics nomirror
set y2tics
set format y "%12.7f"
set format y2 "%12.7f"

set xrange [0:100]
set yrange [0:*]
set y2range [0:*]

A=27.2114

plot "Dat/xsec.spi.dat" using (A*$1):($5) with lines lt 7 lw 10 title "integrand"
replot "Dat/xsec.spi.dat" using (A*$1):($7) with points pt 7 ps 1 lt -1 title "integrated" axes x1y2

set term post enhanced 20 color solid
set out "flux.h2.par.ps"
replot

set term x11
set out
replot

' | gnuplot -persist
