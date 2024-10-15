import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe/Features/Home/Data/Model/food_model.dart';

class NameCountry extends StatefulWidget {
  final List<FoodItem> foodItem;
  final int index;
  const NameCountry({super.key, required this.foodItem, required this.index});

  @override
  State<NameCountry> createState() => _NameCountryState();
}

class _NameCountryState extends State<NameCountry> {
  @override
  Widget build(BuildContext context) {
    Widget _buildStarRating(double rating) {
      int fullStars = rating.floor();
      int halfStars = (rating - fullStars >= 0.5) ? 1 : 0;
      int emptyStars = 5 - fullStars - halfStars;

      return Row(
        children: [
          ...List.generate(fullStars, (index) => const Icon(Icons.star, color: Colors.amber)),
          ...List.generate(halfStars, (index) => const Icon(Icons.star_half, color: Colors.amber)),
          ...List.generate(emptyStars, (index) => const Icon(Icons.star_border, color: Colors.amber)),
        ],
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.foodItem[widget.index].name,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Row(
            children: [
              _buildStarRating(widget.foodItem[widget.index].averagerating)
            ]
        ),
        const SizedBox(height: 8,),
        Row(
          children: [
            const Icon(Icons.location_pin,size: 15,),
            const SizedBox(width: 5,),
            Text(
              widget.foodItem[widget.index].country,
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
