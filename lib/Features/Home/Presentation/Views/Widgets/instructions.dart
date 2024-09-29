import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Data/Model/food_model.dart';

class Instructions extends StatelessWidget {
  final List<FoodItem> foodItem;
  final int index;
  const Instructions({super.key, required this.foodItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Instructions",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10),

        // Instructions list
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: foodItem[index]
              .instructions
              .asMap()
              .entries
              .map(
                (entry) => Padding(
              padding:
              const EdgeInsets.only(bottom: 8.0),
              child: Row(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    "${entry.key + 1}. ",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      entry.value,
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black87),
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
