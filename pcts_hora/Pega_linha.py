import pandas
import numpy

GAFEH = pandas.read_csv('result_GAFEH.csv')
GAFEH_BAT = pandas.read_csv('result_GAFEH_BAT.csv')
GAFEH_SI = pandas.read_csv('result_GAFEH_SI.csv')
collect = pandas.read_csv('result_collect.csv')

result_GAFEH = numpy.zeros((17,7))
result_GAFEH_BAT = numpy.zeros((17,7))
result_GAFEH_SI = numpy.zeros((17,7))
result_collect = numpy.zeros((17,7))

counter = 0
for i in range(0,96,6):
	result_GAFEH[counter] = GAFEH.loc[i]
	result_GAFEH_BAT[counter] = GAFEH_BAT.loc[i]
	result_GAFEH_SI[counter] = GAFEH_SI.loc[i]
	result_collect[counter] = collect.loc[i]
	counter += 1

result_GAFEH[16] = GAFEH.loc[95]
result_GAFEH_BAT[16] = GAFEH_BAT.loc[95]
result_GAFEH_SI[16] = GAFEH_SI.loc[95]
result_collect[16] = collect.loc[95]
	
data_GAFEH = {'Pacote de configuracao': result_GAFEH.T[:][1], 'Enviados por hora': result_GAFEH.T[:][2], 'Enviados+Configuracao': result_GAFEH.T[:][6],
			  'Std configuracao': result_GAFEH.T[:][3], 'Std enviados': result_GAFEH.T[:][4], 'Std env+confi': result_GAFEH.T[:][5],'Hora': result_GAFEH.T[:][0]}
			  
data_GAFEH_BAT = {'Pacote de configuracao': result_GAFEH_BAT.T[:][1], 'Enviados por hora': result_GAFEH_BAT.T[:][2], 'Enviados+Configuracao': result_GAFEH_BAT.T[:][6],
			  'Std configuracao': result_GAFEH_BAT.T[:][3], 'Std enviados': result_GAFEH_BAT.T[:][4], 'Std env+confi': result_GAFEH_BAT.T[:][5],'Hora': result_GAFEH_BAT.T[:][0]}
			  
data_GAFEH_SI = {'Pacote de configuracao': result_GAFEH_SI.T[:][1], 'Enviados por hora': result_GAFEH_SI.T[:][2], 'Enviados+Configuracao': result_GAFEH_SI.T[:][6],
			  'Std configuracao': result_GAFEH_SI.T[:][3], 'Std enviados': result_GAFEH_SI.T[:][4], 'Std env+confi': result_GAFEH_SI.T[:][5],'Hora': result_GAFEH_SI.T[:][0]}

data_collect = {'Pacote de configuracao': result_collect.T[:][1], 'Enviados por hora': result_collect.T[:][2], 'Enviados+Configuracao': result_collect.T[:][6],
			  'Std configuracao': result_collect.T[:][3], 'Std enviados': result_collect.T[:][4], 'Std env+confi': result_collect.T[:][5],'Hora': result_collect.T[:][0]}

data_GAFEH = pandas.DataFrame(data_GAFEH)
data_GAFEH_BAT = pandas.DataFrame(data_GAFEH_BAT)
data_GAFEH_SI = pandas.DataFrame(data_GAFEH_SI)
data_collect = pandas.DataFrame(data_collect)

data_GAFEH.to_csv('data_GAFEH.csv')
data_GAFEH_BAT.to_csv('data_GAFEH_BAT.csv')
data_GAFEH_SI.to_csv('data_GAFEH_SI.csv')
data_collect.to_csv('data_collect.csv')
