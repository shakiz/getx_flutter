import 'package:blinking_text/blinking_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_flutter/models/product.dart';
import 'package:getx_flutter/pages/product_details.dart';
import 'package:getx_flutter/utils/tools.dart';

class ItemTile extends StatelessWidget {
  final Product product;

  const ItemTile(this.product);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => ProductDetailsPage(product))
        // );
        Get.to(ProductDetailsPage(product));
      },
      child: Card(
        elevation: 2,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16.0),
          ),
        ),
        margin: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 128,
                    width: double.infinity,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.network(
                      product.imageLink,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: Obx(() => CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: product.isFavorite.value
                                ? const Icon(Icons.favorite_rounded)
                                : const Icon(Icons.favorite_border),
                            onPressed: () {
                              product.isFavorite == false ?
                              Tools.showSnackBar("Add to favorites",product.name+" has been added to favorites.")
                              : Tools.showSnackBar("Removed from favorites",product.name+" has been removed from favorites.");
                              product.isFavorite.toggle();
                            },
                          ),
                        )),
                  )
                ],
              ),
              const SizedBox(height: 8),
              Text(
                product.name,
                maxLines: 2,
                style: const TextStyle(
                    fontFamily: 'avenir',
                    fontWeight: FontWeight.w800,
                    fontSize: 16),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              if (product.rating != null)
                Container(
                  padding: const EdgeInsets.only(top:4, bottom: 4, left: 8, right: 8),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        product.rating.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                      const Icon(
                        Icons.star,
                        size: 16,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 8),
              Container(
                child: Text('Price\$${product.price.toString()}',
                    style:
                    const TextStyle(fontSize: 12, fontFamily: 'avenir')),
              ),
              Container(
                child: BlinkText('Discount Price \$${product.price}',
                    duration: const Duration(seconds: 1),
                    beginColor: Colors.black,
                    endColor: Colors.orange,
                    style:
                    const TextStyle(fontSize: 14, fontFamily: 'avenir')),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
