import pandas
import adress_get
import sqlite3

# Выгрузка данных минпромторг
#orgs = pd.read_csv('https://gisp.gov.ru/opendata/files/gispdata-current-pp719-orgs-structure.csv')
#prods = pd.read_csv('https://gisp.gov.ru/opendata/files/gispdata-current-pp719-products-structure.csv')

# Выгрузка данных ММПП
#adress_get.find_adresses('reestr.xlsx', 'task.xlsx')
#a = pd.read_excel('task.xlsx')
#a.to_csv('task.csv', index=False)

#Загружаем данные в БД
con = sqlite3.connect("../hack.db")
df = pandas.read_csv('postgres_hack_prods_wo_cat.csv')
df['adress'] = df['adress'].str.lower()
df['Productname'] = df['Productname'].str.lower()
df['industry'] = df['industry'].str.lower()

df.to_sql('full_products', con, if_exists='replace', index=False)

df = pandas.read_csv('clear_orgs.csv')
df['adress'] = df['adress'].str.lower()
df['industry'] = df['industry'].str.lower()

df.to_sql('orgs', con, if_exists='replace', index=False)
