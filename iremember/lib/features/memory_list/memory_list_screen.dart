import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iremember/features/memory_list/bloc/memory_list_bloc.dart';
import 'package:iremember/features/memory_list/bloc/memory_list_event.dart';
import 'package:iremember/features/memory_list/bloc/memory_list_state.dart';
import 'package:iremember/features/memory_list/widget/memory_list.dart';

import '../../core/presentation/app_screen.dart';


class MemoryList extends StatefulWidget {
  const MemoryList({super.key});
  @override
  State<MemoryList> createState() => _MemoryListScreen();

}

class _MemoryListScreen extends State<MemoryList>  {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      body: BlocBuilder<MemoryListBloc, ListMemoryState>(
          bloc: BlocProvider.of<MemoryListBloc>(context)..add(LoadMemoriesEvent()),
          builder: (context, state) {
            if (state is MemoryLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is MemoryLoadedState) {
              return ListView.builder(
                  itemCount: state.memories.length,
                  itemBuilder: (BuildContext context, int index) {
                    return TitleListTile(memory: state.memories[index]);
                  }
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
