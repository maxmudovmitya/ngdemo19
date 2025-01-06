import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/splash_controller.dart';
// import '../conttrollers/splash_controller.dart';
import '../views/item_random_user.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    Get.find<SplashController>().initScrollListener();
    Get.find<SplashController>().loadRandomUserList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Random Users - GetX(3)"),
      ),
      body: GetX<SplashController>(
        init: SplashController(),
        builder: (controller) {
          return Stack(
            children: [
              ListView.builder(
                controller: controller.scrollController,
                itemCount: controller.userList.length,
                itemBuilder: (ctx, index) {
                  return itemOfRandomUser(controller.userList[index], index);
                },
              ),
              controller.isLoading.value
                  ? const Center(
                child: CircularProgressIndicator(),
              )
                  : const SizedBox.shrink(),
            ],
          );
        },
      ),
    );
  }
}