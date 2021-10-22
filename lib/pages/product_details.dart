import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:getx_flutter/models/product.dart';
import 'package:getx_flutter/pages/cart_page.dart';
import 'package:getx_flutter/pages/home_page.dart';
import 'package:getx_flutter/utils/tools.dart';

class ProductDetailsPage extends StatefulWidget {
  Product product;

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();

  ProductDetailsPage(this.product);
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  late Product product;
  bool selected = true;

  @override
  void initState() {
    super.initState();
    product = widget.product;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          product.name,
          style: const TextStyle(color: Colors.black),
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

  body() {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(top: 16, left: 0, right: 0),
        height: MediaQuery.of(context).size.height + 208,
        color: Colors.transparent,
        child: Column(
          children: <Widget>[
            InkWell(
              onTap: () {
                setState(() {
                  selected = !selected;
                });
              },
              child: Center(
                child: AnimatedContainer(
                  width: selected ? 224.0 : 180.0,
                  height: selected ? 180.0 : 224.0,
                  color: selected ? Colors.red : Colors.blue,
                  alignment: selected
                      ? Alignment.center
                      : AlignmentDirectional.topCenter,
                  duration: const Duration(seconds: 2),
                  curve: Curves.fastOutSlowIn,
                  child: Container(
                    width: 224,
                    height: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(24)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 4,
                          blurRadius: 2,
                          offset:
                              const Offset(0, 2), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Image.network(
                      product.imageLink,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 24, left: 0, right: 0),
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(32.0),
                    topLeft: Radius.circular(32.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 8,
                    blurRadius: 4,
                    offset: const Offset(0, 4), // changes position of shadow
                  ),
                ],
              ),
              child: Container(
                  margin: const EdgeInsets.only(left: 16, right: 16, top: 24),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Flexible(
                              flex: 5,
                              child: Text(
                                product.name,
                                textAlign: TextAlign.left,
                                style: const TextStyle(color: Colors.black),
                              )),
                          const SizedBox(
                            width: 8,
                          ),
                          Flexible(
                              flex: 1,
                              child: Center(
                                  child: Text(
                                "\$" + product.price,
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              )))
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        product.description,
                        textAlign: TextAlign.left,
                        maxLines: 6,
                        style: const TextStyle(
                          color: Colors.black45,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Brand Name: " + Tools.firstLetterOfStringCap(product.brand),
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            color: Colors.black45,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Category: " + Tools.firstLetterOfStringCap(product.productType),
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            color: Colors.black45,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Rating: " + product.rating.toString(),
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            color: Colors.black45,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: ElevatedButton(
                          onPressed: () {
                            Tools.showSnackBarWithButton("Added to cart", "${product.name} has been added to cart",CartPage());
                          },
                          child: const Text('Add To Cart'),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.pink,
                              fixedSize: const Size(300, 48),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                        ),
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
