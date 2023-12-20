import 'package:flutter/material.dart';

class TitleListTile extends StatelessWidget {
  const TitleListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: ListTile(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Image(image: AssetImage('lib/assets/clown.png'), height: 130,),
            ),
            SizedBox(width: 10.0,),
            Expanded(
              flex: 7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Клуб Клоунады',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'улица: балдежная; дата: балдежная',
                    style: TextStyle(fontSize: 13.0),
                  ),
                  Text(
                    'Участники: 3 друга',
                    style: TextStyle(fontSize: 13.0),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}