import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Data/Model/food_model.dart';

class Ingredients extends StatelessWidget {
  final List<FoodItem> foodItem;
  final int index;
  const Ingredients({super.key, required this.foodItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Ingredients",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10),

        // Ingredients list
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: foodItem[index]
              .ingredients
              .map(
                (ingredient) => Padding(
              padding:
              const EdgeInsets.only(bottom: 5),
              child: Row(
                children: [
                  const Icon(Icons.circle,
                      size: 8, color: Colors.black54),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      ingredient,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
              .toList(),
        ),
      ],
    );
  }
}
