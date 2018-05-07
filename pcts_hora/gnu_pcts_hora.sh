#!/bin/bash

/usr/bin/gnuplot <<__EOF

set term postscript eps enhanced color 
set out "Padrao_.eps"
set datafile separator ","

set xlabel "Time (H)" font ",15"
set ylabel "Packets sent" font ",15"

#set yrange [0:7000]
set xrange [24:48]
set xtics 24 font ",15"
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

#plot "data_GAFEH.csv"     u 4:3:7 title "GAFEH"     with yerrorline lw 1.5 lt 1 lc 1 pt 10 ps 1, \
#	 "data_GAFEH_BAT.csv" u 4:3:7 title "GAFEH BAT" with yerrorline lw 1.5 lt 1 lc 3 pt 12 ps 1, \
#	 "data_GAFEH_SI.csv"  u 4:3:7 title "GAFEH SI"  with yerrorline lw 1.5 lt 1 lc 5 pt 14 ps 1, \
#	 "data_collect.csv"   u 4:3:7 title "collect"   with yerrorline lw 1.5 lt 1 lc 7 pt 16 ps 1
 
#plot "result_GAFEH.csv"     u 1:7:6 title "GAFEH"     with yerrorline lw 1.5 lt 1 lc 1 pt 12 ps 1, \
#	 "result_GAFEH_BAT.csv" u 1:7:6 title "GAFEH_ BAT" with yerrorline lw 1.5 lt 1 lc 3 pt 10 ps 1, \
#	 "result_GAFEH_SI.csv"  u 1:7:6 title "GAFEH_ SI"  with yerrorline lw 1.5 lt 1 lc 5 pt 8  ps 1, \
#	 "result_collect.csv"   u 1:7:6 title "Collect"   with yerrorline lw 1.5 lt 1 lc 7 pt 6  ps 1,

__EOF

