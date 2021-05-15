from datetime import datetime
import pandas as pd
import csv
import sys
import json
import numpy as np

def extract_time(json):
    try:
        # Also convert to int since update_time will be string.  When comparing
        # strings, "10" is smaller than "2".
        return int(json['timestamp'])
    except KeyError:
        return 0


with open('C:/Users/guazz/Desktop/JSON_Elab/1666014.json', 'r') as unordered, open('C:/Users/guazz/Desktop/JSON_Elab/out.json', 'a') as out:
	lines = []
	for line in unordered:
	    json_obj = json.loads(line)
	    lines.append(json_obj)
	lines.sort(key=extract_time)
	for li in lines:
		out.write(json.dumps(li))
		out.write('\n')
