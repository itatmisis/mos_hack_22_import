from operator import contains
from googlesearch import search


def update_site(company_name):
    """Search of actual website of company. Takes first link from Google, checking isn't it a wiki page."""
    a = list(search(company_name +'официальный сайт', tld="ru", num=1, stop=5, pause=2))
    for site in a:
        if 'wiki' not in site:
            return site
    
    return a[0]

#print(update_site('АО "РТИ"'))
