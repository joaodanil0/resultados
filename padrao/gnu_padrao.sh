#!/bin/bash

/usr/bin/gnuplot <<__EOF

set term postscript eps enhanced color 
set out "Padrao_.eps"
set datafile separator ","

set xlabel "Time (H)" font ",15"
set ylabel "Energy (J)" font ",15"

set yrange [0:1600]
set xrange [0:96]
set xtics 24 font ",15"
set ytics 200 font ",15"

set key font ",15" right top
set size 0.5

set grid ytics
set grid xtics

 
plot "data_GAFEH.csv"     u 3:4:2 title "GAFEH"     with yerrorline lw 1.5 lt 1 lc 1 pt 12 ps 1, \
	 "data_GAFEH_BAT.csv" u 3:4:2 title "GAFEH_ BAT" with yerrorline lw 1.5 lt 1 lc 3 pt 10 ps 1, \
	 "data_GAFEH_SI.csv"  u 3:4:2 title "GAFEH_ SI"  with yerrorline lw 1.5 lt 1 lc 5 pt 8  ps 1, \
	 "data_collect.csv"   u 3:4:2 title "Collect"   with yerrorline lw 1.5 lt 1 lc 7 pt 6  ps 1, 

#plot "result_GAFEH.csv"     u 1:3:2 title "GAFEH"     with yerrorline lw 1.5 lt 1 lc 1 pt 12 ps 1, \
#	 "result_GAFEH_BAT.csv" u 1:3:2 title "GAFEH_ BAT" with yerrorline lw 1.5 lt 1 lc 3 pt 10 ps 1, \
#	 "result_GAFEH_SI.csv"  u 1:3:2 title "GAFEH_ SI"  with yerrorline lw 1.5 lt 1 lc 5 pt 8  ps 1, \
#	 "result_collect.csv"   u 1:3:2 title "Collect"   with yerrorline lw 1.5 lt 1 lc 7 pt 6  ps 1,  

__EOF




