#!/bin/bash

/usr/bin/gnuplot <<_EOF

set out  "fig6.eps"
set term postscript eps enhanced color

set xrange[0:1000]
set yrange[0:400]
set cbrange[120:7200]

set xtics 									font ",15"
set ytics 100								font ",15"
unset ztics
set cbtics 120, 1180, 7200					font ",15" offset -1,0


set ylabel "Solar Intensity (W/m^2)"  		font ",15" offset 0,0 
set xlabel "Battery (J)" 			font ",15" rotate parallel offset -5,0
set cblabel "Time between packets (s)" 			font ",12" offset -1,0
set size 0.5

set colorbox user size 0.02,0.2 origin 0.39,0.18
#set palette defined (0 'red', 1 'orange', 2 'yellow', 3 'green', 4 'blue')
set palette rgbformulae 33,13,10
set nokey
set hidden3d
set pm3d
set isosamples 100,100

set view 180, 90

maxEnv = 7200.0
minEnv = 120.0
maxBat = 1000.0
minBat = 0.0

maxInt = 400.0
minInt = 0.0

#media(x,y) = ((maxEnv - minEnv)*( ( (x - maxBat)/(minBat - maxBat) ) + ( (y - maxInt)/(minInt - maxInt) ) ) + 2*minEnv)/2

#splot media(x,y)

e = 0.85


#mediaK(x,y) = (maxEnv - minEnv)*( ((x - maxBat)/(minBat - maxBat))*e + ((y - maxInt)/(minInt - maxInt))*(1-e)) + minEnv

#splot mediaK(x,y)

BAT(x) = ((maxEnv - minEnv)/(minBat - maxBat))*(x - maxBat) + minEnv
SI(y) = ((maxEnv - minEnv)/(minInt - maxInt))*(y - maxInt) + minEnv

media_k(x,y) = BAT(x)*e + (1-e)*SI(y)
splot media_k(x,y)

_EOF
