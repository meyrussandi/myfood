import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myfood/models/models.dart';
import 'package:myfood/services/services.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  Future<void> signIn(String email, String password)async{
    ApiReturnValue returnValue = await UserServices.signIn(email, password);

    if(returnValue.value != null){
      emit(UserLoaded(returnValue.value));
    }else{
      emit(UserLoadingFailed(returnValue.message));
    }
  }
}
