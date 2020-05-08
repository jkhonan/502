#!/bin/bash

mkdir data
./rainlog_api_retrieval.py 20150101 20200101 --region BOX_FLAGSTAFF --out data/flagstaff_rain.txt
./rainlog_api_retrieval.py 20150101 20200101 --region BOX_TUCSON    --out data/tucson_rain.txt
