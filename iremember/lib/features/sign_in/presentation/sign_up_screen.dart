import 'package:flutter/material.dart';
import 'package:iremember/features/log_in/presentation/log_in_screen.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repasswordController = TextEditingController();

  SignUpPage({super.key});


  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    void _registration() {
    String email = _emailController.text;
    String password = _passwordController.text;
    String username = _usernameController.text;
    String repassword = _repasswordController.text;


    // Здесь можно добавить логику для проверки логина и пароля
    // и выполнение соответствующих действий.

    if (email.isNotEmpty && password.isNotEmpty && username.isNotEmpty && password == repassword) {
      Navigator.pushNamed(context, '/login');
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
              onPressed: _registration,
              child: const Text('Зарегистрироваться'),
            ),
          ],
        ),
      ),
      )
    );
  }
}