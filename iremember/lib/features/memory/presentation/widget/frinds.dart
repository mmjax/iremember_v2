import 'package:flutter/material.dart';


class FriendList extends StatefulWidget {
  const FriendList({Key? key}) : super(key: key);

  @override
  _FriendListState createState() => _FriendListState();
}

class _FriendListState extends State<FriendList> {
  final List<Friend> friends = [
    Friend(name: 'Друг 1', avatar: 'lib/assets/avatar1.jpeg'),
    Friend(name: 'Друг 2', avatar: 'lib/assets/avatar2.jpg'),
    Friend(name: 'Друг 3', avatar: 'lib/assets/avatar3.jpg'),
  ];

   @override
  Widget build(BuildContext context) {
  return Container(
    height: 150.0,
    child: Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: friends.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(friends[index].avatar),
                  child: Text(friends[index].name),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 8.0), // Пространство между аватарами и текстом
        const Text(
          'Улица: балдежная',
          style: TextStyle(
            fontSize: 12.0, // Размер шрифта для маленького текста
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text(
          'Дата: балдежная',
          style: TextStyle(
            fontSize: 12.0, // Размер шрифта для маленького текста
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    ),
  );
}
}

class Friend {
  final String name;
  final String avatar;

  Friend({required this.name, required this.avatar});
}