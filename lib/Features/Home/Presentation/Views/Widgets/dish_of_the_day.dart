import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class DishOfTheDay extends StatelessWidget {
  const DishOfTheDay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.blueAccent.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 5,
              offset: const Offset(4, 6),
            ),
          ],
          image: const DecorationImage(image:
          NetworkImage('https://images.pexels.com/photos/1860208/pexels-photo-1860208.jpeg?cs=srgb&dl=cooked-food-1860208.jpg&fm=jpg'),
              fit: BoxFit.cover
          ),
          color: Colors.red,
          borderRadius: BorderRadius.circular(15),
        ),
        child: GradientText(
          "Dish Of The Day",
          gradientDirection: GradientDirection.btt,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25
          ),
          colors: const [
            Colors.teal,
            Colors.lightBlue,
            Colors.red
          ],
        )
    );
  }
}
