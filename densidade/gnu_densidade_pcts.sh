#!/bin/bash

/usr/bin/gnuplot <<__EOF

set term postscript eps enhanced color 
set out "densidade_TX.eps"
set datafile separator ","


set xrange [0.01:0.09]
set yrange [80:100]

set xlabel "Densidade (nos/m^2)" font ",15"
set ylabel "Taxa de Entrega (%)" font ",15"

set xtics (0.01, 0.03, 0.05, 0.07, 0.09)
set ytics 5
set key font ",15" right bottom

set grid ytics

set size 0.5
plot "resultTX_com.csv" u 1:3:2 title "COLLECT" with yerrorline lw 1.5 lt 1 lc 3 pt 10 ps 1, "resultTX_sem.csv" u 1:3:2 title "GAF+Coleta" with yerrorline lw 1.5 lt 1 lc 1 pt 12 ps 1


__EOF

