import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iremember/features/log_in/presentation/log_in_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


void showErrorSnackBar(BuildContext context, String errorMessage) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(errorMessage),
      duration: const Duration(seconds: 3),
    ),
  );
}


class SignUpPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repasswordController = TextEditingController();
  final FlutterSecureStorage storage;

  SignUpPage({Key? key, required this.storage}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    Future<void> _registration(BuildContext context) async {
      String email = _emailController.text;
      String password = _passwordController.text;
      String username = _usernameController.text;
      String repassword = _repasswordController.text;

      if (email.isNotEmpty && password.isNotEmpty && username.isNotEmpty && password == repassword) {
        // Отправка запроса на сервер для авторизации
        final response = await http.post(
          Uri.parse('http://192.168.1.92:8000/create_user'),
          body: json.encode({'username': username, 'password': password, 'email': email}),
          headers: {"Content-Type" : "application/json",
            'Accept': 'application/json',},
        );

        if (response.statusCode == 200) {
          Navigator.pushNamed(context, '/login');
        }else {
          if (response.statusCode == 400) {
            // Bad Request - Incorrect input data
            final errorDetail = json.decode(response.body)['detail'];
            final errorMessage = (errorDetail is List) ? errorDetail[0]['msg'].toString() : errorDetail.toString();
            // Show error messages to the user
            showErrorSnackBar(context, errorMessage);
          }
        }
      }
      else{
        showErrorSnackBar(context, 'Все поля являются обязательными к заполнению');
      }
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Почта',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Имя пользователя',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Пароль',
                ),
                obscureText: true, // Для скрытия пароля
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _repasswordController,
                decoration: const InputDecoration(
                  labelText: 'Повтор пароля',
                ),
                obscureText: true, // Для скрытия пароля
              ),
            ),
            ElevatedButton(
              onPressed: () => _registration(context),
              child: const Text('Зарегистрироваться'),
            ),
          ],
        ),
      ),
      )
    );
  }
}