import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';
// import '../conttrollers/home_controller.dart';
import '../models/random_user_list_res.dart';
import '../services/http_service.dart';
import '../views/item_random_user.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
    _controller.initScrollListener();
    _controller.loadRandomUserList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Random Users - GetX(1)"),
      ),
      body: GetBuilder<HomeController>(
        builder: (controller) {
          return Stack(
            children: [
              ListView.builder(
                controller: _controller.scrollController,
                itemCount: _controller.userList.length,
                itemBuilder: (ctx, index) {
                  return itemOfRandomUser(_controller.userList[index], index);
                },
              ),
              _controller.isLoading
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