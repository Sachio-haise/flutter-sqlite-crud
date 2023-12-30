import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/pages/main_home_page.dart';
void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Navigation",
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.zoom,
      initialRoute: "/",
      getPages: [
        GetPage(name: '/', page:() =>  HomePage()),
      ],
      // Get.parameters, transition: Transition.leftToRight
    );
  }
}
