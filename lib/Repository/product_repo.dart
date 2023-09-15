import 'dart:convert';


import 'package:http/http.dart' as http;

import '../Model/product_model.dart';

class WebServise{

 Future<List<ProductModel>> callProfileApi() async {
    var url = Uri.parse('https://fakestoreapi.com/products');
    var response = await http.get(url );
    if(response.statusCode==200){
      print('Response status: ${response.statusCode}');
      print('Response body: ${jsonDecode(response.body)}');
      return  productModelFromJson(response.body);
    }

     return  productModelFromJson(response.body);
  }
}