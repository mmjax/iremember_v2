import 'package:flutter/material.dart';
import 'package:iremember/features/memory_list/widget/memory_list.dart';


class MemoryList extends StatelessWidget {
  const MemoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: const [
          TitleListTile(),
        ],
      );
  }
}