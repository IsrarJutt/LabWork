import 'dart:html';

import 'package:flutter/material.dart';
import 'main.dart';
import 'gallery.dart';
import 'Camera.dart';
class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);
  @override
  _Page2State createState() => _Page2State();

}

class _Page2State extends State<Page2> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Pest Scout",
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          actions: [
            IconButton(
              alignment: Alignment.topRight,
              icon: Icon(Icons.arrow_back_ios),
              tooltip: 'Back',
              onPressed: () {
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));
                });
              },
            ),
          ],

        ),

        body: Container(
            decoration: const BoxDecoration(
              border: Border(
                left: BorderSide(width: 50, color: Colors.green),
                right: BorderSide(width: 50, color: Colors.green),
                bottom: BorderSide(width: 50, color: Colors.green),
              ),
            ),

            child: Row(
                children: [
                  Center(
                    child: Container(
                        alignment: Alignment.center,
                        color: Colors.white,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: Row(
                                    children: [
                                      SizedBox(width: 15,),
                                      MaterialButton(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage('images/gogreen.jpg'),
                                                fit: BoxFit.cover),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(80.0),
                                            child: Text("Camera"),


                                          ),
                                        ),
                                        // ),
                                        onPressed: () {
                                          setState(() {
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Camera()));

                                          });
                                        },
                                      ),
                                      SizedBox(width: 15,),
                                      MaterialButton(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage('images/gogreen.jpg'),
                                                fit: BoxFit.cover),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(80.0),
                                            child: Text("Gallery"),
                                          ),
                                        ),
                                        // ),
                                        onPressed: () {
                                          setState(() {
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Gallery()));

                                          });
                                        },
                                      ),
                                    ]
                                ),
                              ),

                            ]
                        )

                    ),

                  )
                ]
            )
        )
    );
  }
}