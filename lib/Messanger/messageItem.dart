import 'package:flutter/material.dart';
import 'package:flutter_frst_project/Messanger/messanger_screen.dart';

class MsgItem extends StatelessWidget {
  final UserModel user;
  const MsgItem({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
              radius: 30,
            backgroundColor: Colors.grey[300],
            child: Icon(Icons.person, color: Colors.white),),
            const CircleAvatar(
                radius: 7,
                backgroundColor: Colors.white,
                child: CircleAvatar(radius: 6, backgroundColor: Colors.green)),
        ],
      ),
      title:
          Text(user.name, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(user.message,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.black54)),
      trailing: Text(user.time, style: const TextStyle(color: Colors.black54)),
    );
  }
}