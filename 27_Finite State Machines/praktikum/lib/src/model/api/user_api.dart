import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:praktikum/src/model/model/user_model.dart';

class UserApi {
  Dio dio = Dio();

  Future<List<UserModel>> fetchUserData() async {
    try {
      final Response response = await dio.get('https://reqres.in/api/users');
      debugPrint(response.data.toString());

      final List data = response.data["data"];
      return data.map((e) => UserModel.fromJson(e)).toList();

    } on DioError catch (_) {
      rethrow;
    }
  }
}
