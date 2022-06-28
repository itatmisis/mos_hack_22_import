from typing import List, Optional

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


class Company(BaseModel):
    id: int
    company_name: Optional[str]
    description: Optional[str]
    address: Optional[str]
    phone: Optional[str]
    email: Optional[str]
    brand_image: Optional[str]
    industry: Optional[str]
    category: Optional[str]
    subcategory: Optional[str]
    inn: Optional[str]
    ogrn: Optional[str]
    kpp: Optional[str]
    website: Optional[str]
    emp_num: Optional[str]
    official_name: Optional[str]
    registration_date: Optional[str]
    is_moscow: Optional[bool]


class Item(BaseModel):
    id: int
    name: str
    company: Optional[Company]
    address: Optional[str]
    industry: Optional[str]
    category: Optional[str]
    subcategory: Optional[str]
    is_moscow: Optional[bool]


class CompaniesSearchResult(BaseModel):
    companies: List[Company] = list()


class ItemsSearchResult(BaseModel):
    items: List[Item] = list()
    companies: List[Company] = list()
