import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_flutter/models/product.dart';
import 'package:getx_flutter/pages/home_page.dart';

class ProductDetailsPage extends StatefulWidget {
  Product product;

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();

  ProductDetailsPage(this.product);
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  late Product product;
  @override
  void initState() {
    if (widget.product != null) {
      this.product = widget.product;
    }
  }

  @override
  void didChangeDependencies() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        elevation: 0,
        leading: InkWell(
          child: const Icon(
            Icons.arrow_back_ios,
          ),
          onTap: () {
            Get.to(HomePage());
          },
        ),
      ),
      body: body(),
    );
  }

  body() {
    return Container(
      child: Stack(
        children: <Widget>[

        ],
      ),
    );
  }
}

