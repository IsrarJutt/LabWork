
import 'package:flutter/material.dart';
import 'main.dart';
import 'Camera.dart';
class Gallery extends StatefulWidget {
  const Gallery({Key? key}) : super(key: key);
  @override
  _GalleryState createState() => _GalleryState();

}

class _GalleryState extends State<Gallery> {
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
              icon: const Icon(Icons.arrow_back_ios),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        child: Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('images/gogreen.jpg'),
                                fit: BoxFit.cover),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Camera()));
                          });
                        },
                      ),
                      const SizedBox(width: 15,),
                      MaterialButton(
                        child: Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('images/gogreen.jpg'),
                                fit: BoxFit.cover),
                          ),
                        ),
// ),
                        onPressed: () {
                          setState(() {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Camera()));

                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  RaisedButton(
                    child: const Text(" Button 1 "),
                    onPressed: () {
                      setState(() {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Camera()));

                      });
                    },
                    color: const Color(0xffFF1744),
                    textColor: Colors.white,
                    splashColor: Colors.grey,
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  ),

                  RaisedButton(
                    child: const Text(" Button 2 "),
                    onPressed: () {
                      setState(() {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Camera()));

                      });
                    },
                    color: const Color(0xff0091EA),
                    textColor: Colors.white,
                    splashColor: Colors.grey,
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  ),
                ],
              )
              )
            ],
          ),
        )
    );
  }
}