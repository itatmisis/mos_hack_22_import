import sqlite3
import pandas as pd

import models
from typing import List


class SQLighter:
    def __init__(self, database):
        self.connection = sqlite3.connect(database)
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
        self.connection.close()  # close the connection to the database

    def get_user(self, email, password):
        obj = self.cursor.execute(f"SELECT full_name FROM users WHERE email = '{email}' AND PASSWORD = '{password}'")
        if len(obj.fetchall()) == 0:
            return False, ''
        else:
            obj = self.cursor.execute(
                f"SELECT full_name FROM users WHERE email = '{email}' AND PASSWORD = '{password}'")
            name = obj.fetchall()[0][0]
            return True, name

    def is_user_registred(self, email):
        obj = self.cursor.execute(f"SELECT LOGIN FROM users WHERE email = '{email}'")
        if len(obj.fetchall()) == 0:
            return False
        else:
            return True

    def register_user(self, full_name, password, inn, company_name, country, company_type, email, position):
        self.cursor.execute(
            f"INSERT INTO users (full_name, password, inn, company_name, country, company_type, email, position) VALUES('{full_name}', '{password}', {inn}, '{company_name}', '{country}', '{company_type}', '{email}', '{position}')")
        self.connection.commit()

    def search_item(self, industry: str = "", moscow: bool = False, product_name: str = ""):
        """
        Search item in database
        :param industry: str
        :param moscow: str
        :param query: str
        :return: list
        """
        if moscow:
            a = self.select(
                f"SELECT * FROM full_products WHERE lower(industry) like '%{industry.lower()}%' AND lower(Productname) like '%{(product_name.lower())}%' AND lower(adress) like '%москва%'")
        else:
            a = self.select(f"SELECT * FROM full_products WHERE lower(industry) like '%{industry.lower()}%' AND Productname like '%{product_name.lower()}%'")

        return a

    def search_company(self, industry: str = "", moscow: bool = False, company_name: str = ""):
        """
        Search company in database
        :param industry: str
        :param moscow: str
        :param query: str
        :return: list
        """
        if moscow:
            a = self.select(
                f"SELECT * FROM orgs where lower(industry) like '%{industry.lower()}%' AND name like '%{company_name.lower()}%' and lower(adress) like '%москва%'")
        else:
            a = self.select(f"SELECT * FROM orgs where lower(industry) like '%{industry.lower()}%' AND name like '%{company_name.lower()}%'")

        return a

    # def search_company_text(self, moscow, query):
    #     """
    #     Search company in database
    #     :param industry: str
    #     :param moscow: str
    #     :param query: str
    #     :return: list
    #     """
    #
    #     inn = INN_finder('query')
    #
    #     top = ''
    #     num = len(inn)
    #     if num > 10:
    #         num = 10
    #
    #     for i in inn[:num]:
    #         top += i[0] + ','
    #
    #     db = SQLighter('../hack.db')
    #     a = db.select(f"SELECT * FROM orgs WHERE inn in ({top[:-1]})")
    #
    #     return a


def result_to_companies(answer: list) -> List[models.Company]:
    companies = []
    for r in companies:
        pass
    return companies


def result_to_items(answer: list) -> List[models.Item]:
    items = []
    for r in items:
        pass
    return items


def initialize_database_from_csv():
    con = sqlite3.connect("../data/hack.db")

    df = pd.read_csv('../data/postgres_hack_prods_wo_cat.csv')
    df['adress'] = df['adress'].str.lower()
    df['Productname'] = df['Productname'].str.lower()
    df['industry'] = df['industry'].str.lower()

    df.to_sql('full_products', con, if_exists='replace', index=False)

    df = pd.read_csv('../data/clear_orgs.csv')
    df['adress'] = df['adress'].str.lower()
    df['industry'] = df['industry'].str.lower()

    df.to_sql('orgs', con, if_exists='replace', index=False)


data_source = SQLighter('../data/hack.db')