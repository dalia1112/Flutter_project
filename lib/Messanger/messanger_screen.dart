import 'package:flutter/material.dart';
import 'package:flutter_frst_project/Messanger/messageItem.dart';
import 'package:flutter_frst_project/Messanger/status.dart';
class UserModel {
  final String name;
  final String message;
  final String time;
  
  UserModel(
      {required this.name,
      required this.message,
      required this.time,
      });

}


final List <UserModel> users = [
    UserModel(
        name: 'Dalia Elsayed',
        message: 'Hello, what are you Doing!',
        time: '11:00 AM',
        ),
    UserModel(
        name: 'Mohamed Ali',
        message: 'Hello, my friend! Hope all is well.',
        time: '11:15 AM',
        ),
    UserModel(
        name: 'Noura ahmed',
        message: 'Good evening! How was your day?',
        time: '11:10 PM',
        ),
    UserModel(
        name: 'Mona Ali',
        message: 'Good afternoon! How are you today?',
        time: '10:15 AM',
      ),
    UserModel(
        name: 'Ahmed Mohamed',
        message: 'Hello, my friend! Hope all is well.',
        time: '10:30 AM',
      ),
    UserModel(
        name: 'Ibrahim karim',
        message: 'Heyyy! How have you been?',
        time: '12:25 AM',
        ),
          UserModel(
        name: 'Laila ahmed',
        message: 'Good morning! Hope you have a great day.',
        time: '11:25 AM',
        ),
  UserModel(
        name: 'Amal Elsayed',
        message: 'Hello, what are you Doing!',
        time: '11:00 AM',
        ),
    UserModel(
        name: 'Amira Ali',
        message: 'Hello, my friend! Hope all is well.',
        time: '11:15 AM',
        ),
  ];

class MessangerScreen extends StatefulWidget {
  const MessangerScreen({super.key});


  @override
  State<MessangerScreen> createState() => _MessangerScreenState();
}

class _MessangerScreenState extends State<MessangerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      backgroundColor: Colors.pink[200],
      title: Row(
        children: [
          CircleAvatar(
            radius: 17,
            backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"),
          ),
          
          SizedBox(
            width:10
            ),
          Text("Chats",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold
          ),),
        ],
        
      ),
      actions:[
        CircleAvatar(
          backgroundColor: Colors.pink[50],
          child:IconButton(onPressed: (){}, icon:Icon(Icons.camera_alt),color:Colors.black26)
            
          ),
          SizedBox(width: 10,),
          CircleAvatar(
          backgroundColor: Colors.pink[50],
          
          child:IconButton(onPressed: (){}, icon:Icon(Icons.edit), color:Colors.black26 ,)
            
          ),
      ]
    ),
    body:
    Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding:const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(15)
              

            ),
            child: Row(children: [
              Icon(Icons.search),
              SizedBox(width:5),
              Text("Search", style: TextStyle(color: Colors.black54),)
            ],),
          )
          ,
          SizedBox(height: 15),
            SizedBox(
              height: 90,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: users.length,
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemBuilder: (context, index) => Status(user: users[index]),
              ),
            ),
          SizedBox(height:15),
          Expanded(
              child: ListView.separated(
                itemCount: users.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) => MsgItem(user: users[index]),
              ),
            ),

        ],
      ),

    ),
    
    
  

    );
  }
}