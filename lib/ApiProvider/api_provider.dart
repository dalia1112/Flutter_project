
import 'package:dio/dio.dart';
import 'package:flutter_frst_project/models/products_model.dart';

class ApiProvider {
  Products? productsModel;
  getProducts() async {
    Response productsResponse = await Dio().get(
      'https://dummyjson.com/products',
      queryParameters: {
        'select': 'id,title,description,category,thumbnail,price',
      },
    );
    productsModel = Products.fromJson(productsResponse.data);

    print(productsModel!.products![0].title);

    return productsModel;
  }
}
