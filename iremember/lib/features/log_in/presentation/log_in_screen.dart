import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:iremember/features/memory/memory_screen.dart';
import 'package:iremember/features/sign_in/presentation/sign_up_screen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iremember/data/auth/repository.dart';

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

    Future<void> _login(BuildContext context) async {
      String email = _emailController.text;
      String password = _passwordController.text;
      try {
       AuthRepository authRepository = AuthRepository(storage: storage);
      await authRepository.login(email, password);
      Navigator.pushNamed(context, '/');
    } catch (e) {
      print(e);
      showErrorSnackBar(context, e.toString());
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