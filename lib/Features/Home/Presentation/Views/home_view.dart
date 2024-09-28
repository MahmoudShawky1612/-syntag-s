import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/Features/Home/Presentation/Manager/Cubit/food_cubit.dart';
import 'package:recipe/Features/Home/Presentation/Views/Widgets/dish_of_the_day.dart';
import 'package:recipe/Features/Home/Presentation/Views/search.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../Data/Model/food_model.dart';
import '../Manager/Cubit/food_states.dart';
import 'Widgets/new_dishes.dart';

class FoodListScreen extends StatefulWidget {
  @override
  _FoodListScreenState createState() => _FoodListScreenState();
}

class _FoodListScreenState extends State<FoodListScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FoodCubit>().fetchFoodData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FoodCubit, FoodStates>(
        builder: (context, state) {
          if (state is LoadingFoodState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SuccessFoodState) {
            final foodList = state.food;
            return Stack(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 130.0),
                    child: Column(
                      children: [
                        SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 10), // Space for the floating search bar
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Red container
                                const DishOfTheDay(),

                                const SizedBox(height: 23),

                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text("New Dishes"),
                                ),
                                const SizedBox(height: 15),

                                // Horizontal list
                                 NewDishes(foodList: foodList),

                                // Grid view with 2 columns
                                GridView.builder(
                                  shrinkWrap: true, // Ensures it fits in the SingleChildScrollView
                                  physics: const NeverScrollableScrollPhysics(), // Disable internal scrolling
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, // Two columns
                                    crossAxisSpacing: 10.0, // Spacing between columns
                                    mainAxisSpacing: 20.0, // Spacing between rows
                                    childAspectRatio: 0.79, // Aspect ratio
                                  ),
                                  itemCount: state.food.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            blurRadius: 5,
                                            spreadRadius: 2,
                                            offset: Offset(0, 3),
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                                            child: Image.network(
                                              state.food[index].image,
                                              fit: BoxFit.cover,
                                              height: 120,
                                              width: double.infinity,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                            child: Text(
                                              state.food[index].name,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 8), // Space before the icon
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                            child: Align(
                                              alignment: Alignment.centerRight, // Align icon to the end
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: Icon(Icons.arrow_forward_ios, size: 12),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                // Floating Search Bar
                Positioned(
                  top: 50,
                  left: 10,
                  right: 10,
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to the SearchScreen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchScreen(),
                        ),
                      );
                    },
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(30),
                      child: const TextField(
                        enabled: false, // Disable typing in this screen
                        decoration: InputDecoration(
                          hintText: 'Search recipes...',
                          contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                          suffixIcon: Icon(Icons.search, color: Colors.black),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else if (state is ErrorFoodState) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return const Center(child: Text('Unexpected state!'));
          }
        },
      ),
    );
  }
}