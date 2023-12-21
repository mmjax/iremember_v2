import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthRepository {
  final FlutterSecureStorage storage;

  AuthRepository({required this.storage});

  Future<void> login(String email, String password) async {
    if (email.isNotEmpty && password.isNotEmpty) {
      final response = await http.post(
        Uri.parse('http://192.168.1.92:8000/set_token'),
        body: json.encode({'username': email, 'password': password}),
        headers: {
          "Content-Type": "application/json",
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final token = json.decode(response.body)['access_token'] as String;
        await storage.write(key: 'token', value: token);
      } else {
        if (response.statusCode == 400) {
          final errorDetail = json.decode(response.body)['detail'];
          final errorMessage =
          (errorDetail is List) ? errorDetail[0]['msg'].toString() : errorDetail
              .toString();
          throw Exception(errorMessage);
        }
      }
    } else {
      throw Exception('Все поля являются обязательными к заполнению');
    }
  }

  Future<void> registration(String email, String password, String username,
      String repassword) async {
    if (email.isNotEmpty && password.isNotEmpty && username.isNotEmpty &&
        password == repassword) {
      // Отправка запроса на сервер для авторизации
      final response = await http.post(
        Uri.parse('http://192.168.1.92:8000/create_user'),
        body: json.encode(
            {'username': username, 'password': password, 'email': email}),
        headers: {"Content-Type": "application/json",
          'Accept': 'application/json',},
      );

      if (response.statusCode == 400) {
        final errorDetail = json.decode(response.body)['detail'];
        final errorMessage = (errorDetail is List) ? errorDetail[0]['msg']
            .toString() : errorDetail.toString();
        throw Exception(errorMessage);
      }
    }
      else {
        throw Exception('Все поля являются обязательными к заполнению');
      }
    }
  }

