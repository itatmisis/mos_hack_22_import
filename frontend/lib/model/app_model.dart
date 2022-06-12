import 'package:flutter/foundation.dart';

class AppModel extends ChangeNotifier {
  String _userType = '';

  String name = 'Павел Петров';
  String company = 'ИП “Петров Павел Евгеньевич”';
  String inn = 'ИНН: 1100992228345';

  String get userType => _userType;

  set userType(String value) {
    _userType = value;

    if (value == 'company') {
      name = 'Павел Петров';
      company = 'ИП “Петров Павел Евгеньевич”';
      inn = 'ИНН: 1100992228345';
    } else if (value == 'moderator'){
      name = 'Геннадий Альхеев';
      company = 'МОСПРОМ';
      inn = 'Модератор';
    }
  }
}