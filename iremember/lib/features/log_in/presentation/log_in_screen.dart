import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:iremember/features/memory/memory_screen.dart';
import 'package:iremember/features/sign_in/presentation/sign_up_screen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void showErrorSnackBar(BuildContext context, String errorMessage) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(errorMessage),
      duration: const Duration(seconds: 3),
    ),
  );
}

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FlutterSecureStorage storage;

  // LoginPage({super.key});
  LoginPage({Key? key, required this.storage}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    // ignore: no_leading_underscores_for_local_identifiers
    // void _login() {
    //   String email = _emailController.text;
    //   String password = _passwordController.text;

    //   if (email.isNotEmpty && password.isNotEmpty) {
    //     Navigator.pushNamed(context, '/');
    //   }
    // }
    Future<void> _login(BuildContext context) async {
      String email = _emailController.text;
      String password = _passwordController.text;

      if (email.isNotEmpty && password.isNotEmpty) {
        // Отправка запроса на сервер для авторизации
        final response = await http.post(
          Uri.parse('http://192.168.1.92:8000/set_token'),
          body: json.encode({'username': email, 'password': password}),
          headers: {"Content-Type" : "application/json",
            'Accept': 'application/json',},

        );

        if (response.statusCode == 200) {
          // Если запрос успешен, сохраняем токен в безопасном хранилище
          final token = json.decode(response.body)['access_token'] as String;
          await storage.write(key: 'token', value: token);

          // Переход на страницу / после успешной авторизации
          Navigator.pushNamed(context, '/');
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
      body: Center(
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
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Пароль',
                ),
                obscureText: true, // Для скрытия пароля
              ),
            ),
            ElevatedButton(
              onPressed: () => _login(context),
              child: const Text('Войти'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              const Text('Нет учетной записи?'),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: const Text('Зарегистрироваться')
                )
            ],)
          ],
        ),
      ),
    );
  }
}