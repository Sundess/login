import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prestige/Views/nav_bar_views/home_view.dart';
import 'package:prestige/Views/nav_bar_views/work_view.dart';
import 'package:prestige/Views/nav_bar_views/notification_view.dart';
import 'package:prestige/Views/nav_bar_views/profile_view.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List pages = [
      HomeView(),
      WorkView(),
      NotificationView(),
      ProfileView(),
    ];

    RxInt currentIndex = 0.obs;

    return SafeArea(
      child: Obx(
        () => Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: const Color(0xffF2F2F7),
          body: pages[currentIndex.value],
          bottomNavigationBar: SizedBox(
            height: 72,
            child: BottomNavigationBar(
              currentIndex: currentIndex.value,
              onTap: (value) {
                currentIndex.value = value;
              },
              elevation: 0,
              backgroundColor: Colors.white,
              selectedItemColor: const Color(0xff24BE67),
              unselectedItemColor: Colors.black,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              iconSize: 32,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: CustomBottomNavBarItem(
                    currentIndex: currentIndex,
                    indexNumber: 0,
                    icon: const Icon(Icons.home_outlined),
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: CustomBottomNavBarItem(
                    currentIndex: currentIndex,
                    indexNumber: 1,
                    icon: const Icon(Icons.work_outline),
                  ),
                  label: 'Work ',
                ),
                BottomNavigationBarItem(
                  icon: CustomBottomNavBarItem(
                    currentIndex: currentIndex,
                    indexNumber: 2,
                    icon: const Icon(
                      Icons.notifications_outlined,
                    ),
                  ),
                  label: 'Notification',
                ),
                BottomNavigationBarItem(
                  icon: SizedBox(
                    height: 40,
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 17,
                          backgroundColor: currentIndex.value == 3
                              ? const Color(0xff24BE67)
                              : Colors.transparent,
                          child: const CircleAvatar(
                            radius: 15.5,
                            backgroundColor: Colors.transparent,
                            backgroundImage: NetworkImage(
                                'https://images.unsplash.com/photo-1614350258806-f1db4ff18b05?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
                          ),
                        ),
                        const SizedBox(height: 2),
                        currentIndex.value == 3
                            ? const CircleAvatar(
                                radius: 2,
                                backgroundColor: Color(0xff24BE67),
                              )
                            : const CircleAvatar(radius: 0),
                      ],
                    ),
                  ),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomBottomNavBarItem extends StatelessWidget {
  final Icon icon;
  final int indexNumber;
  const CustomBottomNavBarItem({
    Key? key,
    required this.currentIndex,
    required this.icon,
    required this.indexNumber,
  }) : super(key: key);

  final RxInt currentIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Column(
        children: [
          icon,
          currentIndex.value == indexNumber
              ? const CircleAvatar(
                  radius: 2,
                  backgroundColor: Color(0xff24BE67),
                )
              : const CircleAvatar(radius: 0),
        ],
      ),
    );
  }
}
