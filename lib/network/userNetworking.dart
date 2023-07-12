import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';
import 'package:prestige/Views/main_screen_page.dart';

String baseUrl = "http://192.168.1.64:8000/";
final connect = GetConnect();

verifyUser(String token) async {
  final response =
      await connect.post("$baseUrl/users/token/verify/", {"token": token});
  if (response.isOk) {
    Get.to(() => const MainScreen());
  }
}

Future loginUser(String email, String password) async {
  final response = await connect.post("$baseUrl/users/login/", {
    "email": email,
    "password": password,
  });
  return response;
}
