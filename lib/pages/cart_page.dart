import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:getx_flutter/models/product.dart';
import 'package:getx_flutter/pages/home_page.dart';

class CartPage extends StatefulWidget{
  late Product product;

  @override
  CartPageState createState() => CartPageState();

  CartPage(this.product);
}

class CartPageState extends State<CartPage>{
  late Product product;

  @override
  void initState() {
    super.initState();
    product = widget.product;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cart Page",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          child: const IconTheme(
              data: IconThemeData(color: Colors.black),
              child: Icon(
                Icons.arrow_back_ios,
              )),
          onTap: () {
            Get.to(HomePage());
          },
        ),
      ),
      body: body(),
    );
  }

  body(){
    return SingleChildScrollView(
      child: Container(),
    );
  }
}