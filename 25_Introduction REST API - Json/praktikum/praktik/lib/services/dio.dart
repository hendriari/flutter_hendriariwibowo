import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:praktik/services/user_model.dart';

class DioServices {
  final Dio dio = Dio();
  //
  // Future fetchUser() async {
  //   try {
  //     final Response response = await Dio().get('https://reqres.in/api/users');
  //     debugPrint(response.data.toString());
  //     return response.data.toString();
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //
  Future<UserModel?> fetchUser() async {
    try {
      final Response response = await Dio().get('https://reqres.in/api/users');
      debugPrint(response.data.toString());

      return UserModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future createUser({
    required String name,
    required String job,
  }) async {
    try {
      final Response response = await dio.post(
        'https://reqres.in/api/users/',
        data: {'name': name, 'job': job},
      );
      debugPrint(response.data.toString());
      return response.data.toString();
    } catch (e) {
      rethrow;
    }
  }

  Future updateUser({
    required String name,
    required String job,
  }) async {
    try {
      final Response response = await dio.put(
        'https://reqres.in/api/users/1',
        data: {'name': name, 'job': job},
      );

      debugPrint(response.data.toString());

      return response.data.toString();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<String> deleteUser() async {
    try {
      final Response response = await dio.delete('https://reqres.in/api/users');
      debugPrint(response.data.toString());

      return response.data.toString();
    } catch (e) {
      rethrow;
    }
  }
}

