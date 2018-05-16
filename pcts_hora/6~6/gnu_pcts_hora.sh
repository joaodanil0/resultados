#!/bin/bash

/usr/bin/gnuplot <<__EOF

set term postscript eps enhanced color 
set out "Pcts_hora.eps"
set datafile separator ","

set xlabel "Time (H)" 				font ",15"
set ylabel "Packets sent" 			font ",15"

set yrange [0:140000]
set xrange [0:72]
set xtics 24 						font ",15"
set ytics 20000						font ",15"

set key 							font ",15" right top
set size 0.5

set grid ytics
set grid xtics

plot \
	 "data_GAFEH.csv"     			u 4:3 title "GAF-EH"     	w lp lw 1 lt 2 lc 1 pt 1 ps 1,\
	 "data_collect.csv" 			u 4:3 title "Collect-both" 	w lp lw 1 lt 2 lc 2 pt 2 ps 1,\
	 "data_GAFEH_BAT.csv"  			u 4:3 title "Collect-BAT"  	w lp lw 1 lt 2 lc 4 pt 4 ps 1,\
	 "data_GAFEH_SI.csv"   			u 4:3 title "Collect-SI"   	w lp lw 1 lt 2 lc 6 pt 6 ps 1
__EOF
