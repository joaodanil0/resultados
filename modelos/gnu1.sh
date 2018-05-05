 
#!bin/bash

/usr/bin/gnuplot <<_EOF


set term postscript eps enhanced color
set out  "Modelo.eps"
set yrange [0:1200]
set xrange[0:24]
set ytics 200 font ",15"
set xtics 2 font ",15"

set key font ",15" at 24,1150
set ylabel "Intensidade Solar (W/m^2)" font ",15"
set xlabel "Tempo (H)" font ",15"
set size 0.5


set grid ytics mytics  
set mytics 1           
set grid               



#plot -1.5*x + 1800 title "Modelo 4" lw 3 lt 1 lc rgb "red"
plot (-27.778*x*x + 666.667*x - 3000.024)*0.75 t "Modelo 2" lw 3 lt 1 lc rgb "red"


_EOF
