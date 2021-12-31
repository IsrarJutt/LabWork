import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:uiapp1/providers/product_prov.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-details';

  // final String title;
  //
  // ProductDetailScreen(this.title);
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute
        .of(context)!
        .settings
        .arguments as String;
    final LoadProducts = Provider
        .of<Productss>(context).findById(productId);
       
    return Scaffold(
      appBar: AppBar(
        title: Text(
            LoadProducts.title
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 250,
              width: double.infinity,
              child: Image.network(
                LoadProducts.imgUrl,
                fit: BoxFit.cover,
              ),
            ),


            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                LoadProducts.description,
                textAlign: TextAlign.center,
                softWrap: true,

                style: TextStyle(fontSize: 15,color: Colors.black87),
              ),
            )
          ],
        ),
      ),
    );

      // body: Center(
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: <Widget>[
      //       Padding(
      //         padding: const EdgeInsets.all(15.0),
      //         // child: Text(
      //         //   "Image Slider Example in Flutter using Carousel_Pro Library",
      //         //   style: TextStyle(
      //         //       color: Colors.blue,
      //         //       fontSize: 25.0,
      //         //       letterSpacing: 2,
      //         //       fontStyle: FontStyle.italic,
      //         //       fontWeight: FontWeight.bold),
      //         // ),
      //       ),
      //       SizedBox(
      //           height: 300.0,
      //           width: double.infinity,
      //           child: Carousel(
      //             images: const [
      //               AssetImage('images/bact8.jpg'),
      //               AssetImage('images/bact149.png'),
      //               AssetImage('images/bact275.jpg'),
      //               AssetImage('images/bact154.jpg'),
      //               AssetImage('images/bact11.jpg'),
      //               AssetImage('images/bact16.jpg'),
      //               AssetImage('images/bact106.jpg'),
      //
      //               AssetImage('images/bact107.jpg'),
      //
      //             ],
      //             dotColor: Colors.red,
      //           )),
      //     ],
      //   ),
      // ),

  }
}
