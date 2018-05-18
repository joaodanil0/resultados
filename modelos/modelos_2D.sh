#!/bin/bash

/usr/bin/gnuplot <<_EOF


set term postscript eps enhanced color
set out  "fig1.eps"
set yrange [0:1200]
set xrange [0:24]
#set ytics 120,1000,7200					font ",15"
set xtics 2 								font ",15"

set key 									font ",15" right top
set ylabel "Solar Intensity (W/m^2)"		font ",15"
set xlabel "Time (H)"			 		font ",15"
set size 0.5


set grid ytics mytics  
set mytics 1           
set grid               

maxEnv = 7200.0
minEnv = 120.0
maxBat = 1000.0
minBat = 0.0

maxInt = 400.0
minInt = 0.0

BAT(x) = ((maxEnv - minEnv)/(minBat - maxBat))*(x - maxBat) + minEnv
SI(x) = ((maxEnv - minEnv)/(minInt - maxInt))*(x - maxInt) + minEnv

plot (-27.778*x*x + 666.667*x - 3000.024) 		t "Model 1" lw 3 lt 1 lc rgb "red"		# Modelo 1
#plot (-27.778*x*x + 666.667*x - 3000.024)*0.4 	t "Model 2" lw 3 lt 1 lc rgb "red"		# Modelo 2

#plot BAT(x)			 						t "Model 3" lw 3 lt 1 lc rgb "red"		# Modelo 3
#plot SI(x)										t "Model 4" lw 3 lt 1 lc rgb "red"		# Modelo 4

_EOF
