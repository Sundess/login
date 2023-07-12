import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prestige/Models/job_model.dart';

class JobController extends GetxController {
  @override
  void onInit() {
    fetchJobData();
    super.onInit();
  }

  RxList<Job> jobs = <Job>[].obs;

  String baseUrl = "http://192.168.1.64:8000/";
  final _connect = GetConnect();
  final userStorage = GetStorage();

  Future<void> fetchJobData() async {
    var token = userStorage.read('token');

    final response = await _connect
        .get("$baseUrl/jobs/", headers: {"Authorization": 'Bearer $token'});
    if (response.isOk) {
      for (Map<String, dynamic> jobData in response.body) {
        jobs.add(Job.fromJson(jobData));
        // print(jobData);
      }
      jobs.refresh();
    } else {
      debugPrint(response.bodyString);
    }
  }
}
