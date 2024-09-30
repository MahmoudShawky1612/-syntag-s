import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/Features/Home/Data/Service/api_handler.dart';
import 'package:recipe/Features/Home/Presentation/Manager/Cubit/food_cubit.dart';

import 'Features/Search/Presentation/Manager/Cubit/search_cubit.dart';
import 'Features/Home/Presentation/Views/Widgets/detailed_dish.dart';
import 'Features/Home/Presentation/Views/home_view.dart';
//https://postimg.cc/gallery/T3XkzVL/d0c02eab
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(

      providers: [
        // create: (context) => FoodCubit(FoodService()),
        BlocProvider<FoodCubit>(
          create: (BuildContext context) => FoodCubit(FoodService()),
        ),

        BlocProvider<SearchFoodCubit>(
          create: (BuildContext context) => SearchFoodCubit(FoodService()),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FoodListScreen()
      ),
    );
  }
}

