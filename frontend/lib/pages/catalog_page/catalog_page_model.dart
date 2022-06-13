import 'package:flutter/material.dart';

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
    List<DataItem> items = List.generate(50, (index) =>
        DataItem(
            id: index,
            name: 'Название $index',
            address: 'Адрес $index',
            industry: 'Отрасль $index',
            category: 'Категория $index',
            subcategory: 'Подкатегория $index',
            is_moscow: false,
          company_name: 'Компания $index'
        )
    );
    List<CompanyItem> company = List.generate(50, (index) =>
        CompanyItem(
            id: index,
            inn: index.toString(),
            ogrn: index.toString(),
            kpp: index.toString(),
            emp_num: index.toString(),
            oficcial_name: 'Имя $index',
            company_name: 'Компания $index',
            description: 'Описание $index',
            address: 'Адрес $index',
            phone: 'Телефон $index',
            email: 'Имаил $index',
            brand_image: 'Картинка $index',
            industry: 'Отрасль $index',
            category: 'Категория $index',
            subcategory: 'Подкатегория $index',
            website: 'Сайт $index',
            registration_date: 'Дата регистрации $index'
        )
    );

    items.forEach((element) {
      company.forEach((com) {
        if (element.company_name == com.company_name) {
          element.inn = com.inn;
        }
      });
    });

    return await Future.delayed(Duration(seconds: 2), () => SearchConnection.ready(items, company));
  }
}