import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/nav_controller.dart';
import 'routes/routes.dart';

void main() {
  Get.put(NavController(), permanent: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Campus App',
      initialRoute: AppRoutes.home,
      getPages: AppRoutes.pages,
    );
  }
}

