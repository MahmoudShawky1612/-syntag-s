// lib/Features/Home/Presentation/Views/Widgets/dish.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe/Features/Home/Data/Model/food_model.dart';
import 'detailed_dish.dart';

class Dish extends StatefulWidget {
  final List<FoodItem> foodList;
  final int index;

  const Dish({super.key, required this.foodList, required this.index});

  @override
  State<Dish> createState() => _DishState();
}

class _DishState extends State<Dish> {

  @override
  Widget build(BuildContext context) {
    Widget _buildStarRating(double rating) {
      int fullStars = rating.floor();
      int halfStars = (rating - fullStars >= 0.5) ? 1 : 0;
      int emptyStars = 5 - fullStars - halfStars;

      return Row(
        children: [
          ...List.generate(fullStars, (index) => const Icon(Icons.star, color: Colors.amber,size: 15,),),
          ...List.generate(halfStars, (index) => const Icon(Icons.star_half, color: Colors.amber,size: 15)),
          ...List.generate(emptyStars, (index) => const Icon(Icons.star_border, color: Colors.amber,size: 15)),
        ],
      );
    }
    return GestureDetector(
      onTap: () async {
        final updatedFoodItem = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailedDish(
              foodItem: widget.foodList,
              index: widget.index,
            ),
          ),
        );

        if (updatedFoodItem != null) {
          setState(() {
            widget.foodList[widget.index] = updatedFoodItem;
          });
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.blueGrey.withOpacity(0.5),
              blurRadius: 5,
              spreadRadius: 1,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
              const BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.network(
                widget.foodList[widget.index].image,
                fit: BoxFit.cover,
                height: 120,
                width: double.infinity,
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                widget.foodList[widget.index].name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                  children: [
                    _buildStarRating(widget.foodList[widget.index].averagerating)
                  ]
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () async {
                    final updatedFoodItem = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailedDish(
                          foodItem: widget.foodList,
                          index: widget.index,
                        ),
                      ),
                    );

                    if (updatedFoodItem != null) {
                      setState(() {
                        widget.foodList[widget.index] = updatedFoodItem;
                      });
                    }
                  },
                  icon: const Icon(Icons.arrow_forward_ios, size: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}