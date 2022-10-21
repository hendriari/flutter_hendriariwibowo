import 'package:flutter/material.dart';
import 'package:praktikum/src/model/api/user_api.dart';
import 'package:praktikum/src/model/model/user_model.dart';
import 'package:praktikum/src/util/finit_state.dart';

class UserViewModel with ChangeNotifier {
  UserFinitState _state = UserFinitState.iddle;

  UserFinitState get state => _state;

  final UserApi dioApi = UserApi();

  late List<UserModel> _results;

  List<UserModel> get results => _results;

  void changeState(UserFinitState s) {
    _state = s;
    notifyListeners();
  }

  Future<void> getUsersData() async {
    changeState(UserFinitState.loading);

    try {
      var hasil = await dioApi.fetchUserData();
      _results = hasil;
      notifyListeners();

      changeState(UserFinitState.success);
    } catch (_) {
      changeState(UserFinitState.error);
    }
  }
}
