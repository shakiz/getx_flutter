import 'package:getx_flutter/models/product.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  //make sure you always use ststic client
  static var client = http.Client();

  //region fetch product
  static Future<List<Product>?> fetchProducts() async {
    var response = await client.get(Uri.parse(
        'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productFromJson(jsonString);
    } else {

      return null;
    }
  }
  //endref=gion
}