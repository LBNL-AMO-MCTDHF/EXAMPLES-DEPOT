#!/bin/bash

echo '

set title "Integrated photoionization flux and photons absorbed H2 parallel"

set term unknown
set xlabel "Energy (eV)"
set ylabel "integrand log scale"
set y2label "integrated flux (norm-squared) or photons"
set ytics nomirror
set y2tics
set format y "%4.0e"
set format y2 "%4.1e"

set xrange [0:70]
set yrange [1e-10:*]
set y2range [0:*]

set logscale y

set key bottom right

A=27.2114

plot "Dat/ZOPhoton.Dat" using (A*$5):($7) with lines lt 6 lw 8 title "integrand photons"
replot "Dat/xsec.spi.dat" using (A*$1):($5) with lines lt 7 lw 6 title "integrand normsq"

replot "Dat/ZOPhoton.Dat" using (A*$5):($6) axes x1y2 with lines lt 8 lw 4 title "photons absorbed"
replot "Dat/xsec.spi.dat" using (A*$1):($7) axes x1y2 with lines lt -1 lw 1 title "normsq ionized"

set term post enhanced 20 color solid eps
set out "flux.h2.par.eps"
replot

set term x11
set out
replot

' | gnuplot -persist

