part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserInitial extends UserState {
  @override
  List<Object> get props => [];
}


class UserLoaded extends UserState{
  final User user;

  UserLoaded(this.user);

  @override
  List<Object> get props => [user];
}

class UserLoadingFailed extends UserState{
  final String message;

  UserLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}