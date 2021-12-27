import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';
import 'page2.dart';
import 'package:uifinal/page2.dart';
import 'Camera.dart';
import 'gallery.dart';
void main() {
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Pest Scout'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
          actions: <Widget>[
      IconButton(
      icon: const Icon(Icons.account_box_sharp),
      tooltip: 'Account',
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Account')));
        setState(() {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
        });
      },
    ),
    ]
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              alignment: Alignment.center,
              height: 630 ,
              width: 500,
              color: Colors.green,
                child: Column(
                  children: [
                    Container(
                        padding: EdgeInsets.fromLTRB(0,50,0,10),
                      height: 300,
                      width: 400,
                    child: Image(
                        image: NetworkImage(
                        'images/gogreen.jpg',
                    )
                    )
                    ),
                    SizedBox(height: 30,),
                    Container(
                        child: Text (
                            "Pest Scout App",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            decorationStyle: TextDecorationStyle.wavy,
                          fontSize: 50,
                          ),
                        )
                    ),
                    SizedBox(height: 30,),
            Container(
              margin: EdgeInsets.all(5),
              child: ElevatedButton(
                child: Text('Photo',style: TextStyle(fontSize: 20.0, color: Colors.black),),
                onPressed: () {
                  setState(() {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Page2()));
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
              ),
            )
            )
              ],
                )
            ),
          ),
        ],
      )
        // Center is a layout widget. It takes a single child and positions it in the middle of the parent.
      );
  }
}
