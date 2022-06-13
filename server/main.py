import logging
import time
from typing import Callable

from starlette.middleware.cors import CORSMiddleware

import models

logging.basicConfig(format="%(asctime)s [%(name)s] - %(levelname)s: %(message)s", level=logging.INFO)

import uvicorn

from fastapi import APIRouter, FastAPI, Request, Response
from fastapi.routing import APIRoute

from database import data_source

import service

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

logger = logging.getLogger(__name__)


class TimedRoute(APIRoute):
    def get_route_handler(self) -> Callable:
        original_route_handler = super().get_route_handler()

        async def custom_route_handler(request: Request) -> Response:
            before = time.time()
            response: Response = await original_route_handler(request)
            duration = time.time() - before
            response.headers["X-Response-Time"] = str(duration)
            logger.info(f"route duration: {duration}")
            logger.info(f"route response: {response}")
            logger.info(f"route response headers: {response.headers}")
            return response

        return custom_route_handler


router = APIRouter(route_class=TimedRoute)


@app.post("/user/register", response_model=models.AuthorizationResult)
def create_user(user: models.User):
    return service.login_user(user)


@app.post("/user/login", response_model=models.AuthorizationResult)
def login_user(user: models.User):
    return service.login_user(user)


@app.post("/companies/search", response_model=models.CompaniesSearchResult)
def search_companies(search: models.Search):
    """"Контроллер для поиска компаний"""
    return service.find_companies(search)


@app.post("/items/search", response_model=models.ItemsSearchResult)
def search_items(search: models.Search):
    """"Контроллер для поиска товаров"""
    return service.find_items(search)


# @app.post("/items/add", response_model=models.SearchResult)
# def add_item(search: models.Search):
#     # TODO
#     return {'answer': 'ok'}
#
#
# @app.put("/items/update", response_model=models.SearchResult)
# def update_item(search: models.Search):
#     # TODO
#     return {'answer': 'ok'}
#
#
# @app.delete("/items/remove", response_model=models.SearchResult)
# def remove_item(search: models.Search):
#     # TODO
#     return {'answer': 'ok'}


@app.get("/check")
def ping():
    return {'status': 'ok'}


app.include_router(router)

if __name__ == "__main__":
    print(len(data_source.search_company(industry="Машиностроение")))
    print(data_source.search_item(industry="Машиностроение", moscow=True)[0])
    print(data_source.search_company(industry="Машиностроение", moscow=True)[0])
    uvicorn.run(app, host="0.0.0.0", port=8000)