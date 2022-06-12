import pandas as pd
from bs4 import BeautifulSoup
from googlesearch import search as g_search
import requests
import json
import re
import time
import pandas as pd
from tqdm import tqdm

from faker import Faker
fake = Faker(locale='ru') # Для генерации User-Agent

manufacturers_headers = {
    'User-Agent': fake.chrome(),
    'accept-language': 'en-US,en;q=0.9',
    'pragma': 'np-cache',
    'referer': 'http://manufacturers.ru/companies'
}

fns_headers = {
    'User-Agent': fake.chrome()
}

MANUFACTURERS_MAIN_URL = "http://manufacturers.ru"
MANUFACTURERS_COMPANIES_URL = "http://manufacturers.ru/companies"

FNS_URL = 'https://egrul.nalog.ru/'

GISP_GOV_ORGS_URL = 'https://gisp.gov.ru/opendata/files/gispdata-current-pp719-orgs-structure.csv'
GISP_GOV_PRODUCTS_URL = 'https://gisp.gov.ru/opendata/files/gispdata-current-pp719-orgs-structure.csv'


######### Manufacturers.ru Scrapping part

def parse_manufacturers_urls(max_pages: int = 100):
    companies_urls = []
    for i in tqdm(range(max_pages)):
        params = {'page': i}
        companies_answer = requests.get(MANUFACTURERS_COMPANIES_URL, headers=manufacturers_headers, params=params)
        soup = BeautifulSoup(companies_answer.text)
        companies = soup.find_all('div', {'class': 'sim-item'})
        for c in companies:
            try:
                companies_urls.append(MANUFACTURERS_MAIN_URL + c['about'])
            except KeyError:
                pass
        time.sleep(0.1)  # sleep for 100 ms


def _build_dict_from_block(rows):
    if rows is None:
        return dict()
    tr_rows = rows.find_all('tr')
    tuples = []
    for r in tr_rows:
        tuples.append([re.sub("\s\s+", " ", td.text.replace("\n", "").strip()) for td in r.findChildren('td')])
    return dict((x, y) for x, y in tuples)

def parse_manufacturers_company(company_url: str):

    c_info = requests.get(company_url, headers=manufacturers_headers)
    soup = BeautifulSoup(c_info.text)

    brand_info = soup.find('div', {'class': 'l-brand-block'})
    image_block = brand_info.find('img')

    all_info = soup.find('div', {'class': 'company-right-wrap'})
    about = all_info.find(id='about')

    description = {
        'Название': about.find('h1').text,
        'Описание': " ".join([p.text for p in about.find_all('p')]),
        'Источник': company_url
    }

    if image_block is not None:
        description['Brand-Image'] = MANUFACTURERS_MAIN_URL + image_block['src']

    category_block = all_info.find('div', id='category')
    categories = _build_dict_from_block(category_block)

    requisites_block = all_info.find('div', id='company')
    requisites = _build_dict_from_block(requisites_block)

    contacts_block = all_info.find('tbody', {'class': 'cont-tbody'})
    contacts = _build_dict_from_block(contacts_block)

    super_dict = {}
    for d in [description, categories, requisites, contacts]:
        for k, v in d.items():
            super_dict[k] = v

    return super_dict


def parse_manufacturers_companies(companies_urls: list):
    total_dicts = []
    for c_url in tqdm(companies_urls):
        total_dicts.append(c_url)
        time.sleep(0.1)
    return total_dicts


######### Sites info update

def update_site(company_name):
    """Search of actual website of company. Takes first link from Google, checking isn't it a wiki page."""
    a = list(g_search(company_name + 'официальный сайт', tld="ru", num=1, stop=5, pause=2))
    for site in a:
        if 'wiki' not in site:
            return site

    return a[0]


######### Ljcnfdfybt byajhvfwbb bp AYC

def req(url, INN, ts):
  params ={'vyp3CaptchaToken':'',
            'page':'',
            'query': INN,
            'region':'',
            'PreventChromeAutocomplete':''}
  res = ''
  # the delay time to prevent a captcha request
  time.sleep(ts)

  html_post = requests.post(url, data=params, headers=fns_headers).text
  res_post = json.loads(html_post)

  token =  res_post['t']
  new_url = url + 'search-result/' + token
  html_get = requests.get(new_url, headers=fns_headers).text
  res_get = json.loads(html_get)['rows']

  try:
    print(res_get[0]['a'])
  except:
    return ''
  #return res_post, res_get
  return res_get[0]['a']


######### LИнформация из GISP GOV по товарам и компаниям

def find_adresses(file_name):

    df = pd.read_excel(file_name)
    df['addres'] = [req(FNS_URL, x, 1) for x in df['ИНН']]

    df.to_excel('../data/task.xlsx')


def find_products():
    # Выгрузка данных минпромторг
    orgs = pd.read_csv(GISP_GOV_ORGS_URL)
    prods = pd.read_csv(GISP_GOV_PRODUCTS_URL)
    #
    # Выгрузка данных ММПП
    find_adresses('../data/reestr.xlsx')
    a = pd.read_excel('../data/task.xlsx')
    a.to_csv('../data/task.csv', index=False)

