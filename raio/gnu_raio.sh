#!/bin/bash

/usr/bin/gnuplot <<__EOF

set term postscript eps enhanced color 
set out "Grafico_raio_energia.eps"
set datafile separator ","


set xrange [20:60]
set yrange [100:1100]

set xlabel "Alcance (m)" 				font ",15"
set ylabel "Energia (J)" 				font ",15"

set xtics 10
set ytics 200
set key 								font ",15" right bottom

set grid ytics

set size 0.5

plot \
	"result_collect.csv" 					u 1:3:2 title "COLLECT" with yerrorline lw 1.5 lt 1 lc 3 pt 10 ps 1


__EOF

