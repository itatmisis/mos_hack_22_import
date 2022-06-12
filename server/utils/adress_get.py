#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from logging import error
import re
import requests
import pandas as pd
import json 
import time

# define Python user-defined exceptions
class Error(Exception):
  """Base class for other exceptions"""
  pass

class CaptchaRequired(Error):
  """Raised when the captcha is required"""
  pass

class DataNotAvailable(Error):
  """Raised when data are not available"""


# request to site
def req(url, INN, ts):
  headers = {'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36'}
  params ={'vyp3CaptchaToken':'',
            'page':'',
            'query': INN,
            'region':'',
            'PreventChromeAutocomplete':''}
  res = ''
  # the delay time to prevent a captcha request
  time.sleep(ts)

  html_post = requests.post(url, data=params, headers=headers).text
  res_post = json.loads(html_post)

  token =  res_post['t']
  new_url = url + 'search-result/' + token
  html_get = requests.get(new_url, headers=headers).text 
  res_get = json.loads(html_get)['rows']

  try:
    print(res_get[0]['a'])
  except:
    return ''
  #return res_post, res_get
  return res_get[0]['a']

  
  

if __name__ == "__main__":

    df = pd.read_excel('reestr.xlsx')
    url = 'https://egrul.nalog.ru/'

    #print(req(url, 7718160370))
    #df['addres'] = req(url, df['ИНН'], 10)[1][0]['a']

    df['addres'] = [req(url, x, 1) for x in df['ИНН']]

    df.to_excel('task.xlsx')


