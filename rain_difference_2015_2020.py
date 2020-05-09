tucson_rain = pd.read_csv(r"/Users/jennahonan/PycharmProjects/502/data/tucson_rain.txt", sep='\t')
flagstaff_rain = pd.read_csv(r"/Users/jennahonan/PycharmProjects/502/data/flagstaff_rain.txt", sep='\t')
split_data_tucson = tucson_rain['readingDate'].str.split('-')
split_data_flagstaff = flagstaff_rain['readingDate'].str.split('-')
dates_tucson = tucson_rain['readingDate'].str.split('-')
tucson_rain['year']=[dates_tucson[i][0] for i in dates_tucson.index]
tucson_rain['month']=[dates_tucson[i][1] for i in dates_tucson.index]
tucson_rain['day']=[dates_tucson[i][2] for i in dates_tucson.index]
dates_flagstaff = flagstaff_rain['readingDate'].str.split('-')
flagstaff_rain['year']=[dates_flagstaff[i][0] for i in dates_flagstaff.index]
flagstaff_rain['month']=[dates_flagstaff[i][1] for i in dates_flagstaff.index]
flagstaff_rain['day']=[dates_flagstaff[i][2] for i in dates_flagstaff.index]
tucson_rain.groupby(["year","month"],axis=0,as_index=True).sum().index.get_level_values(1).tolist()

flagstaff_rain.groupby(["year","month"],axis=0,as_index=True).sum().index.get_level_values(1).tolist()

tucson_rain.groupby(["year","month"],axis=0,as_index=True).sum().index.get_level_values(0).tolist()

flagstaff_rain.groupby(["year","month"],axis=0,as_index=True).sum().index.get_level_values(0).tolist()

rain_sum_tucson=tucson_rain.groupby(["year","month"],axis=0,as_index=True).sum()
rain_sum_flagstaff=flagstaff_rain.groupby(["year","month"],axis=0,as_index=True).sum()

df_tucson_year=tucson_rain.groupby(["year","month"],axis=0,as_index=True).sum().index.get_level_values(0).tolist()
df_tucson_month=tucson_rain.groupby(["year","month"],axis=0,as_index=True).sum().index.get_level_values(1).tolist()
df_tucson_rain=rain_sum_tucson['rainAmount'].tolist()
df_flagstaff_year=flagstaff_rain.groupby(["year","month"],axis=0,as_index=True).sum().index.get_level_values(0).tolist()
df_flagstaff_month=flagstaff_rain.groupby(["year","month"],axis=0,as_index=True).sum().index.get_level_values(1).tolist()
df_flagstaff_rain=rain_sum_flagstaff['rainAmount'].tolist()

df_tucson=pd.DataFrame({'year':df_tucson_year, 'month':df_tucson_month, 'tucson rain':df_tucson_rain})
df_flagstaff=pd.DataFrame({'flagstaff year':df_flagstaff_year, 'flagstaff month':df_flagstaff_month, 'flagstaff rain':df_flagstaff_rain})

df_tucson.insert(3, "flagstaff rain", df_flagstaff_rain)

df_tucson["difference"]=df_tucson["tucson rain"] - df_tucson["flagstaff rain"]

df_tucson.to_csv(r"/Users/jennahonan/PycharmProjects/502/data/rain_difference_2015_2020.txt", header=None, index=None, sep='\t', mode='a')
