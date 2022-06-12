from dataclasses import dataclass
from datetime import datetime
from typing import List

from pydantic import BaseModel


class User(BaseModel):
    email: str
    password: str
    moderator: bool = False


class AuthorizationResult(BaseModel):
    is_ok: bool = False
    error: str = ""


class Search(BaseModel):
    text: str = ""
    is_moscow: bool = False
    category: int = -1


class Item(BaseModel):
    id: int
    name: str
    address: str
    industry: str
    category: str
    subcategory: str
    is_moscow: bool


class Company(BaseModel):
    id: int
    company_name: str
    description: str
    address: str
    phone: str
    email: str
    brand_image: str
    industry: str
    category: str
    subcategory: str
    inn: int
    ogrn: int
    kpp: int
    website: str
    emp_num: int
    official_name: int
    registration_date: str
    is_moscow: bool


class CompaniesSearchResult(BaseModel):
    companies: List[Company] = list()


class ItemsSearchResult(BaseModel):
    items: List[Item] = list()
    companies_names: List[str] = list()
