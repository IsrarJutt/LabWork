import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uiapp1/providers/product.dart';
import 'package:flutter/foundation.dart';
import './product_item.dart';
import '../providers/product_prov.dart';
import '../providers/product.dart';



class ProductsGrid extends StatelessWidget {
  final  bool showfavs;

  ProductsGrid(this.showfavs);
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Productss>(context);

    final products = showfavs?productsData.favouritItems: productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: products[i],
        //create: (c) => products[i],
            child: ProductItem(
            //  products[i].id,
            // products[i].title,
            // products[i].imgUrl),
          ),
          ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
