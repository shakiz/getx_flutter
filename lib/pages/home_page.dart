import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:getx_flutter/controllers/product_controller.dart';
import 'package:getx_flutter/pages/item_tile.dart';
import 'package:getx_flutter/utils/tools.dart';

class HomePage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "ShopX",
          style: TextStyle(
              fontFamily: 'avenir',
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w900),
        ),
        elevation: 0,
        leading: InkWell(
          child: const IconTheme(
              data: IconThemeData(color: Colors.black),
              child: Icon(
                Icons.menu,
              )),
          onTap: () {},
        ),
        actions: [
          InkWell(
            child: Container(
              margin: const EdgeInsets.only(right: 8),
              child: const IconTheme(
                  data: IconThemeData(color: Colors.black),
                  child: Icon(
                    Icons.shopping_cart,
                  )),
            ),
            onTap: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          const Padding(
            padding: EdgeInsets.all(4),
            child: Text("Select Your Favorites Product",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'avenir',
                    fontSize: 32,
                    color: Colors.black,
                    fontWeight: FontWeight.w600)),
          ),
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 8, right: 8),
              child: Obx(() {
                if (productController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    itemCount: productController.productList.length,
                    itemBuilder: (context, index) {
                      return ItemTile(productController.productList[index]);
                    },
                    staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
                  );
                }
              }),
            ),
          )
        ],
      ),
    );
  }
}
