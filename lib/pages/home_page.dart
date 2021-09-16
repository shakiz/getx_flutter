import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        elevation: 0,
        leading: Icon(
          Icons.arrow_back_ios,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'ShopX',
                    style: TextStyle(
                        fontFamily: 'avenir',
                        fontSize: 24,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                IconButton(
                    iconSize: 24,
                    icon: const Icon(Icons.view_list_rounded),
                    onPressed: () {}),
                IconButton(
                    iconSize: 20,
                    icon: const Icon(Icons.grid_view),
                    onPressed: () {}),
              ],
            ),
          ),
          Expanded(
            child: StaggeredGridView.countBuilder(
              crossAxisCount: 2,
              itemCount: 100,
              itemBuilder: (context, index) => Container(
                color: Colors.blueGrey,
                margin: const EdgeInsets.only(
                    left: 16, right: 16, top: 16, bottom: 16),
                height: 100,
                width: 200,
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        shape: BoxShape.rectangle)),
              ),
              staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
            ),
          )
        ],
      ),
    );
  }
}
