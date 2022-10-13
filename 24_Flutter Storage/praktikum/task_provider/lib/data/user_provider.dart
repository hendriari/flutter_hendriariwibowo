import 'package:flutter/cupertino.dart';
import 'package:praktik/data/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider with ChangeNotifier {

  Future setNewUsers({required UserModel users}) async {
    final userData = await SharedPreferences.getInstance();
    await userData.setString("username", users.username);
    await userData.setString("telephone", users.telephone);
    await userData.setString("email", users.email);
    await userData.setString("password", users.password);
    notifyListeners();
  }

  Future<UserModel> getUserData() async {
    final dataUser = await SharedPreferences.getInstance();
    final username = dataUser.getString("username");
    final telephone = dataUser.getString("telephone");
    final email = dataUser.getString("email");
    final password = dataUser.getString("password");
    notifyListeners();
    return UserModel(
      username: username!,
      telephone: telephone!,
      email: email!,
      password: password!,
    );
  }

  Future logout() async {
    final user = await SharedPreferences.getInstance();
    user.clear();
    notifyListeners();
  }
}
