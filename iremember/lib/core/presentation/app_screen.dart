import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iremember/features/log_in/presentation/log_in_screen.dart';
import 'package:iremember/features/memory/memory_screen.dart';
import 'package:iremember/features/profile/profile_screen.dart';
import 'package:iremember/features/settings/setting_page.dart';
import 'package:iremember/features/sign_in/presentation/sign_up_screen.dart';
import 'package:iremember/theme/color_schemes.g.dart';
import 'package:iremember/features/memory/bloc/memory_page_bloc.dart';
import 'package:iremember/data/memory/repository.dart';




class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    bool a = false;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DetailMemoryBloc(MemoryRepository()),
        )
      ],
    child: MaterialApp(
      theme: ThemeData(
        colorScheme: darkColorScheme,
        useMaterial3: true,
      ),
      // home: a ? LoginPage() : const MemoryScreen(),
      initialRoute: a ? '/login' : '/',
      routes: {
        '/': (context) => const DetailMemory(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
        '/settings': (context) => const SettingsScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    )
    );
  }
}

// class AppScreen extends StatefulWidget {
//   const AppScreen({super.key});

//   @override
//   State<AppScreen> createState() => _AppScreenState();
// }

// class _AppScreenState extends State<AppScreen> {
//   int _selectedIndex = 0;
//   final List<Widget> _screens = [
//     LoginPage(),
//     const MemoryList(),
//     const MemoryScreen(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _screens[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Главная',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.cloud),
//             label: 'Воспоминание',
            
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         onTap: _onTappedHandler
//       )
//     );
//   }

//     void _onTappedHandler(int index) {
//       setState(() {
//         _selectedIndex = index;
//       });
//     }
// }




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