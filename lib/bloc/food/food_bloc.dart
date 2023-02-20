import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foods_app_api/data/models/food_model/food_model.dart';
import 'package:foods_app_api/data/models/my_response/my_response.dart';
import 'package:foods_app_api/data/repositories/food_repository.dart';

part 'food_event.dart';

part 'food_state.dart';

class FoodsBloc extends Bloc<FoodsEvent, FoodsState> {
  FoodsBloc({required this.foodRepo}) : super(FoodsState()) {
    on<FoodsEvent>(getData);
  }

  final FoodRepo foodRepo;

  getData(FoodsEvent event, emit) async {
    emit(state.copyWith(status: Status.loading));
    MyResponse myResponse = await foodRepo.getAllFoods(
        health: event.health,
        category: event.category,
        nutritionType: event.nutritionType);
    if (myResponse.error.isEmpty) {
      emit(state.copyWith(foods: myResponse.data, status: Status.success));
    } else {
      emit(state.copyWith(error: myResponse.error, status: Status.error));
    }
  }
}
