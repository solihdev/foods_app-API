part of 'food_bloc.dart';

class FoodsState extends Equatable {
  Status? status;
  String? error;
  FoodData? foodData;

  FoodsState({
    this.status,
    this.error,
    this.foodData,
  });

  FoodsState copyWith({
    Status? status,
    String? error,
    FoodData? foodData,
  }) {
    return FoodsState(
        error: error ?? this.error,
        foodData: foodData ?? this.foodData,
        status: status ?? this.status);
  }

  @override
  List<Object?> get props => [status, error, foodData];
}

enum Status {
  pure,
  loading,
  error,
  success
}
