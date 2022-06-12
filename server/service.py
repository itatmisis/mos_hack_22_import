import sqlite3

from googlesearch import search as g_search
import models
import pandas

from database import data_source


def find_items(search: models.Search) -> models.ItemsSearchResult:
    result = models.ItemsSearchResult()

    return result


def find_companies(search: models.Search) -> models.CompaniesSearchResult:
    result = models.CompaniesSearchResult()
    return result


def register_user(user: models.User) -> models.AuthorizationResult:
    result = models.AuthorizationResult()
    if data_source.is_user_registred(user.email):
        result.is_ok = False
        result.error = "Already registered"
    else:
        data_source.register_user(user.email, user.password, None, None, None, None, None)
        result.is_ok = True

    return result


def login_user(user: models.User) -> models.AuthorizationResult:
    result = models.AuthorizationResult()
    return result
