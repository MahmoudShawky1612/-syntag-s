import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Data/Model/food_model.dart';

class DishStackImage extends StatelessWidget {
  final List<FoodItem> foodItem;
  final int index;
  const DishStackImage({super.key, required this.foodItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Hero(
        tag: foodItem[index].name,
        child: Container(
          width: 160,
          height: 160,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(foodItem[index].image),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
