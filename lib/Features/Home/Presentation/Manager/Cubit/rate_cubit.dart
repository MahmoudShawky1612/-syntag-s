import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/Features/Home/Presentation/Manager/Cubit/rate_states.dart';

import '../../../Data/Service/api_handler.dart';

class RateCubit extends Cubit<RateStates>{
  final FoodService foodService;
  RateCubit(this.foodService) : super(InitialRateState());
  Future<void> rateFood(String foodId, int rate) async {
    try {
      emit(LoadingRateState());
      final updatedFood = await foodService.rateFood(foodId, rate);
      emit(SuccessRateState([updatedFood])); // Emit updated food
    } catch (e) {
      emit(ErrorRateState("Error rating food $e"));
    }
  }
}
