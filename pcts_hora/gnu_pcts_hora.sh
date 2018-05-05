#!/bin/bash

/usr/bin/gnuplot <<__EOF

set term postscript eps enhanced color 
set out "Padrao.eps"
set datafile separator ","

set xlabel "Time (H)" font ",15"
set ylabel "Packets sent" font ",15"

#set yrange [0:5000]
set xrange [0:72]
set xtics 6 font ",15"
#set ytics 6 font ",15"

set key font ",15" right top
set size 0.5

set grid ytics
set grid xtics

#set style data histogram
#set style histogram cluster gap 5
#set style fill solid border 0
#set boxwidth 0.9
#set xtic rotate by -45 scale 0
#set style histogram gap 10

plot "data_GAFEH.csv"     u 3:4:2 title "GAFEH"     with yerrorline lw 1.5 lt 1 lc 1 pt 10 ps 1, \
	 "data_GAFEH_BAT.csv" u 3:4:2 title "GAFEH BAT" with yerrorline lw 1.5 lt 1 lc 2 pt 12 ps 1, \
	 "data_GAFEH_SI.csv"  u 3:4:2 title "GAFEH SI"  with yerrorline lw 1.5 lt 1 lc 3 pt 14 ps 1, \
	 "data_collect.csv"   u 3:4:2 title "collect"   with yerrorline lw 1.5 lt 1 lc 4 pt 16 ps 1
 
#plot "result_GAFEH.csv" using 3:xtic(1) ti col  , "result_GAFEH_BAT.csv" u 3, "result_GAFEH_SI.csv"  u 3, "result_collect.csv"   u 3
__EOF

