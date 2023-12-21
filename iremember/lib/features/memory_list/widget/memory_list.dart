import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iremember/features/memory/bloc/memory_page_bloc.dart';
import '../../../data/memory/models.dart';


class TitleListTile extends StatelessWidget {
  const TitleListTile({super.key, required this.memory});

  final Memory memory;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: () {
          BlocProvider.of<DetailMemoryBloc>(context).setMemoryId(memory.id);
          Navigator.pushNamed(context, '/memory',);
        },
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Image(image: AssetImage('lib/assets/clown.png'), height: 130,),
            ),
            const SizedBox(width: 10.0,),
            Expanded(
              flex: 7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    memory.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    memory.description,
                    style: const TextStyle(fontSize: 13.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
  }
}