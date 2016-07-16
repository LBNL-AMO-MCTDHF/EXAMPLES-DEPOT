#!/bin/bash

echo '

set title "Photoionization flux and photons absorbed O2 parallel"

set term unknown
set xlabel "Energy above ground state (eV)"
set ylabel "Photons or flux (norm-squared) per Hartree"
set ytics nomirror

A=27.2114

plot "Dat/ZOPhoton.Dat" using (A*$5):($7) with lines lt -1 lw 5 title "Photons len"
replot "Dat/ZOPhoton.Dat.vel" using (A*$5):($7) with lines lt 2 lw 2 title "Photons vel"

replot "Dat/xsec.spi.dat" using (A*$1):($5) with lines lt 3 lw 8 title "Normsq len"
replot "Dat/xsec.spi.vel.dat" using (A*$1):($5) with lines lt 5 lw 2 title "Normsq vel"

set ytics nomirror
set y2range [0:*]
set y2label "Pulse intensity (linear scale)" rotate by 270
replot "Dat/xsec.spi.dat" using (A*$1):($2) with lines lt -1 title "Pulse intensity" axes x1y2

set xrange [1:*]
set logscale x

set yrange [1e-12:*]
set logscale y
set format y "%4.0e"

set key top right

set term post eps enhanced 20 color solid
set out "flux_o2.eps"
replot

set term x11
set out
replot

set xrange [0:40]
unset logscale x

set yrange [*:*]
unset logscale y
set format y "%g"

set key bottom right

set term post eps enhanced 20 color solid
set out "flux_o2_zoom.eps"
replot

set term x11 2
set out
replot



' | gnuplot -persist

