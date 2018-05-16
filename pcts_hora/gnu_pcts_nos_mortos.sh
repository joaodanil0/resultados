#!/bin/bash

/usr/bin/gnuplot <<__EOF

set term postscript eps enhanced color 
set out "Dead nodes.eps"
set datafile separator ","

set xlabel "Time (H)" 				font ",15"
set ylabel "Dead nodes" 			font ",15"

set yrange [0:1000]
set xrange [0:96]
set xtics 24 						font ",15"
#set ytics 6 						font ",15"

set key 							font ",15" right top
set size 0.5

set grid ytics
set grid xtics

plot \
	 "nos_mortos_GAFEH.csv"     	u 1:3 title "GAF-EH"    	w lp lw 1 lt 2 lc 1 pt 1 ps 1,\
	 "nos_mortos_collect.csv" 		u 1:3 title "Collect-both" 	w lp lw 1 lt 2 lc 2 pt 2 ps 1,\
	 "nos_mortos_GAFEH_BAT.csv"  	u 1:3 title "Collect-BAT" 	w lp lw 1 lt 2 lc 4 pt 4 ps 1,\
	 "nos_mortos_GAFEH_SI.csv"   	u 1:3 title "Collect-SI"   	w lp lw 1 lt 2 lc 6 pt 6 ps 1

__EOF
