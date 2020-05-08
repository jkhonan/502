# BE 502 Final Project

Under the supervision of Dr. Haiquan Li.

**Group 2** Jenna Honan, Jorge Ramos, Qianying He, Kai Blumberg

See our [Report here](https://docs.google.com/document/d/1CnFWl8Kjo7gy4PdclWB6YrTiREp_fqwqDyUgAHnzyIk/edit?usp=sharing)

Data pull from [rainlog.org](https://rainlog.org/map).

## Scripts

[generate_data.sh](https://github.com/jkhonan/502/blob/master/generate_data.sh) Shell script to call the rainlog_api_retrieval.py file to retrieve the rain data. Script specifies rain data from both Tucson and Flagstaff from January 01 2015 till January 01 2020.

[rainlog_api_retrieval.py](https://github.com/jkhonan/502/blob/master/rainlog_api_retrieval.py) Python script to call the rainlog.org api and retrieve rain data.

## Note to editors

Data files are available from the [data](https://github.com/jkhonan/502/tree/master/data) folder. Both scripts are tab delimited and are ready for use in your analyses. Everyone please create at least one new R or Python script(s) in the home directory for your analysis. Please modify this file with a little description of the script in the *Scripts* section above. Go to town and enjoy!
