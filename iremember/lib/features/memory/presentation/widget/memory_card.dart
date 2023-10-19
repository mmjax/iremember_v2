import 'package:flutter/material.dart';
import 'package:iremember/features/memory/presentation/widget/memory_body.dart';


class MemoryCard extends StatelessWidget {
  const MemoryCard({super.key});

  @override
  Widget build(BuildContext context){
    return const Card(
      child: Padding(
        padding: EdgeInsets.only(
          top: 5.0,
          bottom: 15.0,
          left: 10.0,
          right: 10.0
        ),
        child: Column(
          children: [
            Column(
              children: [
                  MemoryBody(),
              ],
            )
          ],
        ),
      )
    );
  }
}