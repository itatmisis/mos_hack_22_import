from fastapi import FastAPI
from SQLighter import *

app = FastAPI(title='Hack')


def get_db():
    db = SQLighter('hack.db')
    return db


@app.get("/")
async def root():
    return {"message": "Hello World"}


@app.get("/login/")
async def login(email: str, password: str):
    db_worker = get_db()

    is_registred = db_worker.get_user(email, password)

    result = {"registred": is_registred}
    db_worker.close()
    return result


@app.get("/register/")
async def register(name: str, password: str, inn: str, company_name: str, country: str, company_type: str, email: str,
                   position: str):
    db_worker = get_db()
    print(123)
    is_registred = db_worker.is_user_registred(email)

    if is_registred:
        result = {"registred": is_registred, "message": "User already registred"}
    else:
        db_worker.register_user(name, password, inn, company_name, country, company_type, email, position)
        result = {"registred": is_registred, "message": "User registered", "email": email}
    db_worker.close()
    return result


@app.get("/feedback/")
async def read_coords(user_id: int, text: str):
    db_worker = SQLighter("parking.db")
    db_worker.insert_feedback(user_id, text)
    db_worker.close()


# TODO: add parameters for filters
@app.get('search')
async def search(search: str):
    db_worker = get_db()
    result = db_worker.search(search)
    db_worker.close()
    return result


@app.get('get_product')
async def get_product(product_id: int):
    db_worker = get_db()
    result = db_worker.get_product(product_id)
    db_worker.close()
    return result


@app.get('get_similar_products')
async def get_similar_products(product_id: int):
    db_worker = get_db()
    result = db_worker.get_similar_products(product_id)
    db_worker.close()
    return result


@app.get('add_product')
async def add_product(product_id: int, product_name: str, product_price: int, product_description: str):
    db_worker = get_db()
    result = db_worker.add_product(product_id, product_name, product_price, product_description)
    db_worker.close()
    return result


@app.get('get_requests')
async def get_requests(t):
    db_worker = get_db()
    result = db_worker.get_requests()
    db_worker.close()
    return result


@app.get('approve_request')
async def approve_request(request_id: int):
    db_worker = get_db()
    result = db_worker.approve_request(request_id)
    db_worker.close()
    return result


@app.get('cancel_request')
async def cancel_request(request_id: int, reason: str):
    db_worker = get_db()
    result = db_worker.cancel_request(request_id, reason)
    db_worker.close()
    return result


@app.get('edit_request')
async def edit_request(request_id: int):
    db_worker = get_db()
    result = db_worker.edit_request(request_id)
    db_worker.close()
    return result


@app.get('get_cancel_requests')
async def get_cancel_requests(t):
    db_worker = get_db()
    result = db_worker.get_cancel_requests()
    db_worker.close()
    return result


@app.get('delete_request')
async def delete_request(request_id: int):
    db_worker = get_db()
    result = db_worker.delete_request(request_id)
    db_worker.close()
    return result


@app.get('get_requests_by_user')
async def get_requests_by_user(user_id: int):
    db_worker = get_db()
    result = db_worker.get_requests_by_user(user_id)
    db_worker.close()
    return result
