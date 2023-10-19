import 'package:flutter/material.dart';
import 'package:iremember/features/memory/presentation/memory_screen.dart';
import 'package:iremember/features/sign_in/presentation/sign_up_screen.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginPage({super.key});


  @override
  Widget build(BuildContext context) {

    // ignore: no_leading_underscores_for_local_identifiers
    void _login() {
    String email = _emailController.text;
    String password = _passwordController.text;

    if (email.isNotEmpty && password.isNotEmpty) {
      Navigator.pushNamed(context, '/');
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
              onPressed: _login,
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