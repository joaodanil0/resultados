#!/bin/bash

/usr/bin/gnuplot <<__EOF

set term postscript eps enhanced color 
set out "Grafico_raio_TX.eps"
set datafile separator ","


set xrange [20:60]
set yrange [80:100]

set xlabel "Quantidade de nos" 					font ",15"
set ylabel "Taxa de Entrega (%)" 				font ",15"

set xtics 10
set ytics 5
set key 										font ",15" right bottom

set grid ytics

set size 0.5

plot \
	"resultTX_collect.csv" u 1:3:2 title "COLLECT" with yerrorline lw 1.5 lt 1 lc 3 pt 10 ps 1


__EOF

