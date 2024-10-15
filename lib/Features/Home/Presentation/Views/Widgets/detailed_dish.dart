import 'package:flutter/material.dart';
import 'package:recipe/Features/Home/Data/Model/food_model.dart';
import 'package:recipe/Features/Home/Presentation/Views/Widgets/dish_stack_image.dart';
import 'package:recipe/Features/Home/Presentation/Views/Widgets/ingredients.dart';
import 'package:recipe/Features/Home/Presentation/Views/Widgets/instructions.dart';
import 'package:recipe/Features/Home/Presentation/Views/Widgets/name_country.dart';
import 'package:recipe/Features/Home/Presentation/Views/Widgets/review_section.dart';

import 'back_button.dart';

class DetailedDish extends StatelessWidget {
  final List<FoodItem> foodItem;
  final int index;
  const DetailedDish({super.key, required this.foodItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://static.vecteezy.com/system/resources/previews/022/954/512/original/seamless-pattern-with-food-icons-doodle-food-pattern-food-background-free-vector.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context, foodItem[index]); // Return updated food item
                }, icon: Icon(Icons.keyboard_arrow_left,color:Colors.yellowAccent,size:55),
                
              ),
              Positioned(
                top: 370,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 370,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 80.0, horizontal: 15,
                      ),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: MediaQuery.of(context).size.height,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Dish name and country
                            NameCountry(foodItem: foodItem, index: index),
                            // Ingredients section
                            Ingredients(foodItem: foodItem, index: index),
                            const SizedBox(height: 20),
                            // Instructions section
                            Instructions(foodItem: foodItem, index: index),
                            //Reviews
                            ReviewSection(foodItem : foodItem, index:index),


                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Dish image
              DishStackImage(foodItem: foodItem, index: index),
            ],
          ),
        ),
      ),
    );
  }
}
