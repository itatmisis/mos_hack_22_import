import csv, sqlite3
import pandas
import sys
#sys.path.append('../server')
from models import Item
from models import Company
from word_finder import INN_finder

class SQLighter:
    def __init__(self):
        self.connection = sqlite3.connect('../hack.db')
        self.cursor = self.connection.cursor()

    def execute(self, sql_query, args=None):
        if args is None:
            self.cursor.execute(sql_query)
        else:
            self.cursor.execute(sql_query, args)
        self.connection.commit()

    def select(self, sql_query, args=None):
        self.execute(sql_query, args)
        return self.cursor.fetchall()

    def close(self):
        self.connection.close() # close the connection to the database
    
def search_item(industry, moscow, query):
    """
    Search item in database
    :param industry: str
    :param moscow: str
    :param query: str
    :return: list
    """
    db = SQLighter()
    if moscow:
        a = db.select(f"SELECT * FROM full_products WHERE lower(industry) like '%{industry}%' AND lower(Productname) like '%{(query)}%' AND lower(adress) like '%москва%'")

        #a = db.select(f"SELECT * FROM full_products WHERE lower(industry) like '%{industry}%' AND lower(adress) like 'москва' AND lower(Productname) like '%{(query)}%'")
    else:
        a = db.select(f"SELECT * FROM full_products WHERE industry like '%{industry}%' AND Productname like '%{query}%'")
    #return a

    return [Item.parse_obj(item) for item in a]

def search_company(moscow, query):
    """
    Search company in database
    :param industry: str
    :param moscow: str
    :param query: str
    :return: list
    """

    inn = INN_finder('query')

    return inn
    db = SQLighter()
    
    # if moscow:
    #     a = db.select(f"SELECT * FROM full_products WHERE lower(industry) like '%{industry}%' AND lower(Companyname) like '%{(query)}%' AND lower(adress) like '%москва%'")
    # else:
    #     a = db.select(f"SELECT * FROM orgs WHERE industry like '%{industry}%' AND Companyname like '%{query}%'")

    # return [Company.parse_obj(comp) for comp in a]

#print(search_item('хим', True, ''))

print(search_company(True,  'лакокрасочные материалы'))