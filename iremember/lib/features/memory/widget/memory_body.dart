import 'package:flutter/material.dart';
import 'package:iremember/data/memory/models.dart';



class MemoryBody extends StatelessWidget {
  const MemoryBody({super.key, required this.memory});

  final Memory memory;
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
          Text(memory.title,
          style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              ),
            ),         
          Text(
            memory.description,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}