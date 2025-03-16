import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_frst_project/ApiProvider/api_provider.dart';
import 'package:flutter_frst_project/Messanger/messageItem.dart';
import 'package:flutter_frst_project/Messanger/status.dart';
import 'package:flutter_frst_project/models/products_model.dart';

class UserModel {
  final String name;
  final String message;
  final String time;
  final String image;

  UserModel({required this.name, required this.message, required this.time, required this.image});
}

// Messenger States
abstract class MessengerState {}
class MessengerLoading extends MessengerState {}
class MessengerLoaded extends MessengerState {
  final Products products;
  MessengerLoaded(this.products);
}
class MessengerError extends MessengerState {}

// Messenger Cubit
class MessengerCubit extends Cubit<MessengerState> {
  MessengerCubit() : super(MessengerLoading());

  void fetchProducts() async {
    try {
      final products = await ApiProvider().getProducts();
      emit(MessengerLoaded(products));
    } catch (e) {
      emit(MessengerError());
    }
  }
}

class MessangerScreen extends StatelessWidget {
  const MessangerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MessengerCubit()..fetchProducts(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink[200],
          title: Row(
            children: [
              const CircleAvatar(
                radius: 17,
                backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"),
              ),
              const SizedBox(width: 10),
              const Text("Chats", style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold)),
            ],
          ),
          actions: [
            CircleAvatar(
              backgroundColor: Colors.pink[50],
              child: IconButton(onPressed: () {}, icon: const Icon(Icons.camera_alt), color: Colors.black26),
            ),
            const SizedBox(width: 10),
            CircleAvatar(
              backgroundColor: Colors.pink[50],
              child: IconButton(onPressed: () {}, icon: const Icon(Icons.edit), color: Colors.black26),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(width: 5),
                    Text("Search", style: TextStyle(color: Colors.black54)),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              
              // Status List (Horizontal)
              SizedBox(
                height: 90,
                child: BlocBuilder<MessengerCubit, MessengerState>(
                  builder: (context, state) {
                    if (state is MessengerLoaded) {
                      return ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.products.products!.length,
                        separatorBuilder: (context, index) => const SizedBox(width: 10),
                        itemBuilder: (context, index) {
                          var product = state.products.products![index];
                          return Status(
                            user: UserModel(
                              name: product.title!,
                              message: product.description!,
                              time: product.price!.toString(),
                              image: product.thumbnail!,
                            ),
                          );
                        },
                      );
                    } else if (state is MessengerLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return const Center(child: Text("Failed to load statuses"));
                    }
                  },
                ),
              ),
              
              const SizedBox(height: 15),

              // Messages List (Vertical)
              Expanded(
                child: BlocBuilder<MessengerCubit, MessengerState>(
                  builder: (context, state) {
                    if (state is MessengerLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is MessengerLoaded) {
                      return ListView.separated(
                        itemCount: state.products.products!.length,
                        separatorBuilder: (context, index) => const Divider(),
                        itemBuilder: (context, index) {
                          var product = state.products.products![index];
                          return MsgItem(
                            name: product.title!,
                            message: product.description!,
                            time: product.price!.toString(),
                            image: product.thumbnail!,
                          );
                        },
                      );
                    } else {
                      return const Center(child: Text('Failed to load messages'));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
