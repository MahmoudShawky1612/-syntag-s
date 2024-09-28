import 'package:recipe/Features/Home/Data/Model/food_model.dart';

abstract class SearchFoodStates{}

class InitialSearchFoodState extends SearchFoodStates{}

class LoadingSearchFoodState extends SearchFoodStates{}

class SuccessSearchFoodState extends SearchFoodStates{
  final List<FoodItem> food;
  SuccessSearchFoodState(this.food);

}

class ErrorSearchFoodState extends SearchFoodStates{

  final message;
  ErrorSearchFoodState(this.message);
}