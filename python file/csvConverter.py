import pandas as pd
import csv
import sys
import json
from datetime import datetime
#pd.read_json('data1Puliti.json', lines=True).to_csv('data1Puliti.csv')
#i think is ok  C:/Users/guazz/Desktop/provaprogramma/16474724_nuovo_formattato_dataCambiata_NOERROR.json
data = []
with open('12001626_quad1_2019_formattato_dataCambiata_NOERROR_abuf.json','r') as f:
    for line in f:
        data.append(json.loads(line))
print("step 1 fatto. dati caricati")

data = pd.json_normalize(data)
print("step 2 fatto normalizzato")
#for i in range(len(data)):
#	data.timestamp[i] = datetime.fromtimestamp(int(data.timestamp[i])).strftime('%Y-%m-%d %H:%M:%S')
#	print(i)
#print("step 3 fatto convertite le date")
#rs = data.to_csv
#print (rs)
print("creo csv")
data.to_csv(r'C:/Users/guazz/Desktop/JSON_Elab/12001626_quad1_2019_formattato_dataCambiata_NOERROR_abuf.csv')
print("fatto csv")

#va ma per file piccoli. se son file grandi chiaramente ciclare per 10.000000 righe è troppo lento. tolto il discorso timestamp viaggia come una palla.