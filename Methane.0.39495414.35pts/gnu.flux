#!/bin/bash

echo '

set title "Photoionization flux and photons absorbed methane"

set term unknown
set xlabel "Energy above ground state (eV)"
set ylabel "Photons or flux (norm-squared) per Hartree"
set format y "%4.0e"

set key bottom right

A=27.2114

# for integrand there is a factor of 1/2 = 0.5 missing in output from code

plot "Dat/ZOPhoton.Dat" using (A*$5):(0.5*$7) with lines lt -1 lw 5 title "Photons len"
replot "Dat.vel/ZOPhoton.Dat" using (A*$5):(0.5*$7) with lines lt 2 lw 2 title "Photons vel"

replot "Dat/xsec.spi.dat" using (A*$1):(0.5*$5) with lines lt 3 lw 8 title "Normsq len"
replot "Dat.vel/xsec.spi.dat" using (A*$1):(0.5*$5) with lines lt 5 lw 2 title "Normsq vel"

set ytics nomirror
set y2range [0:*]
set y2label "Pulse intensity (linear scale)" rotate by 270
replot "Dat/xsec.spi.dat" using (A*$1):($2) with lines lt -1 title "Pulse intensity" axes x1y2

set xrange [1:*]
set logscale x
set yrange [1e-12:*]
set logscale y

set term post eps enhanced 20 color solid
set out "flux_methane.eps"
replot

set out
set term x11
replot



set xrange [7:20]
unset logscale x
set yrange [*:*]

set term post eps enhanced 20 color solid
set out "flux_methane_zoom.eps"
replot

set term x11 2
set out
replot



' | gnuplot -persist

