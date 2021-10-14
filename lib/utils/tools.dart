import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Tools {
  static void showSnackBar(String title, String message) {
    Get.snackbar(title, message,
        icon: const Icon(Icons.favorite_sharp),
        snackPosition: SnackPosition.BOTTOM,
        borderColor: Colors.green,
        margin: const EdgeInsets.only(bottom: 4, left: 4, right: 4),
        borderWidth: 1,
        backgroundColor: Colors.white,);
  }
}
