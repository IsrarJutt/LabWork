import 'package:flutter/material.dart';
import 'page2.dart';
class Camera extends StatefulWidget {
  const Camera({Key? key}) : super(key: key);
  @override
  _CameraState createState() => _CameraState();

}

class _CameraState extends State<Camera> {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pest Scout'),

        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Column(
                    children: [
                      Material(
                        // needed
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Page2()));
                            }
                            );
                          }, // needed
                          child: Image.asset(
                            "images/gogreen.jpg",
                            width: 250,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),


                    ]
                ),
              ),
              SizedBox(width: 16,),
              Column(
                  children:[
                    Material(
                      // needed
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Page2()));
                          });
                        }, // needed
                        child: Image.asset(
                          "images/gogreen.jpg",
                          width: 250,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ]
              )
            ],
          ),
        )
    );
  }
}