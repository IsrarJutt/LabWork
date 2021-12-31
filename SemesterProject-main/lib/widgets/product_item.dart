import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uiapp1/providers/product.dart';

import '../camera.dart';
import '../screens/products_detail_screen.dart';
import '../providers/product.dart';

class ProductItem extends StatefulWidget {
  // final String id;
  // final String title;
  // final String imgUrl;
  //
  // ProductItem(this.id, this.title, this.imgUrl);

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
     final Products= Provider.of<product>(context,listen: false);

    return  ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(ProductDetailScreen.routeName,arguments: Products.id,);
             //  Navigator.push(context,
             //      MaterialPageRoute(builder: (context) => DetailsImages()));
            },
            child: Image.network(
              Products.imgUrl,
              fit: BoxFit.cover,
            ),
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black54,
            leading: Consumer<product>(builder: (ctx,Products, _)=>IconButton(
              icon: Icon (Products.isFavourite ? Icons.favorite: Icons.favorite_border,),
              onPressed: () {
               Products.toggleFavouriteStatus();
              },
              color: Theme.of(context).accentColor,
            ),),
            title: Text(
              Products.title,
              textAlign: TextAlign.center,
            ),
            trailing: IconButton(
              icon: Icon(Icons.camera_alt),
              onPressed: () {
                setState(() {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Tensorflow()));
                });
              },
              color: Theme.of(context).accentColor,
            ),
          ),
        ),

    );
  }
}
