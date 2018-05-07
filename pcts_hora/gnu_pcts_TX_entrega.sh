#!/bin/bash

/usr/bin/gnuplot <<__EOF

set term postscript eps enhanced color 
set out "Delivered packets.eps"
set datafile separator ","

set xlabel "Time (H)" font ",15"
set ylabel "Delivered packets (%)" font ",15"

set yrange [60:130]
set xrange [24:48]
set xtics 24 font ",15"
#set ytics 6 font ",15"

set key font ",15" right top
set size 0.5

set grid ytics
set grid xtics

plot "TxEntregaHora_GAFEH.csv"     u 1:3:2 title "GAFEH"     with yerrorline lw 1.5 lt 1 lc 1 pt 10 ps 1, \
	 "TxEntregaHora_GAFEH_BAT.csv" u 1:3:2 title "GAFEH BAT" with yerrorline lw 1.5 lt 1 lc 3 pt 12 ps 1, \
	 "TxEntregaHora_GAFEH_SI.csv"  u 1:3:2 title "GAFEH SI"  with yerrorline lw 1.5 lt 1 lc 5 pt 14 ps 1, \
	 "TxEntregaHora_collect.csv"   u 1:3:2 title "collect"   with yerrorline lw 1.5 lt 1 lc 7 pt 16 ps 1
__EOF

