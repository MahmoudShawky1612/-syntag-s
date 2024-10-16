import 'dart:convert';

import 'package:recipe/Features/Home/Data/Model/food_model.dart';
import 'package:http/http.dart' as http;

class FoodService{

  final String baseUrl = 'http://192.168.1.104:3000/api/food/';

  Future<List<FoodItem>> fetchFoodData() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body)['data']['food'];

      return data.map((jsonItem) => FoodItem.fromJson(jsonItem)).toList();
    } else {
      throw Exception('Failed to load food data ${json.decode(response.body)['msg']}' );
    }
  }

  Future<List<FoodItem>> searchFoodData(String query) async {
    final response= await http.get(Uri.parse('$baseUrl/search?foodName=$query'));

    if(response.statusCode == 200){
      List<dynamic> data = json.decode(response.body)['data']['food'];
      return data.map((jsonItem) => FoodItem.fromJson(jsonItem)).toList();
    } else {
      throw Exception('Failed to load food data ${json.decode(response.body)['msg']}' );
    }
  }

  Future<FoodItem> rateFood(String foodId, int rate) async {
    final response = await http.post(
      Uri.parse('$baseUrl/rate/$foodId'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'rates': rate}),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body)['data']['food'];
      return FoodItem.fromJson(data);
    } else {
      throw Exception('Failed to rate food ${json.decode(response.body)['msg']}');
    }
  }



}
