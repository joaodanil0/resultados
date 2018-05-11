#!/bin/bash

/usr/bin/gnuplot <<__EOF

set term postscript eps enhanced color 
set out "Delivered packets.eps"
set datafile separator ","

set xlabel "Time (H)" 				font ",15"
set ylabel "Delivered packets (%)" 	font ",15"

set yrange [0:160]
set xrange [0:96]
set xtics 24 						font ",15"
#set ytics 6 						font ",15"

set key 							font ",15" right top
set size 0.5

set grid ytics
set grid xtics

plot \
	 "data_PD_GAFEH.csv"     		u 3:4:2 title "GAF-EH"     		with yerrorline lw 1 lt 2 lc 1 pt 1 ps 1,\
	 "data_PD_collect.csv" 			u 3:4:2 title "Collect-both" 	with yerrorline lw 1 lt 2 lc 2 pt 2 ps 1,\
	 "data_PD_GAFEH_BAT.csv"  		u 3:4:2 title "Collect-BAT"		with yerrorline lw 1 lt 2 lc 4 pt 4 ps 1,\
	 "data_PD_GAFEH_SI.csv" 		u 3:4:2 title "Collect-SI"		with yerrorline lw 1 lt 2 lc 6 pt 6 ps 1, 
	 
__EOF