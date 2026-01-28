import 'dart:convert';

import 'package:homework6/models/products.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<List<Products>> getData(String link) async {
    var response = await http.get(Uri.parse(link));
    var result = jsonDecode(response.body);

    List<Products> objectList = [];

    for (Map<String, dynamic> items in result["products"]) {
      Products product = Products.fromJson(items);
      objectList.add(product);
    }

    return objectList;
  }
}
