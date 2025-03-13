import 'package:flutter/material.dart';


class MsgItem extends StatelessWidget {
  // final UserModel user;
  const MsgItem({super.key, required this.name, required this.message, required this.time, required this.image});
  final String name;
  final String message;
  final String time;
  final String image;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
              radius: 30,
            backgroundColor: Colors.grey[300],
            backgroundImage: NetworkImage(image)
            // child: Icon(Icons.person, color: Colors.white),
            ),
            const CircleAvatar(
                radius: 7,
                backgroundColor: Colors.white,
                
                child: CircleAvatar(radius: 6, backgroundColor: Colors.green)),
        ],
      ),
      title:
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(message,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.black54)),
      trailing: Text(time, style: const TextStyle(color: Colors.black54)),
    );
  }
}