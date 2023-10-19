import 'package:flutter/material.dart';


class MemoryBody extends StatelessWidget {
  const MemoryBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Картинка
          Image.asset(
            'lib/assets/clown.png',
            width: 400,
            height: 400,
          ),
          const SizedBox(height: 16),
          const Text('Клуб Клоунады',
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              ),
            ),         
          const Text(
            'прям какая-то клоунада',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}