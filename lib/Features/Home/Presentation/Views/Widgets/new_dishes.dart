import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe/Features/Home/Data/Model/food_model.dart';
import 'package:recipe/Features/Home/Presentation/Views/Widgets/detailed_dish.dart';

class NewDishes extends StatelessWidget {
  final List<FoodItem> foodList;
  const NewDishes({super.key, required this.foodList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  DetailedDish(foodItem: foodList, index: index,)),
                          );
                        },
                        child: Hero(
                          tag: foodList[index].name,
                          child: Image.network(
                            foodList[index].image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    width: 60,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        foodList[index].name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(

                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
