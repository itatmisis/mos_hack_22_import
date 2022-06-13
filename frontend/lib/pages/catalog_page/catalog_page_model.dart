import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class DataItem {
  int id;
  String name, address, industry, category, subcategory, company_name;

  String inn = '';
  bool is_moscow;

  DataItem({
    required this.id,
    required this.name,
    required this.address,
    required this.industry,
    required this.category,
    required this.subcategory,
    required this.is_moscow,
    required this.company_name
  });

  List<String> get specs {
    return [
      'Номер',
      'Название', 'Адрес', 'Отрасль', 'Категория', 'Подкатегория', 'Название компании'
    ];
  }

  List<String> get items {
    return [
      id.toString(),
      name, address, industry, category, subcategory, company_name
    ];
  }
}
class CompanyItem {
  int id;
  String oficcial_name, company_name, description, address, phone, email,
  brand_image, industry, category, subcategory, website, registration_date,
  inn, ogrn, kpp,emp_num;

  CompanyItem({
    required this.id,
    required this.inn,
    required this.ogrn,
    required this.kpp,
    required this.emp_num,
    required this.oficcial_name,
    required this.company_name,
    required this.description,
    required this.address,
    required this.phone,
    required this.email,
    required this.brand_image,
    required this.industry,
    required this.category,
    required this.subcategory,
    required this.website,
    required this.registration_date
});

  List<String> get specs {
    return [
      'Номер',
      'Оф. название', 'Название', 'Описание', 'Адрес', 'Номер', 'Почта', 'Картинка', 'Отрасль', 'Категория', 'Подкатегория', 'Сайт', 'Дата регистрации', 'ИНН', 'ОГРН', 'КПП', 'ЕМП'
    ];
  }

  List<String> get items {
    return [
      id.toString(),
      oficcial_name, company_name, description, address, phone, email,
      brand_image, industry, category, subcategory, website, registration_date,
      inn, ogrn, kpp,emp_num
    ];
  }
}



class SearchConnection{
  int proccessState = -1;

  List data = [];
  List company = [];
  List<String> companyNames = [];

  SearchConnection.empty() {proccessState = -1;}
  SearchConnection.inProcess() {proccessState = 1;}
  SearchConnection.ready(this.data, this.company) {proccessState = 2;}
}

class CatalogPageModel extends ChangeNotifier {
  int _currentPage = 3;

  late DataItem activeId;
  late CompanyItem activeCompany;

  bool _superSearch = false;

  int _category = 0;

  int get category => _category;

  set category(int value) {
    _category = value;
    notifyListeners();
  }

  bool get superSearch => _superSearch;

  set superSearch(bool value) {
    _superSearch = value;
    notifyListeners();
  }

  SearchConnection _connection = SearchConnection.empty();

  SearchConnection get connection => _connection;

  set connection(SearchConnection value) {
    _connection = value;
    notifyListeners();
  }

  int get currentPage => _currentPage;

  set currentPage(int value) {
    _currentPage = value;
    notifyListeners();
  }


  void search(String text, bool is_moscow, [ int category = -1]) async {
    connection = SearchConnection.inProcess();
    connection = await getFromServer(text, is_moscow, category);
  }

  Future<SearchConnection> getFromServer(String text, bool is_moscow, int category) async {
    var responseItems = await post(
        Uri.parse('http://moshack.itatmisis.ru/items/search'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'text':text, 'is_moscow': is_moscow, 'category': category}));

    var responseCompanies = await post(
        Uri.parse('http://moshack.itatmisis.ru/companies/search'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'text':text, 'is_moscow': is_moscow, 'category': category}));

    var encodedItems = json.decode(utf8.decode(responseItems.body.codeUnits));
    var encodedCompanies = json.decode(utf8.decode(responseCompanies.body.codeUnits));

    List<DataItem> items = List.generate(50, (index) =>
        DataItem(
            id: encodedItems['items'][index]['id'],
            name: encodedItems['items'][index]['name'],
            address: encodedItems['items'][index]['address'],
            industry: encodedItems['items'][index]['industry'],
            category: encodedItems['items'][index]['category'],
            subcategory: encodedItems['items'][index]['subcategory'],
            is_moscow: encodedItems['items'][index]['is_moscow'],
          company_name: encodedItems['items'][index]['company_name']
        )
    );

    print(encodedCompanies);

    List<CompanyItem> company = List.generate(50, (index) =>
        CompanyItem(
            id: encodedCompanies['companies'][index]['id']?? 0,
            inn: encodedCompanies['companies'][index]['inn']?? '',
            ogrn: encodedCompanies['companies'][index]['ogrn']?? '',
            kpp: encodedCompanies['companies'][index]['kpp']?? '',
            emp_num: encodedCompanies['companies'][index]['emp_num']?? '',
            oficcial_name: encodedCompanies['companies'][index]['official_name']?? '',
            company_name: encodedCompanies['companies'][index]['company_name']?? '',
            description: (encodedCompanies['companies'][index]['description']?? '').toString().length > 70? (encodedCompanies['companies'][index]['description']?? '').toString().substring(0, 70) + '...' : (encodedCompanies['companies'][index]['description']?? ''),
            address: encodedCompanies['companies'][index]['address']?? '',
            phone: encodedCompanies['companies'][index]['phone']?? '',
            email: encodedCompanies['companies'][index]['email']?? '',
            brand_image: encodedCompanies['companies'][index]['brand_image']?? '',
            industry: encodedCompanies['companies'][index]['industry']?? '',
            category: encodedCompanies['companies'][index]['category']?? '',
            subcategory: encodedCompanies['companies'][index]['subcategory']?? '',
            website: encodedCompanies['companies'][index]['website']?? '',
            registration_date: encodedCompanies['companies'][index]['registration_date']?? ''
        )
    );

    items.forEach((element) {
      company.forEach((com) {
        if (element.company_name == com.company_name) {
          element.inn = com.inn;
        }
      });
    });

    return await SearchConnection.ready(items, company);
  }
}