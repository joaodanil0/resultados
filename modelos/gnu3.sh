#!/bin/bash

/usr/bin/gnuplot <<_EOF

set out  "fig5.eps"
set term postscript eps enhanced color

set xrange[0:1000]
set yrange[0:1000]
set cbrange[120:7200]

set xtics font ",15"
set ytics font ",15"
unset ztics
#set cbtics 300, 300, 1800 font ",15" offset -1,0


set ylabel "Energia da bateria (J)"  offset 0,0 font ",15"
set xlabel "Intensidade Solar (W/m^2)" font ",15" rotate parallel offset -5,0
set cblabel "Tempo entre pacotes (s)" font ",12" offset -1,0
set size 0.5

set colorbox user size 0.02,0.2 origin 0.39,0.18
#set palette defined (0 'green', 1 'yellow', 2 'red', 3 'purple', 4 'orange', 5 'black')
set nokey
set hidden3d
set pm3d
set isosamples 100,100

set view 180, 90

#splot (1500*(-((x-1000)/(1000)) - ((y-1000)/(1000))) + 600)/2
#splot (1500 * ((x*1.9 - 1000)/-1000 + (y/10- 1000)/-1000) + 2 * 300)/2
splot -0.00708*(x**2+y**2) + 7200


_EOF
