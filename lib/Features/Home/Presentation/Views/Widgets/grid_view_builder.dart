import 'package:flutter/cupertino.dart';
import 'package:recipe/Features/Home/Data/Model/food_model.dart';

import 'dish.dart';

class GridViewBuilder extends StatelessWidget {
  final List<FoodItem> foodList;
  const GridViewBuilder({super.key, required this.foodList});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true, // Ensures it fits in the SingleChildScrollView
      physics: const NeverScrollableScrollPhysics(), // Disable internal scrolling
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Two columns
        crossAxisSpacing: 20.0, // Spacing between columns
        mainAxisSpacing: 20.0, // Spacing between rows
        childAspectRatio: 0.65, // Aspect ratio
      ),
      itemCount: (foodList.length - 5).clamp(0, foodList.length),
      itemBuilder: (context, index) {
        return Dish(foodList: foodList, index: index+5,);
      },
    );
  }
}
