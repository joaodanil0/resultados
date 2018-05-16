import pandas
import numpy

GAFEH = pandas.read_csv('result_GAFEH.csv')
GAFEH_BAT = pandas.read_csv('result_GAFEH_BAT.csv')
GAFEH_SI = pandas.read_csv('result_GAFEH_SI.csv')
collect = pandas.read_csv('result_collect.csv')

GAFEH_DN = pandas.read_csv('nos_mortos_GAFEH.csv')
GAFEH_BAT_DN = pandas.read_csv('nos_mortos_GAFEH_BAT.csv')
GAFEH_SI_DN = pandas.read_csv('nos_mortos_GAFEH_SI.csv')
collect_DN = pandas.read_csv('nos_mortos_collect.csv')

GAFEH_PD = pandas.read_csv('TxEntregaHora_GAFEH.csv')
GAFEH_BAT_PD = pandas.read_csv('TxEntregaHora_GAFEH_BAT.csv')
GAFEH_SI_PD = pandas.read_csv('TxEntregaHora_GAFEH_SI.csv')
collect_PD = pandas.read_csv('TxEntregaHora_collect.csv')


counter = 0
hour = 72
tic = 4

total_points = int(hour/tic) + 1

result_GAFEH = numpy.zeros((total_points,7))
result_GAFEH_BAT = numpy.zeros((total_points,7))
result_GAFEH_SI = numpy.zeros((total_points,7))
result_collect = numpy.zeros((total_points,7))

DN_GAFEH = numpy.zeros((total_points,3))
DN_GAFEH_BAT = numpy.zeros((total_points,3))
DN_GAFEH_SI = numpy.zeros((total_points,3))
DN_collect = numpy.zeros((total_points,3))

PD_GAFEH = numpy.zeros((total_points,3))
PD_GAFEH_BAT = numpy.zeros((total_points,3))
PD_GAFEH_SI = numpy.zeros((total_points,3))
PD_collect = numpy.zeros((total_points,3))


for i in range(0,hour,tic):
	result_GAFEH[counter] = GAFEH.loc[i]
	result_GAFEH_BAT[counter] = GAFEH_BAT.loc[i]
	result_GAFEH_SI[counter] = GAFEH_SI.loc[i]
	result_collect[counter] = collect.loc[i]
	
	DN_GAFEH[counter] = GAFEH_DN.loc[i]
	DN_GAFEH_BAT[counter] = GAFEH_BAT_DN.loc[i]
	DN_GAFEH_SI[counter] = GAFEH_SI_DN.loc[i]
	DN_collect[counter] = collect_DN.loc[i]
	
	PD_GAFEH[counter] = GAFEH_PD.loc[i]
	PD_GAFEH_BAT[counter] = GAFEH_BAT_PD.loc[i]
	PD_GAFEH_SI[counter] = GAFEH_SI_PD.loc[i]
	PD_collect[counter] = collect_PD.loc[i]
	counter += 1

result_GAFEH[counter] = GAFEH.loc[hour-1]
result_GAFEH_BAT[counter] = GAFEH_BAT.loc[hour-1]
result_GAFEH_SI[counter] = GAFEH_SI.loc[hour-1]
result_collect[counter] = collect.loc[hour-1]

DN_GAFEH[counter] = GAFEH_DN.loc[hour-1]
DN_GAFEH_BAT[counter] = GAFEH_BAT_DN.loc[hour-1]
DN_GAFEH_SI[counter] = GAFEH_SI_DN.loc[hour-1]
DN_collect[counter] = collect_DN.loc[hour-1]

PD_GAFEH[0] = GAFEH_PD.loc[1]
PD_GAFEH_BAT[0] = GAFEH_BAT_PD.loc[1]
PD_GAFEH_SI[0] = GAFEH_SI_PD.loc[1]
PD_collect[0] = collect_PD.loc[1]

PD_GAFEH[counter] = GAFEH_PD.loc[hour-1]
PD_GAFEH_BAT[counter] = GAFEH_BAT_PD.loc[hour-1]
PD_GAFEH_SI[counter] = GAFEH_SI_PD.loc[hour-1]
PD_collect[counter] = collect_PD.loc[hour-1]
	
data_GAFEH = {'Pacote de configuracao': result_GAFEH.T[:][1], 'Enviados por hora': result_GAFEH.T[:][2], 'Enviados+Configuracao': result_GAFEH.T[:][6],
			  'Std configuracao': result_GAFEH.T[:][3], 'Std enviados': result_GAFEH.T[:][4], 'Std env+confi': result_GAFEH.T[:][5],'Hora': result_GAFEH.T[:][0]}
			  
data_GAFEH_BAT = {'Pacote de configuracao': result_GAFEH_BAT.T[:][1], 'Enviados por hora': result_GAFEH_BAT.T[:][2], 'Enviados+Configuracao': result_GAFEH_BAT.T[:][6],
			  'Std configuracao': result_GAFEH_BAT.T[:][3], 'Std enviados': result_GAFEH_BAT.T[:][4], 'Std env+confi': result_GAFEH_BAT.T[:][5],'Hora': result_GAFEH_BAT.T[:][0]}
			  
