import logging
import re
import models

from fuzzywuzzy import process

from database import data_source

logger = logging.getLogger(__name__)

industries = ['Металлургия', 'Лесная промышленность', 'Машиностроение', 'Химическая промышленность', 'Прочее производство', 'Легкая промышленность', 'Электронная и электротехническая промышленность', 'Коммунальное хозяйство и электроэнергетика', 'Сельское хозяйство', 'Промышленность строительных материалов', 'Медицинская промышленность',
              'Пищевая промышленность', 'Транспортное машиностроение', 'Нефтегазовая промышленность', 'Судостроение', 'Авиационная промышленность', 'Горная промышленность', 'Космическая промышленность', 'Оборонно-промышленный комплекс', 'Ювелирная промышленность']

industries = {idx: el for idx, el in enumerate(industries)}


def _clear_string(text: str) -> str:
    return re.sub(r"\s\s+", " ", text.lower().strip())


def find_items(search: models.Search) -> models.ItemsSearchResult:
    result = models.ItemsSearchResult()
    query = _clear_string(search.text)

    industry = industries[search.category] if search.category > 0 else ""

    found_items = data_source.search_item(industry, moscow=search.is_moscow)
    found_items_names = [_clear_string(i.name) for i in found_items]

    choices_dict = {idx: el for idx, el in enumerate(found_items_names)}
    search_result = process.extract(query, choices_dict, limit=20)
    logger.info(search_result)
    indexes = [i[-1] for i in search_result]

    found_items = list(map(found_items.__getitem__, indexes))
    result.items = found_items

    result.companies_names = [i.company_name for i in found_items]

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
