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
              color: Colors.black87.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(4, 6),
            ),
          ],
          image: const DecorationImage(
              image:
          NetworkImage('https://images.pexels.com/photos/1860208/pexels-photo-1860208.jpeg?cs=srgb&dl=cooked-food-1860208.jpg&fm=jpg'),
              fit: BoxFit.cover
          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Stack(
          children: [
            Positioned(
              top: 10,
              left:10,
                child: Text(
                  "Dish",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  color: Colors.white,
                ),
                )),
            Positioned(
              top: 33,
              left:50,
                child: Text(
                    "Of",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.white,
                  ),
                )) ,
            Positioned(
              top: 55,
              left:70,
                child: Text(
                    "The",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.white,
                  ),
                )) ,
            Positioned(
              top: 78,
              left:95,
                child: Text(
                    "Day",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.white,
                  ),
                ))
          ],
        ),
    );
  }
}
