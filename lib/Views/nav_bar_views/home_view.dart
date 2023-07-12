import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prestige/components/custom_tile.dart';
import 'package:prestige/controller/job_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final jobController = Get.put(JobController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                prefixIcon: const Icon(
                  Icons.search_outlined,
                  size: 32,
                  color: Colors.black,
                ),
                hintText: 'Search for jobs',
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
              // padding: EdgeInsets.symmetric(vertical: 16),
              child: Obx(
            () => ListView.builder(
              itemCount: jobController.jobs.length,
              itemBuilder: (context, index) {
                final job = jobController.jobs[index];
                return CustomTile(
                  companyLogo: 'assets/imageBox.png',
                  companyName: 'job.companyName',
                  companyAddress: '505 GEORGE STREET, Sydney',
                  jobInfo: 'Cook needed at Hungry Jacks',
                  jobPay: job.payPerHour,
                  jobTitle: 'Cook',
                  jobHours: '15.00',
                  jobDate: job.startDate,
                  jobShiftTime: 'Morning Shift, 8:00 - 1:00PM',
                );
              },
            ),
          )),
        ],
      ),
    );
  }
}
