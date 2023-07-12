import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prestige/Models/user_model.dart';

class UserController extends GetxController {
  Rx<User> user = User.anonymous.obs;
  final _connect = GetConnect();
  final userStorage = GetStorage();
  String baseUrl = "http://192.168.1.64:8000/";

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  Future fetchData() async {
    var token = userStorage.read('token');
    final response = await _connect.get("$baseUrl/users/me/", headers: {
      'Authorization': 'Bearer $token',
    });
    if (response.isOk) {
      user.value = User.fromJson(response.body);
    }
  }
}
