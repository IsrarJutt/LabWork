import 'package:flutter/material.dart';
import 'package:uiapp1/index.dart';

import 'constant.dart';
import 'email.dart';

class login extends StatefulWidget {
  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text('Login ',style: TextStyle(color: Colors.white60),),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.close_rounded,
              color: Colors.white54,
            ),
            onPressed: () {
              setState(() {
                Navigator.pop(context,
                    MaterialPageRoute(builder: (context) => InputPage()));
              });
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: Text(
                'Hello There',
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w500,
                    fontSize: 30),
              ),
            ),
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                child: Text(
                  'Unlimited access to all features after Signing in ',
                  style: TextStyle(fontSize: 20),
                )),
            Row(
              children: [
                IconButton(
                    icon: Icon(
                  Icons.check,
                  color: Colors.green,
                ), onPressed: () {  },),
                Text(
                  'Unlimited Snaps',
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w300,
                      fontSize: 20),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                    icon: Icon(
                  Icons.check,
                  color: Colors.green,
                ), onPressed: () {  },),
                Text(
                  'Unlock Full Experience',
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w300,
                      fontSize: 20),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                    icon: Icon(
                      Icons.check,
                      color: Colors.green,
                    ), onPressed: () {  },),
                Text(
                  'Review Your Crop',
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w300,
                      fontSize: 20),
                ),
              ],
            ),
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                child: Text(
                  'Sign in PestScout',
                  style: TextStyle(fontSize: 20),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: <Widget>[
                Container(
                  height: 30,
                  width: 150,
                  color: Colors.white,
                  child: ElevatedButton.icon(
                    label: Text(
                      'Email',
                      style: TextStyle(color: Colors.white60),
                    ),
                    icon: Icon(Icons.mark_email_unread_outlined,
                        size: 16, color: Colors.white),
                    onPressed: () {
                      setState(() {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => email()));
                      });
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
