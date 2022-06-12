import json
import time
import re
from fuzzywuzzy import fuzz


def INN_finder(request):
    # start_time = time.time()
    with open('../data/optimized.json') as json_file:
        dct = json.load(json_file)
    request = re.sub('[^a-z а-я0-9]', ' ', request.lower()).split(' ')
    request_full = ' '.join(request)
    results = []
    for key in dct.keys():
        data = dct[key].split(' ')
        metric = get_metric_of_acceptability(request, data)
        if (request_full in dct[key]):
            metric *= 2
        if metric > 2:
            results.append((key, metric))
    results = sorted(results, key=lambda x: x[1])
    # for i in results:
    #     if i[1] / results[0][1] > 0.5 or True:
    #         print(i[0], i[1] / results[-1][1])
    # print(f"Время поиска по {len(dct)} ссылкам заняло {int(time.time() - start_time)} секунд.")
    return results[::-1]


def get_metric_of_acceptability(request, data):
    results_temp = [sum([fuzz.ratio(x, y) > 70 for y in list(set(data))]) + 1 for x in request]
    metric = 1
    for i in results_temp:
        metric *= i
    return metric


if __name__ == "__main__":
    request = 'Шалавы'
    results = INN_finder(request)
    print(len(results), results)