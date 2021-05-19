import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myfood/models/models.dart';
import 'package:myfood/services/services.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  Future <void> getTransactions()async{
    ApiReturnValue result = await TransactionServices.getTransactions();

    if(result.value != null){
      emit(TransactionLoaded(result.value));
    }else{
      emit(TransactionLoadingFailed(result.message));
    }
  }


  Future<bool> submitTransaction(Transaction transaction)async{
      ApiReturnValue result = await TransactionServices.submitTransaction(transaction);

      if(result.value != null){
        emit(TransactionLoaded((state as TransactionLoaded).transaction + [result.value]));
        return true;
      }else{
        return false;
      }
  }
}
