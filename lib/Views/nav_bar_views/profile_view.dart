import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prestige/login_screen.dart';
import 'package:prestige/Models/user_controller.dart';

class ProfileView extends StatelessWidget {
  ProfileView({Key? key}) : super(key: key);
  final userStorage = GetStorage();

  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UserController());
    return Center(
      child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${userController.user.value.firstName}'),
            Text('${userController.user.value.lastName}'),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                height: 50,
                width: double.maxFinite,
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color.fromRGBO(189, 60, 43, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    userStorage.remove('token');
                    Get.off(() => LoginScreen());
                  },
                  child: const Text(
                    'Log Out',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
