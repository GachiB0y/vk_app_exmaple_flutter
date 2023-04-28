import 'package:flutter/material.dart';


class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(child: Center(child: Text('Ошибка перехода на страницу профиля'),),));
  }
}
