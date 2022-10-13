import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_bloc/data/bloc/user_state.dart';
import 'package:task_bloc/data/model/user_model.dart';

class UserBloc extends Cubit<UserState> {
  UserBloc() : super(InitialState());

  late UserModel users;

  Future setNewUser(UserModel users) async {
    emit(LoadingState());
    final userData = await SharedPreferences.getInstance();
    await userData.setString("username", users.username);
    await userData.setString("telephone", users.telephone);
    await userData.setString("email", users.email);
    await userData.setString("password", users.password);
  }
  
  Future<UserModel?> getUserData() async {
    emit(SuccessState(users: users));
    final dataUser = await SharedPreferences.getInstance();
    final username = dataUser.getString("username");
    final telephone = dataUser.getString("telephone");
    final email = dataUser.getString("email");
    final password = dataUser.getString("password");
    if (username != null &&
        telephone != null &&
        email != null &&
        password != null) {
      return UserModel(
          username: username,
          telephone: telephone,
          email: email,
          password: password);
    }
    return null;
  }

  Future logout() async {
    emit(DeleteState());
    final user = await SharedPreferences.getInstance();
    user.clear();
  }
}
