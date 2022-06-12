from models import Item
from models import Company
from word_finder import INN_finder
from SQLighter import SQLighter

def search_item(industry, moscow, query):
    """
    Search item in database
    :param industry: str
    :param moscow: str
    :param query: str
    :return: list
    """
    db = SQLighter('../hack.db')
    if moscow:
        a = db.select(f"SELECT * FROM full_products WHERE lower(industry) like '%{industry}%' AND lower(Productname) like '%{(query)}%' AND lower(adress) like '%москва%'")

        #a = db.select(f"SELECT * FROM full_products WHERE lower(industry) like '%{industry}%' AND lower(adress) like 'москва' AND lower(Productname) like '%{(query)}%'")
    else:
        a = db.select(f"SELECT * FROM full_products WHERE industry like '%{industry}%' AND Productname like '%{query}%'")
    #return a

    return [Item.parse_obj(item) for item in a]

def search_company_text(moscow, query):
    """
    Search company in database
    :param industry: str
    :param moscow: str
    :param query: str
    :return: list
    """

    inn = INN_finder('query')

    top = ''
    num = len(inn)
    if num > 10:
        num = 10
    
    for i in inn[:num]:
        top+=i[0]+','

    db = SQLighter('../hack.db')
    a = db.select(f"SELECT * FROM orgs WHERE inn in ({top[:-1]})")

    return a

def search_company(industry, moscow, query):
    """
    Search company in database
    :param industry: str
    :param moscow: str
    :param query: str
    :return: list
    """
    db = SQLighter('../hack.db')
    if moscow:
        a = db.select(f"SELECT * FROM orgs where industry like '%{industry}%' AND descr like '%{query}%' and lower(adress) like '%москва%' limit 10")
    else:
        a = db.select(f"SELECT * FROM orgs where industry like '%{industry}%' AND descr like '%{query}%' limit 10")
    return a
#print(search_item('хим', True, ''))

#print(search_company(True,  'лакокрасочные материалы'))

#print(search_company('хим', True, ''))