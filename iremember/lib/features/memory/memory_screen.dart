import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iremember/core/presentation/app_screen.dart';
import 'package:iremember/features/memory/widget/frinds.dart';
import 'package:iremember/features/memory/widget/memory_card.dart';
import 'package:iremember/features/memory/bloc/memory_page_event.dart';
import 'package:iremember/features/memory/bloc/memory_page_state.dart';
import 'package:iremember/features/memory/bloc/memory_page_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iremember/locator.dart';


class DetailMemory extends StatefulWidget {
  const DetailMemory({super.key});

  @override
  State<DetailMemory> createState() => _DetailMemoryState();

}

class _DetailMemoryState extends State<DetailMemory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const MainDrawer(),
        body: BlocBuilder<DetailMemoryBloc, DetailMemoryState>(
          bloc: locator<DetailMemoryBloc>()..add(LoadMemoryEvent()),
          builder: (context, state) {

            if (state is MemoryLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is MemoryLoadedState) {
              return ListView(
                  children: [
                  MemoryCard(memory: state.memory),
                ]
              );
            }
            if (state is MemoryErrorState) {
              return Center(
                child: Text(state.error.toString()),
              );
            }
            return Container();
          }
        ),
      );
  }
}
