import 'package:recipe/Features/Home/Data/Model/food_model.dart';

abstract class FoodStates{}

class InitialFoodState extends FoodStates{}

class LoadingFoodState extends FoodStates{}

class SuccessFoodState extends FoodStates{
  final List<FoodItem> food;

  SuccessFoodState(this.food);

}

class ErrorFoodState extends FoodStates{

  final message;
  ErrorFoodState(this.message);
}