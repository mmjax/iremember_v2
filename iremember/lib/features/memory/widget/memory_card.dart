import 'package:flutter/material.dart';
import 'package:iremember/features/memory/widget/memory_body.dart';
import 'package:iremember/data/memory/models.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class MemoryCard extends StatelessWidget {
  const MemoryCard({super.key, required this.memory});

  final Memory memory;

  @override
  Widget build(BuildContext context){
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 5.0,
          bottom: 15.0,
          left: 10.0,
          right: 10.0
        ),
        child: Column(
          children: [
            Column(
              children: [
                  MemoryBody(memory: memory),
              ],
            )
          ],
        ),
      )
    );
  }
}