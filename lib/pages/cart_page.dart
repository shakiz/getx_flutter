import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:getx_flutter/pages/home_page.dart';

class CartPage extends StatefulWidget {

  @override
  CartPageState createState() => CartPageState();
}

class CartPageState extends State<CartPage> {

  @override
  void initState() {
    super.initState();
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

  body() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) => card(),
    );
  }

  card() {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
      child: Stack(
        children: [
          Container(
            padding:
                const EdgeInsets.only(top: 8, bottom: 8, left: 4, right: 4),
            decoration: BoxDecoration(
              color: const Color(0xFFCBEBEE),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Container(
                          margin: const EdgeInsets.only(left: 4),
                          height: 96,
                          width: 96,
                          child: Image.network(
                              "https://images-na.ssl-images-amazon.com/images/I/71sKzRQtXtL._AC_UL600_SR600,600_.png"),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Product Title Here",
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Product Description Here",
                            style:
                                TextStyle(fontSize: 14, color: Colors.black45),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: const Icon(Icons.add),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Icon(Icons.remove),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
