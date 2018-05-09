#!/bin/bash

/usr/bin/gnuplot <<__EOF

set term postscript eps enhanced color 
set out "Energy.eps"
set datafile separator ","

set xlabel "Time (H)" 				font ",15"
set ylabel "Energy (J)" 			font ",15"

set yrange [0:2100]
set xrange [0:96]
set xtics 24 						font ",15"
set ytics 200 						font ",15"

set key 							font ",15" right top
set size 0.5

set grid ytics
set grid xtics

 
#plot \
	 "data_GAFEH.csv"     			u 3:4:2 title "GAFEH"     		with yerrorline lw 1.5 lt 1 lc 1 pt 10 ps 1,\
	 "data_collect.csv" 			u 3:4:2 title "Collect-both"	with yerrorline lw 1.5 lt 1 lc 3 pt 12 ps 1,\
	 "data_GAFEH_BAT.csv"  			u 3:4:2 title "Collect-BAT"		with yerrorline lw 1.5 lt 1 lc 5 pt 14 ps 1,\
	 "data_GAFEH_SI.csv"   			u 3:4:2 title "Collect-SI" 		with yerrorline lw 1.5 lt 1 lc 7 pt 16 ps 1


plot \
	 "result_GAFEH.csv"  			u 1:3:2 title "GAF-EH"  		with yerrorline lw 1 lt 1 lc 1 pt 1 ps 1,\
	 "result_collect.csv" 			u 1:3:2 title "Collect-both"	with yerrorline lw 1 lt 1 lc 2 pt 2 ps 1,\
	 "result_GAFEH_BAT.csv"			u 1:3:2 title "Collect-BAT"  	with yerrorline lw 1 lt 1 lc 4 pt 4 ps 1,\
	 "result_GAFEH_SI.csv" 			u 1:3:2 title "Collect-SI"   	with yerrorline lw 1 lt 1 lc 6 pt 6 ps 1,\
	 "result_collect_1000.csv"		u 1:3:2 title "Collect-both1000"with yerrorline lw 1 lt 1 lc 7 pt 8 ps 1,\
	 "result_GAFEH_SI_1000.csv"		u 1:3:2 title "Collect-SI1000"	with yerrorline lw 1 lt 1 lc 8 pt 12 ps 1

__EOF
