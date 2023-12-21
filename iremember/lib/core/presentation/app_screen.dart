import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iremember/features/log_in/presentation/log_in_screen.dart';
import 'package:iremember/features/memory/memory_screen.dart';
import 'package:iremember/features/memory_list/bloc/memory_list_bloc.dart';
import 'package:iremember/features/memory_list/memory_list_screen.dart';
import 'package:iremember/features/profile/profile_screen.dart';
import 'package:iremember/features/settings/setting_page.dart';
import 'package:iremember/features/sign_in/presentation/sign_up_screen.dart';
import 'package:iremember/theme/color_schemes.g.dart';
import 'package:iremember/features/memory/bloc/memory_page_bloc.dart';
import 'package:iremember/data/memory/repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  Future<Widget> _buildContent() async {
    const storage = FlutterSecureStorage();
    String? stringValue = await storage.read(key: 'token');
    bool value = stringValue != null;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DetailMemoryBloc(MemoryRepository(), storage),
        ),
        BlocProvider(
          create: (context) => MemoryListBloc(MemoryRepository(), storage),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: darkColorScheme,
          useMaterial3: true,
        ),
        initialRoute: value ? '/' : '/login',
        routes: {
          '/': (context) => const MemoryList(),
          '/memory': (context) => const DetailMemory(),
          '/login': (context) => LoginPage(storage: storage),
          '/signup': (context) => SignUpPage(storage: storage),
          '/settings': (context) => const SettingsScreen(),
          '/profile': (context) => const ProfileScreen(),
        },
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Widget>(
      future: _buildContent(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return snapshot.data!;
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200, // Adjust the width as needed
      child: Drawer(
        child: ListView(
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text('Maksim'),
              accountEmail: Text('maksim@mail.ru'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('lib/assets/avatar1.jpeg'),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/settings');
                },
                child: const Text('Настройки'),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                child: const Text('Все воспоминания'),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/profile');
                },
                child: const Text('Профиль'),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
              ),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: const Text('Выход'),
              ),
            // Add more buttons as needed
          ],
        ),
      ),
    );
  }
}