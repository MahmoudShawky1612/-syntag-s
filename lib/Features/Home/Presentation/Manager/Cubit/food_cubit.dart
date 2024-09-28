import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/Features/Home/Data/Service/api_handler.dart';
import 'package:recipe/Features/Home/Presentation/Manager/Cubit/food_states.dart';

class FoodCubit extends Cubit<FoodStates>{

  final FoodService foodService;
  FoodCubit(this.foodService) : super(InitialFoodState());


  Future<void> fetchFoodData () async {
    try{
      emit(LoadingFoodState());
      final food = await foodService.fetchFoodData();
      emit(SuccessFoodState(food));
    }catch(e){
      print(e);
      emit(ErrorFoodState("Error fetching food $e"));

    }
  }

}