data_GAFEH_SI = {'Pacote de configuracao': result_GAFEH_SI.T[:][1], 'Enviados por hora': result_GAFEH_SI.T[:][2], 'Enviados+Configuracao': result_GAFEH_SI.T[:][6],
			  'Std configuracao': result_GAFEH_SI.T[:][3], 'Std enviados': result_GAFEH_SI.T[:][4], 'Std env+confi': result_GAFEH_SI.T[:][5],'Hora': result_GAFEH_SI.T[:][0]}

data_collect = {'Pacote de configuracao': result_collect.T[:][1], 'Enviados por hora': result_collect.T[:][2], 'Enviados+Configuracao': result_collect.T[:][6],
			  'Std configuracao': result_collect.T[:][3], 'Std enviados': result_collect.T[:][4], 'Std env+confi': result_collect.T[:][5],'Hora': result_collect.T[:][0]}



data_DN_GAFEH = {'Hora' : DN_GAFEH.T[:][0], 'Desvio Padrao': DN_GAFEH.T[:][1], 'Media': DN_GAFEH.T[:][2]}
data_DN_GAFEH_BAT = {'Hora' : DN_GAFEH_BAT.T[:][0], 'Desvio Padrao': DN_GAFEH_BAT.T[:][1], 'Media': DN_GAFEH_BAT.T[:][2]}
data_DN_GAFEH_SI = {'Hora' : DN_GAFEH_SI.T[:][0], 'Desvio Padrao': DN_GAFEH_SI.T[:][1], 'Media': DN_GAFEH_SI.T[:][2]}
data_DN_collect = {'Hora' : DN_collect.T[:][0], 'Desvio Padrao': DN_collect.T[:][1], 'Media': DN_collect.T[:][2]}

data_PD_GAFEH = {'Hora' : PD_GAFEH.T[:][0], 'Desvio Padrao': PD_GAFEH.T[:][1], 'Media': PD_GAFEH.T[:][2]}
data_PD_GAFEH_BAT = {'Hora' : PD_GAFEH_BAT.T[:][0], 'Desvio Padrao': PD_GAFEH_BAT.T[:][1], 'Media': PD_GAFEH_BAT.T[:][2]}
data_PD_GAFEH_SI = {'Hora' : PD_GAFEH_SI.T[:][0], 'Desvio Padrao': PD_GAFEH_SI.T[:][1], 'Media': PD_GAFEH_SI.T[:][2]}
data_PD_collect = {'Hora' : PD_collect.T[:][0], 'Desvio Padrao': PD_collect.T[:][1], 'Media': PD_collect.T[:][2]}

data_GAFEH = pandas.DataFrame(data_GAFEH)
data_GAFEH_BAT = pandas.DataFrame(data_GAFEH_BAT)
data_GAFEH_SI = pandas.DataFrame(data_GAFEH_SI)
data_collect = pandas.DataFrame(data_collect)

data_DN_GAFEH = pandas.DataFrame(data_DN_GAFEH)
data_DN_GAFEH_BAT = pandas.DataFrame(data_DN_GAFEH_BAT)
data_DN_GAFEH_SI = pandas.DataFrame(data_DN_GAFEH_SI)
data_DN_collect = pandas.DataFrame(data_DN_collect)

data_PD_GAFEH = pandas.DataFrame(data_PD_GAFEH)
data_PD_GAFEH_BAT = pandas.DataFrame(data_PD_GAFEH_BAT)
data_PD_GAFEH_SI = pandas.DataFrame(data_PD_GAFEH_SI)
data_PD_collect = pandas.DataFrame(data_PD_collect)


data_GAFEH.to_csv('6~6/data_GAFEH.csv')
data_GAFEH_BAT.to_csv('6~6/data_GAFEH_BAT.csv')
data_GAFEH_SI.to_csv('6~6/data_GAFEH_SI.csv')
data_collect.to_csv('6~6/data_collect.csv')

data_DN_GAFEH.to_csv('6~6/data_DN_GAFEH.csv')
data_DN_GAFEH_BAT.to_csv('6~6/data_DN_GAFEH_BAT.csv')
data_DN_GAFEH_SI.to_csv('6~6/data_DN_GAFEH_SI.csv')
data_DN_collect.to_csv('6~6/data_DN_collect.csv')

data_PD_GAFEH.to_csv('6~6/data_PD_GAFEH.csv')
data_PD_GAFEH_BAT.to_csv('6~6/data_PD_GAFEH_BAT.csv')
data_PD_GAFEH_SI.to_csv('6~6/data_PD_GAFEH_SI.csv')
data_PD_collect.to_csv('6~6/data_PD_collect.csv')
