import 'package:flutter/material.dart';
import 'package:flutter_frst_project/Messanger/messageItem.dart';
import 'package:flutter_frst_project/Messanger/status.dart';
import 'package:flutter_frst_project/models/products_model.dart';
import 'package:flutter_frst_project/ApiProvider/api_provider.dart';

class UserModel {
  final String name;
  final String message;
  final String time;
  final String image;

  UserModel({required this.name, required this.message, required this.time, required this.image});
}

final List<UserModel> users = [
  UserModel(
    name: 'Dalia Elsayed',
    message: 'Hello, what are you Doing!',
    time: '11:00 AM',
    image:''
  ),
  UserModel(
    name: 'Mohamed Ali',
    message: 'Hello, my friend! Hope all is well.',
    time: '11:15 AM',
    image:''
  ),
  UserModel(
    name: 'Noura ahmed',
    message: 'Good evening! How was your day?',
    time: '11:10 PM',
    image:''
  ),
  UserModel(
    name: 'Mona Ali',
    message: 'Good afternoon! How are you today?',
    time: '10:15 AM',
    image:''
  ),
  UserModel(
    name: 'Ahmed Mohamed',
    message: 'Hello, my friend! Hope all is well.',
    time: '10:30 AM',
    image:''
  ),
  UserModel(
    name: 'Ibrahim karim',
    message: 'Heyyy! How have you been?',
    time: '12:25 AM',
    image:''
  ),
  UserModel(
    name: 'Laila ahmed',
    message: 'Good morning! Hope you have a great day.',
    time: '11:25 AM',
    image:''
  ),
  UserModel(
    name: 'Amal Elsayed',
    message: 'Hello, what are you Doing!',
    time: '11:00 AM',
    image:''
  ),
  UserModel(
    name: 'Amira Ali',
    message: 'Hello, my friend! Hope all is well.',
    time: '11:15 AM',
    image:''
  ),
];

class MessangerScreen extends StatefulWidget {
  const MessangerScreen({super.key});

  @override
  State<MessangerScreen> createState() => _MessangerScreenState();
}

class _MessangerScreenState extends State<MessangerScreen> {
  Products? productsModel;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    getProductsFromApiProvider();
  }

  getProductsFromApiProvider() async {
    productsModel = await ApiProvider().getProducts();
    print(productsModel!.products![0].title);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[200],
        title: Row(
          children: [
            CircleAvatar(
              radius: 17,
              backgroundImage: NetworkImage(
                "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
              ),
            ),

            SizedBox(width: 10),
            Text(
              "Chats",
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.pink[50],
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.camera_alt),
              color: Colors.black26,
            ),
          ),
          SizedBox(width: 10),
          CircleAvatar(
            backgroundColor: Colors.pink[50],

            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.edit),
              color: Colors.black26,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Icon(Icons.search),
                  SizedBox(width: 5),
                  Text("Search", style: TextStyle(color: Colors.black54)),
                ],
              ),
            ),
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
            SizedBox(height: 15),
            isLoading==true?
            Center(
              child: CircularProgressIndicator(),
            ):
            Expanded(
              child: ListView.separated(
                itemCount: productsModel!.products!.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) => MsgItem(
                  name:productsModel!.products![index].title!,
                  message: productsModel!.products![index].description!,
                  time: productsModel!.products![index].price!.toString(),
                  image: productsModel!.products![index].thumbnail!,

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
