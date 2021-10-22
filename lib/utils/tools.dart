import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Tools {
  static void showSnackBar(String title, String message) {
    Get.snackbar(
      title,
      message,
      icon: const Icon(Icons.favorite_sharp),
      snackPosition: SnackPosition.BOTTOM,
      borderColor: Colors.green,
      margin: const EdgeInsets.only(bottom: 4, left: 4, right: 4),
      borderWidth: 1,
      backgroundColor: Colors.white,
    );
  }

  static void showSnackBarWithButton(
      String title, String message, dynamic page) {
    Get.snackbar(
      title,
      message,
      icon: const Icon(Icons.shopping_cart),
      snackPosition: SnackPosition.BOTTOM,
      borderColor: Colors.green,
      margin: const EdgeInsets.only(bottom: 4, left: 4, right: 4),
      borderWidth: 1,
      mainButton: TextButton(
          onPressed: () {
            Get.to(page);
          },
          child: const Text("View Cart")),
      backgroundColor: Colors.white,
    );
  }

  static void showBottomSheet(String title, String message) {
    Get.bottomSheet(
      Container(
          height: 150,
          color: Colors.greenAccent,
          child: Column(
            children: const [
              Text('Hii 1', textScaleFactor: 2),
            ],
          )),
      barrierColor: Colors.red[50],
      isDismissible: false,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35),
          side: const BorderSide(width: 5, color: Colors.black)),
      enableDrag: false,
    );
  }

  static String firstLetterOfStringCap(String mainStr) {
    return mainStr[0].toUpperCase() + mainStr.substring(1);
  }
}
