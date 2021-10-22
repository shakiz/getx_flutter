import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:getx_flutter/controllers/product_controller.dart';
import 'package:getx_flutter/models/product.dart';
import 'package:getx_flutter/pages/cart_page.dart';
import 'package:getx_flutter/pages/item_tile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ProductController productController = Get.put(ProductController());
  final inputController = TextEditingController();
  var productList = <Product>[].obs;
  var searchList = <Product>[].obs;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    FocusScope.of(context).requestFocus(FocusNode());
  }

  @override
  void dispose() {
    super.dispose();
    inputController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: SafeArea(
        child: Drawer(
          child: ListView(
            padding: const EdgeInsets.all(0.0),
            children: [
              const UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://www.pixsy.com/wp-content/uploads/2021/04/ben-sweet-2LowviVHZ-E-unsplash-1.jpeg'),
                ),
                accountEmail: Text('sakhawat@example.com'),
                accountName: Text(
                  'Sakhawat Hossain',
                  style: TextStyle(fontSize: 24.0),
                ),
                decoration: BoxDecoration(
                  color: Colors.black54,
                ),
              ),
              ListTile(
                title: const Text('Settings'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Category'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
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
          onTap: () {
            //on drawer menu pressed
            if(_scaffoldKey.currentState!.isDrawerOpen){
              //if drawer is open, then close the drawer
              Navigator.pop(context);
            }else{
              _scaffoldKey.currentState!.openDrawer();
              //if drawer is closed then open the drawer.
            }
          },
        ),
        actions: [
          InkWell(
            child: Container(
              margin: const EdgeInsets.only(right: 8, left: 8),
              child: const IconTheme(
                  data: IconThemeData(color: Colors.black),
                  child: Icon(
                    Icons.shopping_cart,
                  )),
            ),
            onTap: () {
              Get.to(CartPage());
            },
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
          Container(
            margin: const EdgeInsets.only(left: 8, right: 8),
            height: 48,
            child: ListTile(
              title: TextField(
                controller: inputController,
                decoration: InputDecoration(
                    labelText: 'Search Here',
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.black45),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.green),
                      borderRadius: BorderRadius.circular(8),
                    )),
              ),
              trailing: Wrap(
                spacing: 12, // space between two icons
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      onSearchTextChanged(inputController.text);
                    },
                  ), // icon-1
                  IconButton(
                    icon: const Icon(Icons.refresh),
                    onPressed: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      inputController.clear();
                      onSearchTextChanged('');
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 8, right: 8),
              child: Obx(() {
                if (productController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  productList = productController.productList;
                  if (searchList.length != 0 ||
                      inputController.text.isNotEmpty) {
                    return ListView.builder(
                      itemCount: searchList.length,
                      itemBuilder: (context, i) {
                        return Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                searchList[i].imageLink,
                              ),
                            ),
                            title: Text(
                                searchList[i].name + ' ' + searchList[i].brand),
                          ),
                          margin: const EdgeInsets.all(0.0),
                        );
                      },
                    );
                  } else {
                    return StaggeredGridView.countBuilder(
                      crossAxisCount: 2,
                      itemCount: productList.length,
                      itemBuilder: (context, index) {
                        return ItemTile(productList[index]);
                      },
                      staggeredTileBuilder: (index) =>
                          const StaggeredTile.fit(1),
                    );
                  }
                }
              }),
            ),
          )
        ],
      ),
    );
  }

  onSearchTextChanged(String text) async {
    print("Text : : " + text);
    searchList.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }
    for (var product in productList) {
      if (product.name.contains(text)) {
        searchList.add(product);
      }
    }
    setState(() {});
  }
}
