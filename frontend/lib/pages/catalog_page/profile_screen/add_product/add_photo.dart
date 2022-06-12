import 'package:flutter/material.dart';

class AddPhoto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFEAF1FD),
        borderRadius: BorderRadius.circular(9)
      ),
      child: Center(
        child: Text('Добавление фото\nпока недоступно :(',
          style: TextStyle(color: Color(0xFF7A879B), fontWeight: FontWeight.w500, fontSize: 16)),
      ),
    );
  }
}