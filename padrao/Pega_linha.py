import pandas
import numpy

GAFEH = pandas.read_csv('result_GAFEH.csv')
GAFEH_BAT = pandas.read_csv('result_GAFEH_BAT.csv')
GAFEH_SI = pandas.read_csv('result_GAFEH_SI.csv')
collect = pandas.read_csv('result_collect.csv')


counter = 0
hour = 72
tic = 4

total_points = int(hour/tic) + 1

result_GAFEH = numpy.zeros((total_points,3))
result_GAFEH_BAT = numpy.zeros((total_points,3))
result_GAFEH_SI = numpy.zeros((total_points,3))
result_collect = numpy.zeros((total_points,3))


for i in range(0,hour,tic):
	result_GAFEH[counter] = GAFEH.loc[i]
	result_GAFEH_BAT[counter] = GAFEH_BAT.loc[i]
	result_GAFEH_SI[counter] = GAFEH_SI.loc[i]
	result_collect[counter] = collect.loc[i]
	counter += 1

result_GAFEH[counter] = GAFEH.loc[hour-1]
result_GAFEH_BAT[counter] = GAFEH_BAT.loc[hour-1]
result_GAFEH_SI[counter] = GAFEH_SI.loc[hour-1]
result_collect[counter] = collect.loc[hour-1]
	
data_GAFEH = {'Media': result_GAFEH.T[:][2], 'Desvio padrao': result_GAFEH.T[:][1], 'Hora': result_GAFEH.T[:][0]}
data_GAFEH_BAT = {'Media': result_GAFEH_BAT.T[:][2], 'Desvio padrao': result_GAFEH_BAT.T[:][1], 'Hora': result_GAFEH_BAT.T[:][0]}
data_GAFEH_SI = {'Media': result_GAFEH_SI.T[:][2], 'Desvio padrao': result_GAFEH_SI.T[:][1], 'Hora': result_GAFEH_SI.T[:][0]}
data_collect = {'Media': result_collect.T[:][2], 'Desvio padrao': result_collect.T[:][1], 'Hora': result_collect.T[:][0]}

data_GAFEH = pandas.DataFrame(data_GAFEH)
data_GAFEH_BAT = pandas.DataFrame(data_GAFEH_BAT)
data_GAFEH_SI = pandas.DataFrame(data_GAFEH_SI)
data_collect = pandas.DataFrame(data_collect)

data_GAFEH.to_csv('6~6/data_GAFEH.csv')
data_GAFEH_BAT.to_csv('6~6/data_GAFEH_BAT.csv')
data_GAFEH_SI.to_csv('6~6/data_GAFEH_SI.csv')
data_collect.to_csv('6~6/data_collect.csv')
