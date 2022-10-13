import 'package:task_bloc/data/model/user_model.dart';

abstract class UserState {}

class InitialState extends UserState {}

class LoadingState extends UserState {}

class SuccessState extends UserState {
  final UserModel users;

  SuccessState({
    required this.users,
  });
}

class DeleteState extends UserState {}
