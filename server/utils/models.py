from datetime import datetime
from enum import Enum
from re import I
from this import s
from typing import List
from click import IntRange

from pydantic import BaseModel

class User(BaseModel):
    email: str
    password: str
    inn: str
    company_name: str
    country: str
    company_type: str
    name: str
    position: str

class Feedback(BaseModel):
    text: str
    email: str

class Search(BaseModel):
    company: bool = False
    item: bool = True
    text: str
    inn: int
    ogrn: int
    location: str

class Company(BaseModel):
    company_name: str
    address: str
    phone: str
    email: str
    description: str
    brand_image: str
    industry: str
    category: str
    subcategory: str
    inn: int
    ogrn: int
    kpp: int 
    website: str
    vk: str
    year_founded: str
    emp_num: int
    official_name: int
    registration_date: datetime

class Item(BaseModel):
    name: str
    company_name: str
    address: str
    phone: str
    email: str

class SearchResult(BaseModel):
    result_size: int
    result_company: List[Company]
    result_item: List[Item]