# Moscow City Hack 2022 - Сервис по сбору и анализу информации о продукции производителей Москвы для развития импортозамещения

Программное обеспечение для парсинга, обработки и анализа данных о промышленных компаниях и товарах в Российской Федерации. Особое внимание уделено отбору информации о компаниях и и товарах, расположенных в г. Москва.

## Стек

### Бэкенд
В качестве бэкенд-сервера используется FastAPI-сервер на языке Python. С целью хранения данных используется SQLite-реляционная база данных.\
Для поиска по товарам и поставщикам используется расстояние Левенштейна.

### Фронтенд


## Использование 
Клонирование репозитория\
``https://github.com/itatmisis/mos_hack_22_import ``

Для бэкенда:\
 ``pip install -r server/requirements.txt ``\
 ``cd server ``\
 ``python3 main,py ``

## Где смотреть? 

Протестировать поиск по товарам, компаниям, а также аналитические возможности платформы возможно по адресу http://moshack.itatmisis.ru/

Для связи: t.me/Daniil_Y
