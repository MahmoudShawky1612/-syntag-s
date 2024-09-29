import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe/Features/Home/Data/Model/food_model.dart';

class NameCountry extends StatelessWidget {
  final List<FoodItem> foodItem;
  final int index;
  const NameCountry({super.key, required this.foodItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          foodItem[index].name,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Row(
          children: [
            const Icon(Icons.location_pin,size: 15,),
            const SizedBox(width: 5,),
            Text(
              foodItem[index].country,
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 15,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
