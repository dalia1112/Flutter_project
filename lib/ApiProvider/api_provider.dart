import 'package:dio/dio.dart';
import 'package:flutter_frst_project/models/products_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ApiProvider {

  final String BaseUrl = 'https://dummyjson.com';
  Products? productsModel;
  getProducts() async {
    Response productsResponse = await Dio().get(
      '$BaseUrl/products',
      queryParameters: {
        'select': 'id,title,description,category,thumbnail,price',
      },
    );
    productsModel = Products.fromJson(productsResponse.data);

    print(productsModel!.products![0].title);

    return productsModel;
  }

  userLoginEmail({required String email, required String password}) async {
    final SharedPreferences  prefs = await SharedPreferences.getInstance();
    try {
      FormData userData = FormData.fromMap({
        'username': email,
        'password': password,
      });
      Response response = await Dio().post(
        '$BaseUrl/auth/login',
        data: userData,
      );
      print(response.data['accessToken']);
      prefs.setString('token', response.data['accessToken']);
    } catch (e) {
      if (e is DioException) {
        print(e.response?.data['message']);
        throw Exception(e.response?.data['message']);
      }
    }
  }
}
