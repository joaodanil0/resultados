#!/bin/bash

/usr/bin/gnuplot <<__EOF

set term postscript eps enhanced color 
set out "densidade.eps"
set datafile separator ","


set xrange [0.01:0.09]
set yrange [200:1100]

set xlabel "Densidade (nos/m^2)" font ",15"
set ylabel "Energia (J)" font ",15"

set xtics (0.01, 0.03, 0.05, 0.07, 0.09)
set ytics 200
set key font ",15" right bottom

set grid ytics

set size 0.5
plot "result_com.csv" u 1:3:2 title "COLLECT" with yerrorline lw 1.5 lt 1 lc 3 pt 10 ps 1, "result_sem.csv" u 1:3:2 title "GAF+Coleta" with yerrorline lw 1.5 lt 1 lc 1 pt 12 ps 1


__EOF

