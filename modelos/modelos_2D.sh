#!/bin/bash

/usr/bin/gnuplot <<_EOF


set term postscript eps enhanced color
set out  "Modelo.eps"
set yrange [120:7500]
set xrange[0:1000]
set ytics 1000 								font ",15"
set xtics 200 								font ",15"

set key 									font ",15" right top
set ylabel "Intensidade Solar (W/m^2)" 		font ",15"
set xlabel "Tempo (H)" 						font ",15"
set size 0.5


set grid ytics mytics  
set mytics 1           
set grid               

#plot (-27.778*x*x + 666.667*x - 3000.024) 		t "Modelo 1" lw 3 lt 1 lc rgb "red"		# Modelo 1
#plot (-27.778*x*x + 666.667*x - 3000.024)*0.75 t "Modelo 2" lw 3 lt 1 lc rgb "red"		# Modelo 2

#plot -1.5*x + 1800 							t "Modelo 3" lw 3 lt 1 lc rgb "red"		# Modelo 3
#plot -1.5*x + 1800 							t "Modelo 4" lw 3 lt 1 lc rgb "red"		# Modelo 4

plot - 0.00708*x**2 + 7200, -7.08*x + 7200

_EOF
