import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/Features/Home/Data/Service/api_handler.dart';
import 'package:recipe/Features/Home/Presentation/Manager/Cubit/search_states.dart';

class SearchFoodCubit extends Cubit<SearchFoodStates>{
  final FoodService foodService;
  SearchFoodCubit(this.foodService) : super(InitialSearchFoodState());

  Future<void> searchFood(String query) async {
    try {
      emit(LoadingSearchFoodState());
      final food = await foodService.searchFoodData(query);
      emit(SuccessSearchFoodState(food));
    } catch (e) {
      emit(ErrorSearchFoodState("Error searching food: $e"));
    }
  }
}