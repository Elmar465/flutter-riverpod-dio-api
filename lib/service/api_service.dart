import 'package:dio/dio.dart';
import 'dart:convert';
import '../model/user_model.dart';

class ApiService {
  Future<List<User>> getUser() async {
    try {
      String baseUrl = 'https://fakestoreapi.com';
      var response = await Dio().get('$baseUrl/users');
      var users = (response.data as List);
      List<User> allUser =
          users.map((userData) => User.fromJson(userData)).toList();
      if (response.statusCode == 200) {
        return allUser;
      }
      return [];
    } on DioError catch (e) {
      return Future.error(e.message.toString());
    }
  }
}
