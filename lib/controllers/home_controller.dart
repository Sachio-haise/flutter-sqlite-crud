import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
   var count = RxInt(0);
   increment() => count++;
}
