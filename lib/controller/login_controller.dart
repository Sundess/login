import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prestige/Views/main_screen_page.dart';
import 'package:prestige/controller/job_controller.dart';
import 'package:prestige/Models/user_controller.dart';
import 'package:prestige/network/userNetworking.dart';

class LoginController extends GetxController {
  final userStorage = GetStorage();
  UserController userController = UserController();
  JobController jobController = JobController();

  // final connect = GetConnect();
  // String baseUrl = "http://192.168.1.64:8000/";

  Future login(email, password) async {
    Response<dynamic> response = await loginUser(email, password);
    if (response.isOk) {
      var token = response.body['access'];
      await userStorage.write('token', token);
      await JobController().fetchJobData();
      navigateHome();
    } else {
      Get.snackbar(
        "Invalid Credintals",
        "Please enter correct credintals.",
        icon: const Icon(Icons.person, color: Colors.redAccent),
        margin: const EdgeInsets.all(15),
        // padding: EdgeInsets.only(bottom: 12),
        snackPosition: SnackPosition.TOP,
      );
    }

    // final response = await connect.post("$baseUrl/users/login/", {
    //   "email": email,
    //   "password": password,
    // });
    // if (response.isOk) {
    //   var token = response.body['access'];
    //   await userStorage.write('token', token);
    //   // userController.fetchData;
    //   JobController().fetchJobData();
    //   navigateHome();
    // } else {
    //   Get.snackbar(
    //     "Invalid Credintals",
    //     "Please enter correct credintals.",
    //     icon: const Icon(Icons.person, color: Colors.redAccent),
    //     margin: const EdgeInsets.all(15),
    //     // padding: EdgeInsets.only(bottom: 12),
    //     snackPosition: SnackPosition.TOP,
    //   );
    // }
  }

  void navigateHome() {
    // Get.to(() => MainScreen());
    Get.offAll(() => const MainScreen());
  }
}
