import 'package:flutter/material.dart';
import '../../../models/user/user_model.dart';


class UserScreen extends StatelessWidget {
  List<UserModel> users = [
    UserModel(
      id: 1,
      name: 'Mostafa Mohamed',
      phone: '01212121212',
    ),
    UserModel(
      id: 2,
      name: 'Mostafa Mohamed',
      phone: '013333321212',
    ),
    UserModel(
      id: 3,
      name: 'Mostafa Mohamed',
      phone: '133334444121212',
    ),
    UserModel(
      id: 4,
      name: 'Mostafa Mohamed',
      phone: '2222222121212',
    ),
    UserModel(
      id: 5,
      name: 'Mostafa Mohamed',
      phone: '01212121212',
    ),
    UserModel(
      id: 6,
      name: 'Mostafa Mohamed',
      phone: '013333321212',
    ),
    UserModel(
      id: 7,
      name: 'Mostafa Mohamed',
      phone: '133334444121212',
    ),
    UserModel(
      id: 8,
      name: 'Mostafa Mohamed',
      phone: '2222222121212',
    ),
  ];

  UserScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'User',
        ),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => buildUserItem(users[index]),
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsetsDirectional.only(
            start: 20.0,
          ),
          child: Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.green[300],
          ),
        ),
        itemCount: users.length,
      ),
    );
  }

  Widget buildUserItem(UserModel user) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25.0,
              child: Text(
                '${user.id}',
                style: const TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${user.name}',
                  style: const TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${user.phone}',
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
