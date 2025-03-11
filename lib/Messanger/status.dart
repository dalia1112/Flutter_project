import 'package:flutter/material.dart';
import 'package:flutter_frst_project/Messanger/messanger_screen.dart';

class Status extends StatelessWidget {
  final UserModel user;
  const Status({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey[300],
              child: Icon(Icons.person, color: Colors.white),
            ),
            CircleAvatar(
              radius: 7,
              backgroundColor: Colors.white,
              child: CircleAvatar(radius: 6, backgroundColor: Colors.green),
            ),
          ],
        ),
        SizedBox(height: 5),
        Text(
          user.name,
          textAlign: TextAlign.center,
          style:TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
