import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:ngdemo19/pages/home_page.dart';
import 'package:ngdemo19/pages/main_page.dart';
import 'package:ngdemo19/pages/splash_page.dart';
import 'package:ngdemo19/pages/starter_page.dart';
import 'package:ngdemo19/services/di_service.dart';

import 'config/root_binding.dart';

void main() async{
  await DIService.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainPage(),
      //initialBinding: RootBinding(),
    );
  }
}