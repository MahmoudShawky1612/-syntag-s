import 'package:flutter/material.dart';
import 'package:recipe/Features/Home/Data/Model/food_model.dart';

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
              Positioned(
                top:10,
                child: IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon: const Icon(Icons.keyboard_arrow_left,
                  size: 45,
                  color: Colors.blue,)),
              ),
              Positioned(
                top: 260,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 260,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 80.0, horizontal: 15),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: MediaQuery.of(context).size.height,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Dish name and country
                            Text(
                              foodItem[index].name,
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              foodItem[index].country,
                              style: const TextStyle(
                                color: Colors.black54,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 20),

                            // Ingredients section
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

                            const SizedBox(height: 20),

                            // Instructions section
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
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // Dish image
              Positioned(
                top: 170,
                left: 100,
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
            ],
          ),
        ),
      ),
    );
  }
}
