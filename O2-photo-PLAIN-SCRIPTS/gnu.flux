#!/bin/bash

echo '

set title "Integrated photoionization flux and photons absorbed O2 parallel"

set term unknown
set xlabel "Photon Energy (eV)"
set ylabel "integrand log scale"
set y2label "integrated flux (norm-squared) or photons"
set ytics nomirror
set y2tics
set format y "%12.2e"
set format y2 "%12.2e"

set xrange [0:100]
set yrange [1e-10:*]
set y2range [0:*]

set logscale y

set key bottom right

A=27.2114

plot "Dat/xsec.spi.dat" using (A*$1):($5) with lines lt 7 lw 8 title "integrand normsq"
replot "Dat/ZOPhoton.Dat" using (A*$5):($7) with lines lt 6 lw 4 title "integrand photons"

replot "Dat/xsec.spi.dat" using (A*$1):($7) axes x1y2 with lines lt -1 lw 3 title "normsq ionized"
replot "Dat/ZOPhoton.Dat" using (A*$5):($6) axes x1y2 with lines lt 8 lw 2 title "photons absorbed"

set term post enhanced 20 color solid
set out "flux.o2.ps"
replot

set term x11
set out
replot

' | gnuplot -persist

