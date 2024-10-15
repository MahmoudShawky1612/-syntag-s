import 'package:recipe/Features/Home/Data/Model/food_model.dart';

abstract class RateStates{}

class InitialRateState extends RateStates{}

class LoadingRateState extends RateStates{}

class SuccessRateState extends RateStates{
  final List<FoodItem> food;

  SuccessRateState(this.food);

}

class ErrorRateState extends RateStates{

  final message;
  ErrorRateState(this.message);
}