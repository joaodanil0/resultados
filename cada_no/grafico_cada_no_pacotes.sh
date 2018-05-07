#!/bin/bash

/usr/bin/gnuplot <<__EOF

set term postscript eps enhanced color 
set out "Pcts_no_collect.eps"
set datafile separator ","

set xlabel "Coordinate X" font ",15" rotate parallel offset 0,-2
set ylabel "Coordinate Y" font ",15" rotate parallel offset 0,-2
set zlabel "packets sent" font ",15" rotate by 90 offset 0.1,0.1


#set xrange [0:132]
#set yrange [0:132]
#set zrange [0:4500]
#set cbrange [0:4500]

#set xtics 26 font ",15" offset 0,-0.3 
#set ytics 26 font ",15" offset 0,-0.3 
#set ztics 100, 1100, 4500 font ",15"
#set cbtics 100, 1100, 4500 font ",10"


set size 0.5
set view 61,72

set key off

unset surface
set pm3d
set dgrid3d


splot "result_media_GAFEH.csv" u 2:3:5
__EOF
