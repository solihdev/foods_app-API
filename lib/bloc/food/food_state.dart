part of 'food_bloc.dart';

class FoodsState extends Equatable {
  Status? status;
  String? error;
  List<FoodData>? foods;

  FoodsState({
    this.status,
    this.error,
    this.foods,
  });

  FoodsState copyWith({
    Status? status,
    String? error,
    List<FoodData>? foods,
  }) {
    return FoodsState(
        error: error ?? this.error,
        foods: foods ?? this.foods,
        status: status ?? this.status);
  }

  @override
  List<Object?> get props => [status, error, foods];
}

enum Status {
  pure,
  loading,
  error,
  success
}
