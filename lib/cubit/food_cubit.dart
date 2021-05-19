import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:myfood/models/models.dart';
import 'package:myfood/services/services.dart';

part 'food_state.dart';

class FoodCubit extends Cubit<FoodState> {
  FoodCubit() : super(FoodInitial());

  Future<List<Food>> getFoods()async{
    ApiReturnValue result = await FoodServices.getFoods();

    if(result.value != null){
      emit(FoodLoaded(result.value));
    }else{
      emit(FoodLoadingFailed(result.message));
    }
  }
}
