import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe/Features/Home/Data/Model/food_model.dart';

import 'detailed_dish.dart';

class Dish extends StatelessWidget {
  final List<FoodItem> foodList;
  final int index;
  const Dish({super.key, required this.foodList, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 5,
            spreadRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.network(
              foodList[index].image,
              fit: BoxFit.cover,
              height: 120,
              width: double.infinity,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              foodList[index].name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 8), // Space before the icon
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Align(
              alignment: Alignment.centerRight, // Align icon to the end
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  DetailedDish(foodItem: foodList, index: index,)),
                  );
                },
                icon: const Icon(Icons.arrow_forward_ios, size: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
