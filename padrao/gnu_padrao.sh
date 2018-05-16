#!/bin/bash

/usr/bin/gnuplot <<__EOF

set term postscript eps enhanced color 
set out "Energy.eps"
set datafile separator ","

set xlabel "Time (H)" 				font ",15"
set ylabel "Energy (J)" 			font ",15"

set yrange [0:2100]
set xrange [0:72]
set xtics 24 						font ",15"
set ytics 200 						font ",15"

set key 							font ",15" right top
set size 0.5

set grid ytics
set grid xtics
#with yerrorline
plot \
	 "result_GAFEH.csv"  			u 1:3 title "GAF-EH"  		lw 1 lt 1 lc 1 pt 1 ps 1,\
	 "result_collect.csv" 			u 1:3 title "Collect-both"	lw 1 lt 1 lc 2 pt 2 ps 1,\
	 "result_GAFEH_BAT.csv"			u 1:3 title "Collect-BAT"  	lw 1 lt 1 lc 4 pt 4 ps 1,\
	 "result_GAFEH_SI.csv" 			u 1:3 title "Collect-SI"   	lw 1 lt 1 lc 7 pt 6 ps 1 			

	 
__EOF
