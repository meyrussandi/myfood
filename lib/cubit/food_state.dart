part of 'food_cubit.dart';

@immutable
abstract class FoodState extends Equatable {
  const FoodState();
}

class FoodInitial extends FoodState {
  @override
  List<Object> get props => throw UnimplementedError();

}

class FoodLoaded extends FoodState{
  final List<Food> food;

  FoodLoaded(this.food);

  @override
  List<Object> get props => [food];
}

class FoodLoadingFailed extends FoodState{
  final String message;

  FoodLoadingFailed(this.message);
  @override
  List<Object> get props => [message];
}