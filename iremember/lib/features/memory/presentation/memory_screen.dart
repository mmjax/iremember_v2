import 'package:flutter/material.dart';
import 'package:iremember/core/presentation/app_screen.dart';
import 'package:iremember/features/memory/presentation/widget/frinds.dart';
import 'package:iremember/features/memory/presentation/widget/memory_card.dart';


class MemoryScreen extends StatelessWidget {
  const MemoryScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      drawer: const MainDrawer(),
      body: ListView(
      children: const [
        MemoryCard(),
        FriendList()
      ],
      ),
    );
  }
}